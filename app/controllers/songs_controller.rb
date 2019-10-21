class SongsController < ApplicationController
  def create_song
    if session[:user_id] == nil
      redirect_to '/'
    else
      @songs = Song.create (songs_params)
      if @songs.user_id == session[:user_id]
        if @songs.valid?
          redirect_to '/songs'
        else
          redirect_to '/songs', alert: @songs.errors.full_messages
        end
      else 
        @songs.destroy
        redirect_to '/'
      end
    end
  end
  def add
    if session[:user_id] == nil
      redirect_to '/'
    else
      @add = Add.new
      @add.user_id = session[:user_id]
      @add.song_id = params[:song_id]
      @add.save
      redirect_to '/songs'
    end
  end
  def show_song
    if session[:user_id] == nil
      redirect_to '/'
    else
      @song = Song.find(params[:id])
      @users = Add.where(song_id: @song.id)
      render 'show_song'
    end
  end

  def show_user
    if session[:user_id] == nil
      redirect_to '/'
    else
      @user = User.find(params[:id])
      @other = Add.where(user_id: params[:id])
      @songs = Add.where
      p '*(********************************************'
      p @other
      render 'show_user'
    end
  end
  def songs
    if session[:user_id] == nil
      redirect_to '/'
    else
    @user = User.find(session[:user_id])
    @songs = Song.left_joins(:adds).group(:id).order('COUNT(adds.id) ASC') 
    render 'songs'
    end
  end
  private
  def songs_params
    params.require(:songs).permit(:artist, :title, :user_id)
  end
end

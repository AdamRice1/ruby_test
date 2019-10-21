Rails.application.routes.draw do
  post 'create_song' => 'songs#create_song'

  get 'song/show/:id' => 'songs#show_song'

  get 'songs' => 'songs#songs'

  post 'add' => 'songs#add'

  get 'user/show/:id' => 'songs#show_user'

  get 'session/logout'

  post 'session/create'

  post 'login' => 'session#login'

  get 'logout' => 'session#logout'

  get "" => 'session#home'

  get "*path" => redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

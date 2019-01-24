Rails.application.routes.draw do
  namespace :api do
    get '/recipes' => 'recipes#index'
    post '/recipes' => 'recipes#create'
    get '/recipes/:id' => 'recipes#show'
    patch '/recipes/:id' => 'recipes#update'
    delete '/recipe/:id' => 'recipes#destroy'
  end
end
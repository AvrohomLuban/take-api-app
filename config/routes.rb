Rails.application.routes.draw do

    get "/", to: 'companies#index'
    get "/new", to: 'companies#new'
    post "/add", to: 'companies#create'
    get "/edit/:id", to: 'companies#edit'
    patch "/update/:id", to: 'companies#update'
    get "/:id", to: 'companies#show'
    delete "/:id", to: 'companies#destroy'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

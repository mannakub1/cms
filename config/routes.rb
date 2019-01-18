Cms::Application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Cms::API => '/'
  
  get '/admin/home', to: 'admin#home'
end

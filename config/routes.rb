Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'works/index'
  get 'works/select'
  get 'works/draw'
  get 'works/list'
  get '/w/:id', to: 'works#view'
  
  root 'works#index'

end

Rails.application.routes.draw do

  get 'view', to: 'note#view'

  devise_for :users
  root to: 'main#index'

  post 'create', to: 'note#create'
  get 'create', to: 'note#create'

  post 'edit', to: 'note#edit'
  get 'edit', to: 'note#edit'

  get 'remove', to: 'note#remove'

  get 'list', to: 'main#list'
  get 'main/list', to: 'main#list'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

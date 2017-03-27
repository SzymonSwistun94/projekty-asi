Rails.application.routes.draw do

  get 'main/perma'

  get 'note/view'

  devise_for :users
  root to: 'main#index'

  post 'note/create'
  get 'note/create'

  post 'note/edit'
  get 'note/edit'

  get 'note/remove'

  get 'main/index'

  get 'main/list'

  get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

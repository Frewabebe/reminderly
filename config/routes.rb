Rails.application.routes.draw do
  # get 'todos' => 'todos#index'
  get 'incomplete' => 'todos#incomplete'

  resources :todos
end

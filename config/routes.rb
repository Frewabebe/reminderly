Rails.application.routes.draw do
  root to: "todos#index"
  get 'incomplete' => 'todos#incomplete'

  resources :todos
end

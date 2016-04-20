Rails.application.routes.draw do
  root to: "todos#index"

  resources :todos do
    get 'incomplete', on: :collection
    put 'mark_complete', on: :member
  end
end

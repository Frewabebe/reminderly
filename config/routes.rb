Rails.application.routes.draw do
  root to: "todos#index"
  resources :todos do
    get "incomplete", on: :collection
    put "mark_completed", on: :member
  end
end

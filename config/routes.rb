Rails.application.routes.draw do
  root 'welcome#index'
  get "welcome", to: 'contacts#new', as: :welcome
  # get 'exit', to: 'sessions#destroy', as: :logout
  resource :contacts, only: [:new, :create]
end

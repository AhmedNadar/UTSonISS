Rails.application.routes.draw do
  root 'welcome#index'
  get "welcome", to: 'contacts#new', as: :welcome
  resource :contacts, only: [:new, :create]
end

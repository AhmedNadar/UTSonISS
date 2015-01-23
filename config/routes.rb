Rails.application.routes.draw do
  # root 'welcome#index'
  root 'contacts#new', as: "welcome"
  resource :contacts, only: [:new, :create]
end

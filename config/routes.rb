Rails.application.routes.draw do
  root 'contacts#new'
  # root 'welcome#index'
  # get "launch", to: 'contacts#new', as: :launch
  resource :contacts, only: [:new, :create]
end

Rails.application.routes.draw do
  # root 'welcome#index'

  root 'visitors#new'
  resource :contacts, only: [:new, :create]
end

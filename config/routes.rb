Rails.application.routes.draw do
  root 'visitors#new'
  resource :contacts, only: [:new, :create]
end

Rails.application.routes.draw do
  root 'contacts#new'
  get "idea", to: 'pages#idea', as: :the_idea
  get "thankyou", to: 'pages#thankyou', as: :thankyou

  get "launch", to: 'contacts#new', as: :launch
  resource :contacts, only: [:new, :create]
end

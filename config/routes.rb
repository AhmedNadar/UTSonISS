Rails.application.routes.draw do

  resources :students

  root 'contacts#new'
  
  get "idea",     to: 'pages#idea',     as: :the_idea
  get "thankyou", to: 'pages#thankyou', as: :thankyou
  get "launch",   to: 'contacts#new',   as: :launch

  resource  :contacts, only: [:new, :create]
  
  resources :projects do
    resources :students
  end

  resources :categories

	get '/projects/admin', controller: 'projects', action: 'admin'
end

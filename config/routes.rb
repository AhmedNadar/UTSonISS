Rails.application.routes.draw do

  root 'contacts#new'

  get "launch",   to: 'contacts#new',   as: :launch

  get "idea",     to: 'pages#idea',     as: :the_idea
  get "thankyou", to: 'pages#thankyou', as: :thankyou

  get "projects",        to: 'projects#all',          as: :projects
  get "honorable-teams", to: 'projects#honorable',    as: :honorable
  get "semi-final",      to: 'projects#semi_final',   as: :semi_final
  get "final",           to: 'projects#final',        as: :final
  get "judges",          to: 'projects#judges',       as: :judges
  get "experiment",      to: 'projects#experiment',   as: :experiment
  get "aerospace2016",   to: 'projects#aerospace2016',as: :aerospace2016
  get "spaceconf",       to: 'projects#spaceconf',    as: :spaceconf
  get "osc",             to: 'projects#osc',          as: :osc


  resource  :contacts, only: [:new, :create]

  # resources :projects do
  #   resources :students
  # end

  # resources :categories

	# get '/projects/admin', controller: 'projects', action: 'admin'
end

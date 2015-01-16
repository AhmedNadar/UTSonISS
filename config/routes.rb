Rails.application.routes.draw do
  root 'visitors#new'
  post 'contact', to: 'contacts#process_form'
end

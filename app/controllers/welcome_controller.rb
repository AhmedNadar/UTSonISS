class WelcomeController < ApplicationController
def index
  redirect_to new_contacts_path
end
end

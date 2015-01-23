class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      @contact.update_spreadsheet
      # todo send messge
      flash[:notice] = "Thanks #{@contact.name.capitalize} for your message!"
      redirect_to welcome_path
    else
      render new_contacts_path
    end
  end

  private
  def secure_params
    params.require(:contact).permit(:name, :email, :content)
  end

end

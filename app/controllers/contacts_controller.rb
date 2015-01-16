class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contat = Contact.mew(secure_params)
    if @contact.valid?
      @contact.update_spreadsheet
      # todo send messge
      flash[:notice] = "Message sent from #{@contact.name}"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def secure_params
    params.require(:contact).permit(:name, :email, :contect)
  end
end

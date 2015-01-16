class VisitorsController < ApplicationController
  def new
    @owner = Owner.new
    flash.now[:notic] = "Welcome!"
    flash.now[:alret] = "My birthday is soon"
  end
end

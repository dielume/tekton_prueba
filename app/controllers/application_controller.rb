class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized
      flash[:alert] = "No estás autorizado para realizar esta acción"
      redirect_to(request.referrer || root_path)
    end
end

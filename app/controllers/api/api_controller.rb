class Api::ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:alert] = "No estás autorizado para realizar esta acción"
    redirect_to(request.referrer || root_path)
  end
end

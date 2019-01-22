class Api::ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    render json: {status: "unauthorized"}
  end
end

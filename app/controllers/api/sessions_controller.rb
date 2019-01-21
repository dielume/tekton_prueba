class Api::SessionsController < Api::BaseController
  skip_before_action :require_login!, only: [:create]

  def create

    resource = User.find_for_database_authentication(:email => params[:user_login][:email])
    resource ||= User.new

    if resource.valid_password?(params[:user_login][:password])
      auth_token = resource.generate_auth_token
      register_user_session(resource)
      render json: { auth_token: auth_token }
    else
      invalid_login_attempt
    end

  end

  def destroy
    resource = current_person
    resource.invalidate_auth_token
    head :ok
  end

  private
    def invalid_login_attempt
      render json: { errors: [ { detail:"Error with your login or password" }]}, status: 401
    end

    def register_user_session(resource)
      user_agent = request.user_agent
      client = DeviceDetector.new(user_agent)
      resource.sessions.create(device_name: client.device_name,
                               device_type: client.device_type)
    end
  end

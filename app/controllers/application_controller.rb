
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session 

  before_action :authenticate_user, if: :json_request?

  helper_method :current_user, :logged_in?

  private

  def json_request?
    request.format.json? || request.content_type == "application/json"
  end

  def authenticate_user
    return if defined?(@current_user) && @current_user.present?

    auth_header = request.headers["Authorization"]
    if auth_header.present? && auth_header =~ /\ABearer\s+(.+)\z/i
      token = Regexp.last_match(1)
      @current_user = User.find_by(api_key: token)
    end

    render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
  end

 
  def current_user
    @current_user
  end

  def logged_in?
    !!current_user
  end
end

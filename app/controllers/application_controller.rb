class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:check_heejae]

  def check_authority
    if current_user.email == "test@example.com"
      return true
    end
    return false
  end
end

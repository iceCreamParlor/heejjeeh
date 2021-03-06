class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :check_authority

  def check_authority
    if current_user.present? && (current_user.email == "test@example.com" || current_user.email == "heejjeeh@gmail.com")
      return true
    end
    return false
  end
  def disable_carousel
    @disable_carousel = true
  end
end

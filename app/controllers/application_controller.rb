class ApplicationController < ActionController::Base
  before_action :set_layout
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_layout
    if ['small', 'wide'].include? params['layout']
      cookies.permanent['layout'] = params['layout']
    end

    @layout = cookies['layout']
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << User::FLAG
  end
end

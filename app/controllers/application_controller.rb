class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name,  :c_kana, :supervisor, :s_kana, :tel, :name, :kana, :company_adrress])
  end

end
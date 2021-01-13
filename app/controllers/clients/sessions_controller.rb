# frozen_string_literal: true

class Clients::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    tops_path # ログイン後に遷移するpathを設定
  end


  def new_guest
    client = Client.guest
    sign_in client
    redirect_to new_top_path, notice: 'ゲストクライアントとしてログインしました。'
  end



  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

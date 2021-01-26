# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(_resource)
    @client_id = (session['current.client_id']['client'])
    top_path(@client_id) # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(_resource)
    @client_id = (session['current.client_id']['client'])
    top_path(@client_id) # ログアウト後に遷移するpathを設定
  end

  def new_guest
    user = User.guest
    sign_in user
    @client_id = (session['current.client_id']['client'])
    redirect_to top_path(@client_id) # , notice: 'ゲストユーザーとしてログインしました'
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

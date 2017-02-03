class Users::SessionsController < Devise::SessionsController
before_action :configure_sign_in_params, only: [:create]
after_action :check_birthday, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
 def destroy
   super
 end

 def check_birthday
  @datatime = DateTime.now.strftime("%Y%m%d")
  @user = current_user
  @user.age =  (@datatime.to_i - @user.birthday.strftime("%Y%m%d").to_i) / 10000
  @user.save
 end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end

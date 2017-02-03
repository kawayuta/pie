class ApplicationController < ActionController::Base
          before_action :set_request_variant
          before_filter :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:cat_baby_switch, :cat_prescool_switch, :cat_juniorscool_switch, :cat_highscool_switch, :cat_universityscool_switch, :cat_senior_switch, :cat_age10s_switch, :cat_age20s_switch, :cat_age30s_switch, :cat_age40s_switch, :cat_age50s_switch, :cat_age60s_switch, :cat_age70s80s90s_switch, :age, :birthday, :username, :userid, :email, :password, :avatar, :avatar_cache, :body_height,:body_width,:body_bust,:body_west,:body_hip,:shoulder_width,:leg_height,:leg_width,:foot_height,:arm_height,:arm_width,:ring_finger_width, :latitude, :longitude])
          devise_parameter_sanitizer.permit(:account_update, keys: [:cat_baby_switch, :cat_prescool_switch, :cat_juniorscool_switch, :cat_highscool_switch, :cat_universityscool_switch, :cat_senior_switch, :cat_age10s_switch, :cat_age20s_switch, :cat_age30s_switch, :cat_age40s_switch, :cat_age50s_switch, :cat_age60s_switch, :cat_age70s80s90s_switch, :age, :birthday, :username, :userid, :email, :password, :avatar, :avatar_cache, :remove_avatar, :body_height,:body_width,:body_bust,:body_west,:body_hip,:shoulder_width,:leg_height,:leg_width,:foot_height,:arm_height,:arm_width,:ring_finger_width, :latitude, :longitude])
    end

    protect_from_forgery with: :null_session


  private

    def set_request_variant
      if from_smartphone?
        request.variant = :smartphone
      end
    end

    def from_smartphone?
      request.from_android? || request.from_iphone? || request.from_ipod? || request.from_windows_phone? 
    end


end


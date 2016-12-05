class ApplicationController < ActionController::Base

    before_filter :configure_permitted_parameters, if: :devise_controller?

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:cat_baby_switch, :cat_prescool_switch, :cat_juniorscool_switch, :cat_highscool_switch, :cat_universityscool_switch, :cat_senior_switch, :cat_age10s_switch, :cat_age20s_switch, :cat_age30s_switch, :cat_age40s_switch, :cat_age50s_switch, :cat_age60s_switch, :cat_age70s80s90s_switch, :age, :birthday, :username, :email, :password, :avatar, :avatar_cache])
          devise_parameter_sanitizer.permit(:account_update, keys: [:cat_baby_switch, :cat_prescool_switch, :cat_juniorscool_switch, :cat_highscool_switch, :cat_universityscool_switch, :cat_senior_switch, :cat_age10s_switch, :cat_age20s_switch, :cat_age30s_switch, :cat_age40s_switch, :cat_age50s_switch, :cat_age60s_switch, :cat_age70s80s90s_switch, :age, :birthday, :username, :email, :password, :avatar, :avatar_cache, :remove_avatar])
        end


protect_from_forgery with: :null_session


end

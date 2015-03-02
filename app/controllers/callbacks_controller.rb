class CallbacksController < Devise::OmniauthCallbacksController
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        @existing_user = User.find_by(email: @user.email)
        if @existing_user!=nil? && @existing_user.provider!=nil
          sign_in_and_redirect @user
        else
          flash[:error] = "Email already exists"
          redirect_to root_path
        end
    end
end
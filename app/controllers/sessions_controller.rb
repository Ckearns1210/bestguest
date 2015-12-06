class SessionsController < ApplicationController
  include ApplicationHelper

    def new
    end

    def create
       user = User.find_by_username(params[:username])
       if user && user.authenticate(params[:password])
        log_in user
        redirect_to user
      else
      flash.now[:error] = "Invalid email/password combination"
      render action: "new"
    end
  end
    def destroy

      log_out
      redirect_to '/signup'
    end
end

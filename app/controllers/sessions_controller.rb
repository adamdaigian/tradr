class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  def create
    user = User.find_by_username(params[:username])

    respond_to do |format|
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        format.html { redirect_to root_path, notice: "You're logged in"}
        format.js
      else
        flash.now[:notice] = "Your email or password was incorrect"
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil

    respond_to do |format|
      format.html { redirect_to root_path, notice: "You're logged out"}
      format.js
    end
  end
end

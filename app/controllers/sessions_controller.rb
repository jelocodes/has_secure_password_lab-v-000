class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return redirect_to controller: 'sessions', action: 'create' unless @user.authenticate(params[:user][:password]) 
    session[:user_id] = @user.id
    redirect_to '/homepage'
  end

end

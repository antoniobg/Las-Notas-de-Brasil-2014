class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:success] = "¡Bienvenido #{current_user}!"
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "¡Hasta pronto! No olvides volver para puntuar el próximo partido"
    redirect_to root_path
  end
end

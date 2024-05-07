class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Connexion réussie!'
    else
      flash.now[:alert] = 'Email ou mot de passe incorrect.'
      render :new
    end
  end

  def destroy
    super
  end
end

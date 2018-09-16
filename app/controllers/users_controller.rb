class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/tweets'
    else
      erb :'/users/create_user'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  get '/logout' do
    session.clear
  end
  
  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/tweets/index'
    else
      redirect to '/signup'
    end
  end

  post '/signup' do
    username = params[:username] 
    email = params[:email]
    password = params[:password]
    if username.empty? || email.empty? || password.empty?
         redirect to '/signup'
    else
      user = User.create(username:username, email:email, password:password)
      if user.save
        session[:user_id] = user.id
        @session = session
        
        redirect to '/tweets/index'
      else
        redirect to '/signup'
      end
    end
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
  
end

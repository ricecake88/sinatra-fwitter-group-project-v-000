class UsersController < ApplicationController
  post '/signup' do
    if params[:username] == "" || 
       params[:email] == "" ||
       params[:password] == ""
         redirect to '/signup'
    else
      user = User.create(username:params[:username], email:params[:email], password:params[:password])
      binding.pry
      if user.save
        redirect to '/tweets'
      else
        redirect to '/signup'
      end
    end
  end
  
  
end

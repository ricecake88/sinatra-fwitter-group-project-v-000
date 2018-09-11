class UsersController < ApplicationController
  post '/signup' do
    binding.pry
    if params[:username].empty? || 
       params[:email].empty? || 
       params[:password].empty?
         redirect to '/signup'
    else
      redirect to '/tweets'
    end
  end
end

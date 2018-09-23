class TweetsController < ApplicationController
  get '/tweets' do
    if logged_in?
      erb :'/tweets/index'
    else
      redirect to '/login'
    end
  end
  
  get '/tweets/new' do
    if logged_in?
      erb :'/tweets/create_tweet'
    else
      redirect to '/login'
    end
  end
  
  post '/create' do
    if logged_in?
      tweet = Tweet.new(user_id:session[:user_id], content:params[:content])
      
    else
      redirect to '/login'
    end
  end
end

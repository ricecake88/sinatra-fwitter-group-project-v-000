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
  
  post '/tweets/new' do
    content = params[:content]
    if logged_in?
      if content != ""
        tweet = Tweet.new(user_id:session[:user_id], content:params[:content])
        current_user.tweets << tweet
      end
    else
      redirect to '/login'
    end
  end
  
  get '/tweets/:id' do
    binding.pry
    if logged_in?
      @tweet = Tweet.find(params[:id])
      erb :'/tweets/show_tweet.erb'
    else
      redirect to '/login'
    end
  end
  

end

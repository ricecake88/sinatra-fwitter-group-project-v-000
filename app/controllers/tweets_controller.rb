class TweetsController < ApplicationController
  get '/tweets' do
    binding.pry
    session[:user_id]
    erb :'/tweets/index'
  end
end

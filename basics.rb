require 'rubygems'
require 'sinatra'
require 'integer_expansion'

get '/' do
  erb :english_number
end

get '/redirect' do
  redirect "/number/#{params[:number]}"
end

get '/number/:number' do 
  @title = params[:number]
  @num = params[:number].to_i.add_commas
  @enum = "#{params[:number].to_i.to_english}"
  erb :english_number
end

get '/*' do
  redirect "/number/#{rand(10**14)}"
end
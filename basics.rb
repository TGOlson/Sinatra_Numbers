require 'rubygems'
require 'sinatra'
require 'integer_expansion'

get '/' do
  @title = 'English Numbers' 
  erb :english_number
end

post '/' do 
  @title = 'English Numbers'
  @num = params[:number].to_i.add_commas
  @enum = "#{params[:number].to_i.to_english}"
  erb :english_number
end

not_found do 
  halt 404, 'page not found'
end
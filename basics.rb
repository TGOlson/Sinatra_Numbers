require 'rubygems'
require 'sinatra'
require 'integer_expansion'

get '/' do
  "Hello, World!"	
end

get '/about' do 
  "A litte about me."
end

get '/hello/:name/:city' do 
  "Hello there, #{params[:name].capitalize} from #{params[:city].capitalize}."
end

get '/english_number' do 
  @title = 'English Numbers' 
  erb :english_number
end

post '/english_number' do 
  @title = 'English Numbers'
  @num = params[:number].to_i.add_commas
  @enum = "#{params[:number].to_i.to_english}"
  erb :english_number
end

not_found do 
  halt 404, 'page not found'
end
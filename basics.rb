require 'rubygems'
require 'sinatra'
require './lib/class_Integer'

get '/' do
  "Hello, World!"	
end

get '/about' do 
  "A litte about me."
end

get '/hello/:name/:city' do 
  "Hello there, #{params[:name].capitalize} from #{params[:city].capitalize}."
end

get '/more/*' do 
  params[:splat]
end


get '/form' do 
  erb :form
end

post '/form' do 
  "You said '#{params[:message]}'."
end

get '/secret' do 
  erb :secret
end

post '/secret' do 
  params[:secret].reverse
end

get '/decrypt/:secret' do 
  params[:secret].reverse
end

get '/english_number' do 
  erb :english_number
end

post '/english_number' do 
  @num = "#{params[:number].to_i.to_english}"
  erb :english_number
end


not_found do 
  halt 404, 'page not found'
end
require 'sinatra/activerecord'
require 'sinatra'
require 'pg'
require 'sinatra/reloader'
require 'pry'
require './lib/band'
require './lib/venue'






get '/'  do
	erb :index
end

get '/bands' do
	erb :bands
end

get '/bands/new' do
	erb :band_form
end

post '/bands' do
	@band = Band.create({ name: params['name'] })
	redirect '/bands'
end

require 'sinatra'
require 'sinatra/mustache'

class HunkyDoryApp < Sinatra::Base
	get "/" do
		mustache :homepage
	end
end

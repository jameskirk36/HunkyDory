require 'sinatra'

class HunkyDoryApp < Sinatra::Base
	get "/" do
		"
		<!DOCTYPE html>
		<html>
			<head>
				<title>Hunky Dory Chocolates</title>
			</head>
			<body>
				Welcome to Hunky Dory Chocolates
			<body>
		<html>"
	end
end

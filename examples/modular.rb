require "rubygems"
require 'sinatra/base'
require File.dirname(__FILE__) + "/../lib/sinatra/chart_topper.rb"

class MyApp < Sinatra::Base

  register Sinatra::ChartTopper
	
	bar "My Bar Chart" do
    
    size "400x225"

    data "Apples",     40
    data "Oranges",    50
    data "Watermelon", 30
    data "Peaches",    60
        
	end

	pie "My Pie Chart" do
    
    size "400x225"

    data "Apples",     40
    data "Oranges",    50
    data "Watermelon", 30
    data "Peaches",    60
        
	end

	
end

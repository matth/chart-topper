require "rubygems"
require "sinatra"
require File.dirname(__FILE__) + "/../lib/sinatra/chart_topper.rb"

# BAR CHART WITH PREFIX /my/prefix/my_graph.png
bar "My Graph", :prefix => "/my/prefix/" do

  size "400x225"

  data "Apples",     40
  data "Oranges",    50
  data "Watermelon", 30
  data "Peaches",    60
      
end

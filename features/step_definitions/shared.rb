
Given /^I am have loaded the (.*) example$/ do |file|
  app_file = File.dirname(__FILE__) + "/../../examples/#{file}"
  require app_file
  Sinatra::Application.app_file = app_file
  @app = Sinatra::Application
end

When /^I visit (.*)$/ do |url|
  get url
end

Then /^I should get a (\d+) response$/ do |code|
  last_response.status.should == code.to_i
end

Then /^I should see a (\w+) graph (\d+x\d+) in size$/ do |type, size|

  last_response.headers["Content-Type"].should == "image/#{type}"
  image = Magick::Image.from_blob(last_response.body).first
  
  if size =~ /(\d+)x(\d+)/
    width  = $1.to_i
    height = $2.to_i    
  end
  
  image.columns.should == width
  image.rows.should == height  
  
end

Given /^I am have loaded the modular app$/ do
  require File.dirname(__FILE__) + "/../../examples/modular.rb"
  @app = MyApp
end
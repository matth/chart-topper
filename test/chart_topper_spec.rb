require "rubygems"
require File.dirname(__FILE__) + "/../lib/sinatra/chart_topper.rb"

describe Sinatra::ChartTopper do
      
  include Sinatra::ChartTopper
  
  describe "#filename" do
    
    it "should lowercase all letters" do
      filename("MAKE_ME_INTO_A_FILENAME").should == "make_me_into_a_filename"
    end                                                             
    
    it "should replace spaces with underscores" do
      filename("Make me into a filename please").should == "make_me_into_a_filename_please"
    end    
    
    it "should strip out any non word characters" do
      filename("Make me into -!@£$%^&*(){}{}+=,.<>?/:;|~`±§a filename please!").should == "make_me_into_a_filename_please"
    end                                             
    
    it "should work on a realistic title" do
      filename("Line chart showing Sinatra's chart topping successes!").should == "line_chart_showing_sinatras_chart_topping_successes"
    end    
        
  end                      
  
  describe "#graph_types" do
     
    it "should define methods for all graph types included in Gruff" do
      [
        :accumulator_bar, :area, :bar, :bar_conversion, :dot, 
        :line, :pie, :side_stacked_bar, :stacked_area, :stacked_bar
      ].each do |signature|
         methods.include?(signature.to_s).should == true
      end
      
    end
    
  end
  
  
  
end
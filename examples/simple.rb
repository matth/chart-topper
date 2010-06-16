require "rubygems"
require "sinatra"
require File.dirname(__FILE__) + "/../lib/sinatra/chart_topper.rb"

# ACCUMULATOR BAR CHART /a_simple_accumulator_bar_chart.png
accumulator_bar "A simple accumulator bar chart" do

  size "400x225"

  data "Apples",     [40, 30, 20, 50, 70]

end

# AREA CHART /a_simple_area_chart.png
area "A simple area chart" do

  size "400x225"
  
  datasets = [
        [:Jimmy, [25, 36, 86, 39, 25, 31, 79, 88]],
        [:Charles, [80, 54, 67, 54, 68, 70, 90, 95]],
        [:Julie, [22, 29, 35, 38, 36, 40, 46, 57]],
        [:Jane, [95, 95, 95, 90, 85, 80, 88, 100]],
        [:Philip, [90, 34, 23, 12, 78, 89, 98, 88]],
        ["Arthur", [5, 10, 13, 11, 6, 16, 22, 32]],
      ]
        
  sample_labels = {
      0 => '5/6',
      1 => '5/15',
      2 => '5/24',
      3 => '5/30',
      4 => '6/4',
      5 => '6/12',
      6 => '6/21',
      7 => '6/28',
    }

   graph.labels = {
     0 => '5/6',
     2 => '5/15',
     4 => '5/24',
     6 => '5/30',
   }
     
   datasets.each do |data|
     graph.data(data[0], data[1])
   end
      
end

# BAR CHART /a_simple_bar_chart.png
bar "A simple bar chart" do

  size params["size"] || "400x225"

  data "Apples",     40
  data "Oranges",    50
  data "Watermelon", 30
  data "Peaches",    60
      
end

# DOT CHART /a_simple_dot_chart.png
dot "A simple dot chart" do

  size "400x225"
  
  graph.labels = {
    0 => '5/6',
    1 => '5/15',
    2 => '5/24',
    3 => '5/30'
  }  

  data :Art, [0, 5, 8, 15], '#990000'
  data :Philosophy, [10, 3, 2, 8], '#009900'
  data :Science, [2, 15, 8, 11], '#990099'
  
end

# LINE CHART /a_simple_line_chart.png
line "A simple line chart" do

  size "400x225"

  data "Apples",     [1, 2, 3, 4, 4, 3]
  data "Oranges",    [4, 8, 7, 9, 8, 9]       
  data "Watermelon", [2, 3, 1, 5, 6, 8]       
  data "Peaches",    [9, 9, 10, 8, 7, 9]     
      
end

# PIE CHART /a_simple_pie_chart.png
pie "A simple pie chart" do

  size "400x225"

  data "Apples",     40
  data "Oranges",    50
  data "Watermelon", 30
  data "Peaches",    60
      
end

# STACKED BAR CHART /a_simple_stacked_bar_chart.png
stacked_bar "A simple stacked bar chart" do

  size "400x225"

  data "Apples",     [1, 2, 3, 4, 4, 3]
  data "Oranges",    [4, 8, 7, 9, 8, 9]       
  data "Watermelon", [2, 3, 1, 5, 6, 8]       
  data "Peaches",    [9, 9, 10, 8, 7, 9]
      
end

# SIDE STACKED BAR CHART /a_simple_side_stacked_bar_chart.png
side_stacked_bar "A simple side stacked bar chart" do

  size "400x225"
  
  graph.labels = {
    0 => '5/6',
    1 => '5/15',
    2 => '5/24',
    3 => '5/30'
  }  

  data "Apples",     [1, 2, 3, 4]
  data "Oranges",    [4, 8, 7, 9]       
  data "Watermelon", [2, 3, 1, 5]       
  data "Peaches",    [9, 9, 10, 9]
      
end

# SIDE AREA CHART /a_simple_stacked_area_chart.png
stacked_area "A simple stacked area chart" do

  size "400x225"
  
  graph.labels = {
    0 => '5/6',
    1 => '5/15',
    2 => '5/24',
    3 => '5/30'
  }  

  data "Apples",     [1, 2, 3, 4]
  data "Oranges",    [4, 8, 7, 9]       
  data "Watermelon", [2, 3, 1, 5]       
  data "Peaches",    [9, 9, 10, 9]
      
end

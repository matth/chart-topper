# Chart Topper

Chart Topper is an extension to the [Sinatra DSL](http://github.com/sinatra/sinatra/) to allow you to quickly and dynamically create image based chart's and graphs.

    # myapp.rb
    require 'rubygems'
    require 'sinatra'
    require 'sinatra/chart_topper'
    
    line "A graph of various fruit" do

        size "400x225"

        data "Apples",   [1, 2, 3, 4, 4, 3]
        data "Oranges",  [4, 8, 7, 9, 8, 9]       
        data "Watermelon", [2, 3, 1, 5, 6, 8]       
        data "Peaches", [9, 9, 10, 8, 7, 9]     

    end
    
Install the software (for more info see the Installation section) and run with: 

    ruby mayapp.rb
    
View your graph at [http://localhost/a\_graph\_of\_various\_fruit.png](http://localhost/a_graph_of_various_fruit.png)

## Installation

Chart Topper is built around [Gruff](http://nubyonrails.com/pages/gruff) which is in turn built around [ImageMagick and RMagick](http://rmagick.rubyforge.org/install-osx.html). 

The quickest way to get all the ImageMagick dependancy installed is to use MacPorts (OS X).

    sudo port install imagemagick
    
Then install the gem dependancies as normal:

    sudo gem install gruff rmagick    
    
## URLs

Graph URL's are generated from the graph title. Non word characters are stripped, spaces become underscores and the whole thing is lowercased.

    # Graph is addressable via /this_weeks_expenditures.png
    pie "This week's expenditures" do
        ...
    end
    
## Graph types

Various Gruff graph types are mapped to new Sinatra DSL methods, for a complete list see Sinatra::ChartTopper.GRAPH_TYPES

The basic rule is that any Gruff graph type can be generated via it's lowercased and underscore separated equivalent.
          
    # Create a graph of type Gruff::AccumulatorBar
    accumulator_bar "My accumulator bar graph" do
        ...
    end

## The Gruff graph object and delegated methods

In order to make the DSL a bit nicer to use number of methods are delegated to the Gruff graph object. These can be found in Sinatra::ChartTopper.GRAPH_DELEGATIONS

    dot "My dot graph" do
        # Delegated to Gruff::Base.data
        data "Tuesday", [2,4,6,8]
    end

Direct access to the current Gruff graph object can be gained via the `graph()` method

    spider "My spider chart" do
        graph.theme = {
            :colors => %w(orange purple green white red),
            :marker_color => 'blue',
            :background_colors => %w(black grey)
        }
    end

## Options

You can pass through options to the graph methods. Currently the only available option is `prefix` though. This will add a prefix to the generated URL.

	# /my/prefix/my_graph.png
	bar "My Graph", :prefix => "/my/prefix/" do
		...
	end
	
## Modular style apps

You can use the extension in modular style apps too ...

	require 'sinatra/base'
	require 'sinatra/chart_topper'

	class MyApp < Sinatra::Base
	
	  	register Sinatra::ChartTopper
		
		bar "My Graph" do
			...
		end
		
	end
	
## Examples

It's probably a good place to start, check out the examples directory. 

## License

License:

(GPLv3)

Copyright (C) 2009 Matt Haynes

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <www.gnu.org/licenses/>




    
    
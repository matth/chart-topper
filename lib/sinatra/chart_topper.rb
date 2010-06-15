require 'sinatra/base'
require "gruff"    

module Sinatra

  module ChartTopper
                    
    # These graph types are available as top level methods and proxied through to draw()
    # e.g. graph_type() -> draw(Gruff::GraphType) 
    GRAPH_TYPES = [:accumulator_bar, :area, :bar, :bar_conversion, :dot, :line, 
                    :pie, :side_stacked_bar, :side_bar, :spider, :stacked_area, :stacked_bar]
        
    GRAPH_TYPES.each do |method|
      define_method(method) do |*args, &block|
        title, options = *args
        options ||= {}
        camelized = method.to_s.split('_').map {|w| w.capitalize}.join
        draw Gruff.const_get(camelized), title, options, &block
      end      
    end

    # Delegate(?) these methods to the graph
    GRAPH_DELEGATIONS = [:data, :add_color, :theme_37signals, :theme_greyscale, 
                          :theme_keynote, :theme_odeo, :theme_pastel, :theme_rails_keynote]    

    GRAPH_DELEGATIONS.each do |method|
      define_method method do |*args|
        graph.send(method, *args)
      end
    end
    
    # Make filename from title
    def filename(title)
      title.gsub(/[^a-zA-Z0-9_\s]/, '').gsub(/\s/, '_').downcase
    end    

    # Create graph of size (reset's any previous graph!)
    def size(dimensions)
      type = graph.class
      set_graph type.new(dimensions)
    end

    # Create / return graph object
    def graph(size = nil)
      @graph
    end
    
    # Set the graph object
    def set_graph(graph)
      @graph = graph
    end

    def self.registered(app)
      app.helpers Sinatra::ChartTopper
    end

    # Define a route to draw a particualar graph
    def draw(type, title, options = {}, &block)

      prefix = options[:prefix] || "/"
      
      get "#{prefix}#{filename(title)}.png" do
        content_type "image/png"                
        set_graph type.new
        instance_eval(&block)
        graph.title = title
        graph.to_blob
      end

    end
    
  end

  register ChartTopper
  
end

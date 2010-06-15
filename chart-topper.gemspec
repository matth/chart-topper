
Gem::Specification.new do |s|
  s.name = "chart-topper"
  s.version = "0.0.1"
  s.author = "Matt Haynes"
  s.email = "matt@matthaynes.net"
  s.homepage = "http://github.com/matth/chart-topper/tree/master"
  s.summary  = "A little Sinatra DSL extension to help make dynamic graphs with Gruff"
  s.description = "Chart Topper is an extension to the Sinatra DSL to allow you to quickly and dynamically create image based chart's and graphs."
  s.files = Dir.glob("lib/**/*") + %w(README.md)
  s.require_path = "lib"
  s.has_rdoc = false
  s.add_dependency 'sinatra'
  s.add_dependency 'gruff'
end
ENV['RACK_ENV'] = 'cucumber'

require 'spec/expectations'
require 'rack/test'
require 'webrat'

Webrat.configure do |config|
  config.mode = :rack
end

class ChartTopperWorld
  
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers
  
  def app
    @app ||= Sinatra::Application
  end
  
  Webrat::Methods.delegate_to_session :response_code, :response_body

end

World do
  ChartTopperWorld.new
end

require 'sinatra/base'
require 'sinatra/contrib'
require 'json'

require_relative 'models/init'
require_relative 'routes/init'

module Smarping
  class App < Sinatra::Base
    configure do
      root_dir = File.dirname(__FILE__)
      set :root, root_dir
      set :app_file, File.join(root_dir, File.basename(__FILE__))
      register Sinatra::Namespace
      helpers Sinatra::JSON
    end
  end
end
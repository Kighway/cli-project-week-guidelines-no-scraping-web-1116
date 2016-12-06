require 'bundler/setup'
Bundler.require(:default, :development)
# $: << '.'
#
# Dir["lib/concerns/*.rb"].each {|f| require f}
# Dir["lib/models/*.rb"].each {|f| require f}
# Dir["lib/data_fetchers/*.rb"].each {|f| require f}
# Dir["lib/runners/*.rb"].each {|f| require f}

require 'open-uri'
require 'rest-client'
require 'json'
require 'pry'

require_relative "../lib/data_fetchers/lower_manhattan_api"
require_relative "../lib/runners/lower_manhattan_cli"

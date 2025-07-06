# frozen_string_literal: true

require 'cucumber'
require 'rspec'
require 'excon'
require 'pry'
require 'faker'
require 'json'
require 'rubocop'

ENVIRONMENT = ENV['ENVIRONMENT']

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENVIRONMENT}.yaml"))

$base_uri = CONFIG['uri']

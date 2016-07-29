require 'active_support/configurable'
module Drool

	def self.configure(&block)
		yield @config ||= Drool::Configuration.new
	end

	def self.config
		@config
	end

	class Configuration
		include ActiveSupport::Configurable
		config_accessor :host
		config_accessor :url
		config_accessor :lookup
		config_accessor :authorization
		config_accessor :insert_models
	end

	configure do |config|
		config.host = "http://115.28.75.101:8180"
		config.url = "/kie-server/services/rest/server/containers/instances/gcc"
		config.lookup = "ksession1"
		config.authorization = 'Basic a2llc2VydmVyOmtpZXNlcnZlcjEh'
		config.insert_models = {}
	end
end

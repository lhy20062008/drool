module Drool
	require 'faraday'
	require 'nokogiri'
	def self.result(inserts = [], processId = '')
		host = config.host
		url = config.url
		data = xml(inserts, processId)
		conn = Faraday.new(host)
		response = conn.post do |req|
		  req.url url
		  req.headers['Content-Type'] = 'application/xml'
		  req.headers['Authorization'] = config.authorization
		  req.headers['X-KIE-ContentType'] = 'xstream'
		  req.body = data
		end
		xml = Nokogiri::XML.parse(response.body)
		titles = xml.css('code').map(&:text)
	end
end

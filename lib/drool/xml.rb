module Drool
	def self.xml(inserts = [], processId = '')
		xml = ''
		xml << "<batch-execution lookup='#{config.lookup}'>"
		inserts.each do |insert|
			xml << parse_insert(insert)
		end
		xml << "<start-process processId='#{processId}'/>"
		xml << "<fire-all-rules/>"
		xml << "<get-objects out-identifier='objects'/>"
		xml << "</batch-execution>"
	end

	def self.parse_insert(insert)
		return insert if insert.is_a?(String)
		return '' if config.insert_models[insert.class.name.downcase.to_sym].nil?
		str = "<insert><#{config.insert_models[insert.class.name.downcase.to_sym]}>"
		str += insert.insert_str
		str += "</#{config.insert_models[insert.class.name.downcase.to_sym]}></insert>"
		str
	end
end

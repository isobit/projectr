require 'projectr/version'
require 'json'

module Projectr
	PROJECT_PATH = "#{Dir.home}/.projectr"
	def self.list
		dirs = Dir.glob("#{PROJECT_PATH}/*")
			.select { |f|File.directory? f }
			.map { |p| p.split('/').last }
		dirs.each { |dir| puts dir }
	end
end

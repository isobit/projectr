require 'rubygems'
require 'bundler/setup'

require 'projectr/version'
require 'fileutils'

module Projectr
	PROJECT_PATH = "#{Dir.home}/.projectr"
	def self.list
		dirs = Dir.glob("#{PROJECT_PATH}/*")
			.select { |f|File.directory? f }
			.map { |p| p.split('/').last }
		dirs.each { |dir| puts dir }
	end
	def self.load(name, dest_path = Dir.pwd)
		src_path = "#{PROJECT_PATH}/#{name}"
		raise "#{name} is not a valid project" if !File.exist?(src_path)
		FileUtils.cp_r(Dir.glob("#{src_path}/*"), dest_path)
		projectrfile_path = "#{dest_path}/Projectrfile"
		if File.exist?(projectrfile_path)
			FileUtils.chmod('+x', projectrfile_path)
			exec "#{projectrfile_path}"
			FileUtils.rm(projectrfile_path)
		end
	end
end

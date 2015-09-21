require 'rubygems'
require 'bundler/setup'
require 'projectr/version'
require 'commander'
require 'fileutils'

module Projectr
	def self.run
		include Commander::Methods
		program :name, 'Projectr'
		program :version, Projectr::VERSION
		program :description, 'Project templating tool for quickly starting and updating new projects.'

		command :list do |c|
			c.syntax = 'list [options]'
			c.action do |args, opts|
				Projectr.list()
			end
		end

		command :load do |c|
			c.syntax = 'load <name> [options]'
			c.action do |args, opts|
				Projectr.load(args.first)
			end
		end
	end

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

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'projectr/version'

GEM_NAME = 'projectr'

task :build do
	system "gem build #{GEM_NAME}.gemspec"
end

task :install => [:build] do
	system "gem install #{GEM_NAME}-#{Projectr::VERSION}.gem"
end

task :release => [:build] do
	system "gem push #{GEM_NAME}-#{Projectr::VERSION}.gem"
end

task :bump do
	version_file_path = "./lib/#{GEM_NAME}/version.rb"
	version_file_text = File.read(version_file_path)
	new_text = version_file_text.gsub(/VERSION = \"(\d+).(\d+).(\d+)\"/) { 
		old_version = "#{$1}.#{$2}.#{$3}"
		new_version = "#{$1}.#{$2}.#{$3.to_i + 1}"
		puts "#{old_version} -> #{new_version}"
		"VERSION = \"#{new_version}\"" 
	}
	File.write(version_file_path, new_text)
end

task :clean do
	system "rm *.gem"
end

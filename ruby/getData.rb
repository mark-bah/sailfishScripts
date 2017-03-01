require 'ckan'
require 'json'

class Main

#initialize variables
iter = 0
CKAN::API_BASE = "http://catalog.data.gov/api/3/"

#check base URL
puts "base: #{CKAN::API_BASE}"

#load all packages
packages = CKAN::Package.find



puts "Number of packages: #{packages.length}."
for package in packages
	iter = iter + 1
	if iter > 100
		break
	end
	puts "package#: #{iter}"
	puts "package name: #{package.name}"
	puts "raw info: #{package.resources}"
	puts ""
end


end


=begin
# for all packages
name = package.name
desc  = package desc
url = package url

create new item in db
cast name, desc, url in there
	
=end
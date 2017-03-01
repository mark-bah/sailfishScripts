require 'ckan'
#Dir["/Users/markpileggi/Documents/workspace/ckan/lib/ckan/*.rb"].each {|file| require file }
class Main
 	
 	# get all CKAN packages
   packages = CKAN::Package.find
   
   puts packages

   firstName = packages.first.name
   puts "example package name: #{firstName}."
   
   firstResources = packages.first.resources
   puts "example package name: #{firstResources}."

   groups = CKAN::Group.find
   puts "CKAN groups?: #{groups}."

   puts "groups desc" 
   puts groups.first.description 

   puts "groups first packages"
   puts groups.first.packages
  #puts "hello ckan imported"
end

=begin
	
require 'ckan'

  # Optionally, set the base API url
  CKAN::API.api_base = "...your CKAN API URL ..."
  #^ this doesn't work, might be something like CKAN:api_base = "" instead, but I just set it in the ckan.rb file

  # get all CKAN packages
  packages = CKAN::Package.find

  # query for CKAN packages
  packages = CKAN::Package.find(:tags => ["lod", "government"], :groups => "lodcloud")

  # get the name of the package (this is a lazy call to the REST API)
  packages.first.name

  # get the resources of the package
  packages.first.resources

  # query for CKAN groups
  groups = CKAN::Group.find

  # get the description of a group
  groups.first.description

  # get the list of packages inside a group
  groups.first.packages
	
=end


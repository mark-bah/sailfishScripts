require 'ckan'
require 'mysql2'


require_relative 'Scraper'
#require_relative 'tiny_tds'

#Dir["/Users/markpileggi/Documents/workspace/ckan/lib/ckan/*.rb"].each {|file| require file }
class Main
 	
 	attr_accessor :packages
	attr_accessor :resourceArray
	attr_accessor :scraper

  attr_accessor :client
  attr_accessor :db_host
  attr_accessor :db_user
  attr_accessor :db_pass
  attr_accessor :db_name


 	# get all CKAN packages
  


    def initialize(scraper, host, user, password, db_name)
   		@packages = packages
   		resourceArray = []
   		resourceArray.push(" #<CKAN::Resource:0x007fa00c882580 @url=\"https://datahub.io/dataset/74ec4b51-f745-4282-bb26-3c3746bf0f4e/resource/90232f11-5ac6-4dbf-b784-084bd51b3fd5/download/osybiography.htm\", @format=\"HTML\", @description=\"Oscar R. Gómez' Biography\", @hash=\"\">");
		  resourceArray.push("#<CKAN::Resource:0x007fa0bbb8b1f0 @url=\"https://ckannet-storage.commondatastorage.googleapis.com/2015-05-26T02:31:02.552Z/1985-co-virginia-beach-norfolk-newport-news-va-nc.csv\", @format=\"CSV\", @description=\"\", @hash=\"\">");
		  resourceArray.push("#<CKAN::Resource:0x007fa0bd9304f8 @url=\"https://ckannet-storage.commondatastorage.googleapis.com/2015-05-26T03:20:06.188Z/1986-co-virginia-beach-norfolk-newport-news-va-nc.csv\", @format=\"CSV\", @description=\"\", @hash=\"\">");
		  resourceArray.push("#<CKAN::Resource:0x007fa0bc3d4d48 @url=\"https://ckannet-storage.commondatastorage.googleapis.com/2015-01-25T17:51:50.045Z/va-east-of-hampton-1986-geo.zip\", @format=\"GeoPDF\", @description=\".pdf format  \r\nGeoPDF\", @hash=\"\">");
		  resourceArray.push("#<CKAN::Resource:0x007fa0bbb61800 @url=\"https://ckannet-storage.commondatastorage.googleapis.com/2015-05-26T03:24:31.581Z/1987-co-virginia-beach-norfolk-newport-news-va-nc.csv\", @format=\"CSV\", @description=\"\", @hash=\"\">");
		  resourceArray.push("#<CKAN::Resource:0x007fa0bca8db30 @url=\"https://ckannet-storage.commondatastorage.googleapis.com/2015-06-03T03:19:46.234Z/1988.csv\", @format=\"CSV\", @description=\"\", @hash=\"\">");

   		
   		@resourceArray = resourceArray

   		@scraper = scraper

      @db_host = host
      @db_user = user
      @db_pass = password
      @db_name = db_name
     # @client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass)
  	 # @client.query("CREATE DATABASE #{@db_name}")

  	end


  	def getDictionaries
  		index = 1
  		resourceArray.each { |resource| puts 
  			
  			
  			index = index + 1
  			@scraper.createDictionary(resource)

  		 }

  		 return @scraper.hashList


  	end

   
  
  	def pushToDB
      
      
      
     # client.close

  	end



end

#will have packages here
runner = Main.new(Scraper.new, "", "", "", "")

dictionaryList = runner.getDictionaries

puts dictionaryList



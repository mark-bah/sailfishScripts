require 'ckan'
#Dir["/Users/markpileggi/Documents/workspace/ckan/lib/ckan/*.rb"].each {|file| require file }
class Scraper


	attr_accessor :line
	attr_accessor :hash
	attr_accessor :hashList

	 def initialize
   		
   		@hash = Hash.new
   		@hashList = []
   		puts "initializing app: #{@line}"
  	

  	end



	def createDictionary(line)

		keyArray = []
		valueArray = []
		@hash = Hash.new

		keyArray = line.scan(/@(.*?)=/)
		puts "keyArray #{keyArray}"

		valueArray = line.scan(/"([^"]*)"/)
		puts "commaArray #{valueArray}"



		index = 0;
		for element in valueArray do
 		 
 		 

 		 puts "key #{keyArray[index]}"
 		 puts "value #{element}"

 		 @hash[keyArray[index]] = element
 		 index = index + 1
		end

		puts "FINAL HASH: #{@hash}"

		hashList.push(@hash)

		

		
	end

	


	

end






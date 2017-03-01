
import urllib
import pprint
import json
#from bson import json_util
from bson import BSON, json_util, ObjectId

#STEP 1: get all package(collection) names
#https://catalog.data.gov/api/3/action/package_search
#STEP 2: for each package, grab the data, and cast it into the exchange DB in the correct fields (namely URL, description, name, source)

#https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=greKLfEh0eSYZ52a5oPEgCtzy0Fzau7DBd9zdNWo&location=Baltimore+MD
url = 'https://catalog.data.gov/api/3/action/package_search'
fileobj = urllib.urlopen(url)

s=fileobj.read()
parsed = json.loads(s)
iter = 0

#pretty print if needed
#print json.dumps(parsed, indent=4, sort_keys=True)


s = json.dumps(s, indent=4, default=json_util.default)
s = json.loads(s)
#pprint.pprint(parsed['result']['results'][0]['id'])

namedict = parsed['result']['results']
for names in namedict:
	iter = iter + 1
	print "id #", iter, ":", names['resources'][0]['url']



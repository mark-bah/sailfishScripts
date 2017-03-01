'''
#python 2.7 example
import urllib
url = 'https://inventory.data.gov/api/action/datastore_search?resource_id=102fd9bd-4737-401b-b88f-5c5b0fab94ec&limit=5&q=title:jones'
fileobj = urllib.urlopen(url)
print(fileobj.read())
'''

#STEP 1: get all package(collection) names
#STEP 2: for each package, grab the data, and cast it into the exchange DB in the correct fields (namely URL, description, name, source)

'''
#python 3.5
import urllib.request
with urllib.request.urlopen("https://catalog.data.gov/api/action/package_search") as url:
#https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=greKLfEh0eSYZ52a5oPEgCtzy0Fzau7DBd9zdNWo&location=Baltimore+MD
#with urllib.request.urlopen("https://inventory.data.gov/api/action/datastore_search?resource_id=102fd9bd-4737-401b-b88f-5c5b0fab94ec&limit=5&q=title:jones") as url:
    s = url.read()

print(s)
'''
'''
import urllib2
import urllib
import json
import pprint

# Put the details of the dataset we're going to create into a dict.
dataset_dict = {
    'name': 'my_dataset_name',
    'notes': 'A long description of my dataset',
}

# Use the json module to dump the dictionary to a string for posting.
data_string = urllib.quote(json.dumps(dataset_dict))

# We'll use the package_create function to create a new dataset.
request = urllib2.Request(
    'http://www.my_ckan_site.com/api/action/package_create')

# Creating a dataset requires an authorization header.
# Replace *** with your API key, from your user account on the CKAN site
# that you're creating the dataset on.
request.add_header('Authorization', '***')

# Make the HTTP request.
response = urllib2.urlopen(request, data_string)
assert response.code == 200

# Use the json module to load CKAN's response into a dictionary.
response_dict = json.loads(response.read())
assert response_dict['success'] is True

# package_create returns the created package as its result.
created_package = response_dict['result']
pprint.pprint(created_package)
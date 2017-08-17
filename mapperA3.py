#!/usr/bin/python

#  Write a MapReduce program which will display the most populat path

import sys
from urlparse import urlparse

for line in sys.stdin:
	data = line.strip()
	i = line.find("\"") #first quotes
	j = line.rfind("\"") #last quotes
	
	if(i>1 and j>2):
		# Found a request
		request = line[i+1:j]
		url = request.split(" ")[1]
		urlString = urlparse(url)
		# grab the path from the string that was parsed
		print "{0}\t{1}".format(urlString.path, 1)
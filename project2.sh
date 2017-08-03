# The log file is in the udacity_training/data directory, and it's currently compressed using GnuZip. 
# So you'll need to decompress it and then put it in HDFS. 
# If you take a look at the file, you'll see that each line represents a hit to the Web server. 
# It includes the IP address which accessed the site, the date and time of the access, and the name of the page which was visited.

# %h is the IP address of the client
# %l is identity of the client, or "-" if it's unavailable
# %u is username of the client, or "-" if it's unavailable
# %t is the time that the server finished processing the request. The format is [day/month/year:hour:minute:second zone]
# %r is the request line from the client is given (in double quotes). It contains the method, path, query-string, and protocol or the request.
# %>s is the status code that the server sends back to the client. You will see see mostly status codes 200 (OK - The request has succeeded), 304 (Not Modified) and 404 (Not Found). See more information on status codes in W3C.org
# %b is the size of the object returned to the client, in bytes. It will be "-" in case of status code 304.

cd /home/training/udacity_training/data
# unzip the file
gunzip access_log.gz
# load the data
hadoop fs -mkdir input2
hadoop fs -put access_log input2

# Run the Mapper and Reducer
cd /home/training/udacity_training/code
hs mapperA1.py reducerA1.py input2 outA1

# Look at the result
hadoop fs -cat outA1/part-00000 | less

# Store the result
cd ..
cd data
mkdir outA1
cd outA1
hadoop fs -get outA1/part* resultA1.csv

# Result: 2456 for /assets/js/the-associates.js 
# Use VM Virtual Box

# Download it from 
# http://content.udacity-data.com/courses/ud617/Cloudera-Udacity-Training-VM-4.1.1.c.zip

# Data Sets:
# http://content.udacity-data.com/courses/ud617/access_log.gz
# http://content.udacity-data.com/courses/ud617/purchases.txt.gz

# Download and install VirtualBox from https://www.virtualbox.org/wiki/Downloads
# Create a new Virtual machine
# Choose a name, use ‘Type’: ‘Linux’
# Select memory size for the VM. (1.5GB recommended)
# Select ‘Use an existing virtual hard drive file’’, click the button to browse to the directory you unzipped the provided VM image and press ‘Create’.
# Start the VM!

# Load the data source
cd /home/training/udacity_training/data
hadoop fs -mkdir input
hadoop fs -put purchases.txt input

# Run the Mapper and Reducer
cd /home/training/udacity_training/code
hs mapper1.py reducer1.py input out1

# Look at the result
hadoop fs -cat out1/part-00000 | less
# Store the result
cd ..
cd data
mkdir out1
cd out1
hadoop fs -get out1/part* result1.csv

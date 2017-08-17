#!/usr/bin/python

import sys

hitsTotal = 0
oldKey = None

# Loop around the data
# It will be in the format key\tval
# Where key is the path, val is the hit number

# All the hits from a particular path will be presented,
# Then the key will change and we'll deal with the next item

for line in sys.stdin:
    data_mapped = line.strip().split("\t")
    if len(data_mapped) != 2:
        # Something has gone wrong. Skip this line.
        continue

    thisKey, thisCount = data_mapped

    if oldKey and oldKey != thisKey:
        print oldKey, "\t", hitsTotal
        oldKey = thisKey;
        hitsTotal = 0

    oldKey = thisKey
    hitsTotal += float(thisCount)

if oldKey != None:
    print oldKey, "\t", hitsTotal
# Figure out basic usage of parsecsv module in nim

import parsecsv, streams

# Always going to read the same file and use the same delim for this
let
    filename = "sample.csv"
    delim = ','

# Accessing the data in a file requires opening a stream/handle to it first
var file_handle = newFileStream(filename, fmRead)

# Parsing the stream is done with a CsvParser object
var csv: CsvParser
open(csv, file_handle, filename, separator=delim)

# Headers can be read in using "readHeaderRow()"
csv.readHeaderRow()

# Header info can then be accessed like this. Returns a sequence of row headers
echo(csv.headers)

# So if I want to find the index for a specific header:
echo "'three' is in header position ", csv.headers.find("three")
#OR
echo find(csv.headers, "three")

# Looks like lines are always read via an iterator
while csv.readRow():
    # echo(csv.row) # This just prints the row out
    for col in items(csv.headers):
      echo "> ", col, ":", csv.rowEntry(col)


file_handle.close()
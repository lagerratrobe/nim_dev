# CSVreform(atter).nim

import parsecsv
import parseopt
from streams import newFileStream


proc writeHelp() =
  echo "Please specify a filename"


var
  filename: string
  keep_fields: string
  rename_fields: string
  

proc parseCSV() =
  var p: CsvParser
  p.open("crime_incidents_sample.csv")
  p.readHeaderRow()
  while p.readRow():
    echo "new row: "
    for col in items(p.headers):
      echo("> ", col, ":  ", p.rowEntry(col))
  p.close()


proc parseOptions() =
  var options = initOptParser()
  for kind, key, val in getopt(options):
    if kind == cmdArgument: filename = key
    elif kind == cmdLongOption:
      if key == "keep": keep_fields = val
      elif key == "rename": rename_fields = val
      elif key == "list": parseCSV()
    elif kind == cmdEnd:
      assert(false) # cannot happen


proc main() =
  parseOptions()
  
  if filename != "":
    echo filename
  if keep_fields != "":
    echo keep_fields
  if rename_fields != "":
    echo rename_fields

main()
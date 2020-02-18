# CSVreform(atter).nim

import parsecsv
from os import paramStr
from streams import newFileStream

var p: CsvParser
p.open("crime_incidents_sample.csv")
p.readHeaderRow()
while p.readRow():
  echo "new row: "
  for col in items(p.headers):
    echo("> ", col, ":  ", p.rowEntry(col))
p.close()

# parse_options.nim

import parseopt

proc writeHelp() =
  echo "Please specify a filename"

proc writeVersion() = discard

var filename: string

var p = initOptParser()

for kind, key, val in getopt(p):
  if kind == cmdArgument:
    filename = key
  elif kind == cmdLongOption:
    if key == "help":
      writeHelp()
    elif key == "version":
      writeVersion()
  elif kind == cmdEnd:
    assert(false) # cannot happen

if filename == "":
  # no filename has been written, so we show the help
  writeHelp()
else:
  echo filename


# parse_options.nim

import parseopt

proc writeHelp() =
  echo "Please specify a filename"

proc writeVersion() = discard

var filename: string
let params = @["--left", "--debug:3", "-l", "-r:2"]

var p = initOptParser()

for kind, key, val in getopt(p):
  case kind
  of cmdArgument:
    filename = key
  of cmdLongOption, cmdShortOption:
    case key
    of "help", "h": writeHelp()
    of "version", "v": writeVersion()
  of cmdEnd: assert(false) # cannot happen
if filename == "":
  # no filename has been written, so we show the help
  writeHelp()
else:
  echo filename
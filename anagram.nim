import os

proc main() =
  # Parse the file name from the argument passed in
  if paramCount() < 1:
      quit("Usage: anagram <filename>")

  let filename = paramStr(1)
  echo filename

  # Open the file of words
  let word_file = readFile(filename)

  # Can I print the file contents?
  echo word_file[1]

main()

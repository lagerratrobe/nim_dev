# anagram_redux.nim

# ---- Imports ----------------------------------------------------------------#
import strutils
import algorithm
import os
import strformat
import tables
import unidecode

# ---- Converts a word into it's lower-case, sorted "signature" ---------------#
proc makeSignature(word: string): string =
  let ascii = unidecode(word)
  let lower = strutils.toLowerAscii(ascii)
  let sorted_word = algorithm.sorted(lower, system.cmp)
  let signature = sorted_word.join()
  result = signature

# ---- Main body of program ---------------------------------------------------#
proc main =
  # -- Parse the lookup word from the argument passed in
  if os.paramCount() < 1:
      quit("Usage: anagram_redux <word>")
  let lookup_word = os.paramStr(1)
  let lookup_signature = makeSignature(lookup_word)
  echo strformat.fmt("Looking up '{lookup_word}'")
  
  # -- Create empty table to store results in
  var anagram_table = tables.initTable[string, seq[string]]()

  # -- Open the text file and process it
  let file = open("dict.txt")
  
  for word in file.lines():
    let signature = makeSignature(word)
    if anagram_table.hasKey(signature):
      anagram_table[signature].add(word)
    else:
      anagram_table[signature] = @[word]
      
  # -- Lookup user's word via its signature in the anagram_table
  if anagram_table[lookup_signature].len == 1:
    echo strformat.fmt("'{lookup_word}' does not have any anagrams")
  else:
    echo anagram_table[lookup_signature]
    
main()
import algorithm   
import unicode 
import strutils 

# "dict.txt" = 99180 lines
# "sample_dict.txt" = 1033 lines

# See http://nim-cookbook.btbytes.com/sequences.html 
#var signatures: seq[string] = @[] # empty sequence to store stuff in

# ---- Using an Array instead of a sequence -------- #
type
  wordArray = array[0..99180, string]

var 
  signatures: wordArray
# --------------------------------------------------- #

let file = open("dict.txt")

var i = 0
for word in file.lines():
  var stripped = strutils.multiReplace(word, ("'", ""))
  var signature = algorithm.sorted(unicode.toLower(stripped), system.cmp)
  var sorted_word = signature.join()
  #signatures.add(sorted_word)
  signatures[i] = sorted_word
  inc(i)

file.close()

#echo(signatures[0..5])
#echo(signatures.type)

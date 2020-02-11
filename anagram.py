# anagram.py

word_file = open("dict.txt", 'r')
word_data = word_file.readlines()
word_file.close()

signature_index = {}

for word in word_data:
  word = word.strip()
  word = word.lower()
  signature = ''.join(sorted(word))
  if signature not in signature_index:
    signature_index[signature] = [word]
  else:
    signature_index[signature].append(word)

print(signature_index['ilos'])

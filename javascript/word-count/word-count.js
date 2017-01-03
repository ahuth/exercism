const punctuation = new RegExp("[!¡¿?&@$%^&:.]", "g")
const separators = /[,\s]+/
const quoted = /'(\w+)'/
const WordCount = function () {}

WordCount.prototype.count = (sentence) => {
  return separate(sentence).reduce((counts, word) => {
    counts = Object.assign({[word]: 0}, counts)
    counts[word] = counts[word] + 1
    return counts
  }, {})
}

const sanitize = (sentence) => {
  return unquote(sentence.trim().toLowerCase().replace(punctuation, ""))
}

const separate = (sentence) => {
  return sanitize(sentence).split(separators)
}

const unquote = (sentence) => {
  return sentence.replace(quoted, "$1")
}

module.exports = WordCount

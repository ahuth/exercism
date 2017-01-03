const punctuation = new RegExp("[!¡¿?&@$%^&:.]", "g")
const separators = /[,\s]+/
const WordCount = function () {}

WordCount.prototype.count = (sentence) => {
  return sanitize(sentence).split(separators).reduce((counts, word) => {
    word = word.replace(/^'|'$/g, "")
    counts = Object.assign({[word]: 0}, counts)
    counts[word] = counts[word] + 1
    return counts
  }, {})
}

const sanitize = (sentence) => {
  return sentence.trim().toLowerCase().replace(punctuation, "")
}

module.exports = WordCount

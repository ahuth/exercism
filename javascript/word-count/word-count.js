const WordCount = function () {}

WordCount.prototype.count = (sentence) => {
  return sentence.trim().toLowerCase().replace(new RegExp("[!¡¿?&@$%^&:.]", "g"), "").split(/[,\s]+/).reduce((counts, word) => {
    word = word.replace(/^'|'$/g, "")
    counts = Object.assign({[word]: 0}, counts)
    counts[word] = counts[word] + 1
    return counts
  }, {})
}

module.exports = WordCount

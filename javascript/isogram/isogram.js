function Isogram(word) {
  const sanitized = sanitize(word.toLowerCase())
  const deduped = dedup(sanitized)
  this.is = deduped.length == sanitized.length
}

Isogram.prototype.isIsogram = function () {
  return this.is
}

function sanitize(word) {
  return word.replace(/[- ]/g, "")
}

function dedup(word) {
  return Array.from(new Set(word.split("")))
}

module.exports = Isogram

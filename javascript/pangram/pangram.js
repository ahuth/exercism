const alphabet = "abcdefghijklmnopqrstuvwxyz".split("")

function isPangram(text) {
  const chars = text.toLowerCase().replace(/[^a-z]/, "").split("")
  return alphabet.every(letter => chars.includes(letter))
}

function Pangram(text) {
  this.pangram = isPangram(text)
}

Pangram.prototype.isPangram = function () { return this.pangram }

module.exports = Pangram

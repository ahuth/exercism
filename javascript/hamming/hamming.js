function Hamming() {}

Hamming.prototype.compute = function (a, b) {
  if (a.length !== b.length) {
    throw new Error('DNA strands must be of equal length.')
  }

  let [first, second] = [a.split(""), b.split("")]

  return first.reduce(function (sum, item, index) {
    return sum + (item === second[index] ? 0 : 1)
  }, 0)
}

module.exports = Hamming

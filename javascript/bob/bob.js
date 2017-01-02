let Bob = function() {}

Bob.prototype.hey = function(input) {
  if (input.toUpperCase() === input && input.toLowerCase() !== input) {
    return "Whoa, chill out!"
  } else if (input.endsWith("?")) {
    return "Sure."
  } else if (input.trim()) {
    return "Whatever."
  }
  return "Fine. Be that way!"
}

module.exports = Bob

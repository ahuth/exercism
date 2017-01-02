const milliseconds = 10 ** 9 * 1000

let Gigasecond = function (start) {
  this.start = start
}

Gigasecond.prototype.date = function () {
  return new Date(this.start.getTime() + milliseconds)
}

module.exports = Gigasecond

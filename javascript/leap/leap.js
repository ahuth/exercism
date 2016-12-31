function Year(year) {
  this.byFour = () => year % 4 === 0
  this.byHundred = () => year % 100 === 0
  this.byFourHundred = () => year % 400 === 0
}

Year.prototype.isLeap = function () {
  return (this.byFour() && !this.byHundred()) || this.byFourHundred()
}

module.exports = Year

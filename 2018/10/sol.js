var alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('')
var pairs = new RegExp(alphabet.reduce((l, c) => l.concat([c.toUpperCase() + c, c + c.toUpperCase()]), []).join('|'), 'g')
var input = require('fs').readFileSync('./input').toString().trim()

var minLength = Infinity
alphabet.forEach(c => {
  strippedInput = input.replace(new RegExp(c + '|' + c.toUpperCase(), 'g'), '')
  var lastLength
  do {
    lastLength = strippedInput.length
    strippedInput = strippedInput.replace(pairs, '')
  } while (lastLength != strippedInput.length)
  minLength = Math.min(minLength, strippedInput.length)
})
console.log(minLength)

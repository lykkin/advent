var pairs = new RegExp('abcdefghijklmnopqrstuvwxyz'.split('').reduce((l, c) => l.concat([c.toUpperCase() + c, c + c.toUpperCase()]), []).join('|'), 'g')
var input = require('fs').readFileSync('./input').toString().trim()

var lastLength
do {
  lastLength = input.length
  input = input.replace(pairs, '')
} while (lastLength != input.length)
console.log(input.length)

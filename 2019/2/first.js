const instructions = require('fs')
  .readFileSync('./input')
  .toString()
  .split(',')
  .map(x => parseInt(x))

let pc = 0
let op = instructions[pc]
while (op !== 99) {
  const fst = instructions[instructions[pc + 1]]
  const snd = instructions[instructions[pc + 2]]
  instructions[instructions[pc + 3]] = calcOp(op, fst, snd)
  op = instructions[pc += 4]
}

function calcOp(op, fst, snd) {
  switch(op) {
    case 1:
      return fst + snd
    case 2:
      return fst * snd
    default:
      throw new Error('oops')
  }
}

console.log(instructions[0])

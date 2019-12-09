const templateProgram = require('fs')
  .readFileSync('./input')
  .toString()
  .split(',')
  .map(x => parseInt(x))


for (let i = 0; i <= 99; ++i) {
  for (let j = 0; j <= 99; ++j) {
    const p = Array.prototype.slice.apply(templateProgram)
    p[1] = i
    p[2] = j
    runProgram(p)
    if (p[0] === 19690720) {
      console.log(i, j)
    }
  }
}

function runProgram(instructions) {
  let pc = 0
  let op = instructions[pc]
  while (op !== 99) {
    const fst = instructions[instructions[pc + 1]]
    const snd = instructions[instructions[pc + 2]]
    instructions[instructions[pc + 3]] = calcOp(op, fst, snd)
    op = instructions[pc += 4]
  }
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


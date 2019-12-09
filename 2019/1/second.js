console.log(require('fs')
  .readFileSync('./input')
  .toString()
  .split('\n')
  .filter(a => a)
  .reduce((acc, i) => acc + calcFuel(parseInt(i)), 0)
)

function calcFuel(m) {
  let res = 0
  let f = Math.floor(m / 3) - 2
  while (f > 0) {
    res += f
    f = Math.floor(f / 3) - 2
  }
  return res
}

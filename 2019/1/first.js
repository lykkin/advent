console.log(
  require('fs')
    .readFileSync('./input')
    .toString()
    .split('\n')
    .filter(a => a)
    .reduce(
      (acc, i) => acc + Math.floor(parseInt(i)/3) - 2,
      0
    )
)

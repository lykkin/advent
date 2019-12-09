const map = new Set()
const dirMap = {
  'U': [0, 1],
  'D': [0, -1],
  'R': [1, 0],
  'L': [-1, 0]
}
let minDist = Infinity
require('fs')
  .readFileSync('./input')
  .toString()
  .split('\n')
  .filter(x => x)
  .map((x, isFirstWire) => {
    let currentPoint = [0,0]
    x.split(',').forEach(!isFirstWire
      ? dirStr => {
        const d = dirMap[dirStr[0]]   
        for (let i = 0; i < parseInt(dirStr.substring(1)); ++i) {
          currentPoint[0] += d[0]
          currentPoint[1] += d[1]
          map.add(currentPoint.toString())
        }
      }
      : dirStr => {
        const d = dirMap[dirStr[0]]   
        for (let i = 0; i < parseInt(dirStr.substring(1)); ++i) {
          currentPoint[0] += d[0]
          currentPoint[1] += d[1]
          if (map.has(currentPoint.toString())) {
            minDist = Math.min(minDist, Math.abs(currentPoint[0]) + Math.abs(currentPoint[1]))
          }
        }
      }
    )
  })
console.log(minDist)

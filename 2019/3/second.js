const map = {}
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
  .map((x, isSecondWire) => {
    let currentPoint = [0,0]
    let currentStep = 0
    x.split(',').forEach(!isSecondWire
      ? dirStr => {
        const d = dirMap[dirStr[0]]   
        for (let i = 0; i < parseInt(dirStr.substring(1)); ++i) {
          currentPoint[0] += d[0]
          currentPoint[1] += d[1]
          ++currentStep
          if (map[currentPoint.toString()] == null) {
            map[currentPoint.toString()] = currentStep
          }
        }
      }
      : dirStr => {
        const d = dirMap[dirStr[0]]   
        for (let i = 0; i < parseInt(dirStr.substring(1)); ++i) {
          currentPoint[0] += d[0]
          currentPoint[1] += d[1]
          const firstSteps = map[currentPoint.toString()]
          ++currentStep
          if (firstSteps) {
            minDist = Math.min(minDist, currentStep + firstSteps)
          }
        }
      }
    )
  })
console.log(minDist)

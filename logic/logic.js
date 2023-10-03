function fillModel () {
    cubeModel.clear()
    for (var i=0; i<=2; i++) {
        for (var j = 0; j<=2; j++) {
            for (var k = 0; k<=2; k++) {
                cubeModel.append({x: i*5, y: j*5, z: k*5,
                                     xr: 0, yr: 0, zr: 0,
                                    top_color: j == 2 ? "yellow" : "black",
                                    right_color: i == 2 ? "green" : "black",
                                    front_color: k == 2 ? "blue" : "black",
                                    bottom_color: j == 0 ? "orange" : "black",
                                    back_color: k == 0 ? "red" : "black",
                                    left_color: i == 0 ? "pink" : "black",
                                    realX : 1, realY : 2, realZ : 3})
            }
        }

    }
}

function shuffleCube() {
    var moves = Math.random() * 1000
    for (var i = 0; i < moves; i++) {
        if (i%2 === 0) {
            rotateLeft()
            rotateTop()
            rotateRightA()
        } else {
            rotateRight()
            rotateTopA()
            rotateLeftA()
        }
        rotateTop()
    }
}

function coloredSidesCount(cube) {
    return (6 - Object.values(cube).filter((v)=>(v==="black")))
}

function coloredSides(cube) {
    var sides = []
    var p = Object.values(cube).filter((v)=>(v !=="black" && typeof(v) === "string"))

}

function rotateLeft() {
    for (var i = 0; i<cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z
        const xr = cubeModel.get(i).xr

        if (x === 0) {
            if (y === 0 && z === 0) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 0)
            } else if (y === 5 && z === 0) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 5)
            } else if (y === 10 && z === 0) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 10)
            } else if (y === 0 && z === 5) {
                cubeModel.setProperty(i, "y", 5)
                cubeModel.setProperty(i, "z", 0)
            } else if (y === 10 && z === 5) {
                cubeModel.setProperty(i, "y", 5)
                cubeModel.setProperty(i, "z", 10)
            } else if (y === 0 && z === 10) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 0)
            } else if (y === 5 && z === 10) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 5)
            } else if (y === 10 && z === 10) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 10)
            }

            var realX = cubeModel.get(i).realX
            var realY = cubeModel.get(i).realY
            var realZ = cubeModel.get(i).realZ

            cubeModel.setProperty(i, "xr", xr + 90)
        }
    }
}

function rotateLeftA() {
    for (var i = 0; i<cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z
        const xr = cubeModel.get(i).xr

        if (x === 0) {
            if (y === 0 && z === 0) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 10)
            } else if (y === 5 && z === 0) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 5)
            } else if (y === 10 && z === 0) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 0)
            } else if (y === 0 && z === 5) {
                cubeModel.setProperty(i, "y", 5)
                cubeModel.setProperty(i, "z", 10)
            } else if (y === 10 && z === 5) {
                cubeModel.setProperty(i, "y", 5)
                cubeModel.setProperty(i, "z", 0)
            } else if (y === 0 && z === 10) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 10)
            } else if (y === 5 && z === 10) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 5)
            } else if (y === 10 && z === 10) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 0)
            }

            var realX = cubeModel.get(i).realX
            var realY = cubeModel.get(i).realY
            var realZ = cubeModel.get(i).realZ
            switch (Math.abs(realX)) {
            case 1:
                cubeModel.setProperty(i, "xr", xr - 90)
                break;
            case 2:
                cubeModel.setProperty(i, "yr", yr - 90)
                break;
            case 3:
                cubeModel.setProperty(i, "zr", zr - (90*realX/Math.abs(realX)))
                break;
            default:
                console.log("Unknown value realY " + cubeModel.get(i).realY)
                break;
            }

            var temp = cubeModel.get(i).realY

            cubeModel.setProperty(i, "realY", cubeModel.get(i).realZ)
            cubeModel.setProperty(i, "realZ", temp)        }
    }
}

function rotateRight() {
    for (var i = 0; i < cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z
        const xr = cubeModel.get(i).xr
        const yr = cubeModel.get(i).yr
        const zr = cubeModel.get(i).zr

        if (i === 6) {
            coloredSides(cubeModel.get(i))

        }


        if (x === 10) {
            if (y === 0 && z === 0) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 0)
            } else if (y === 5 && z === 0) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 5)
            } else if (y === 10 && z === 0) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 10)
            } else if (y === 0 && z === 5) {
                cubeModel.setProperty(i, "y", 5)
                cubeModel.setProperty(i, "z", 0)
            } else if (y === 10 && z === 5) {
                cubeModel.setProperty(i, "y", 5)
                cubeModel.setProperty(i, "z", 10)
            } else if (y === 0 && z === 10) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 0)
            } else if (y === 5 && z === 10) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 5)
            } else if (y === 10 && z === 10) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 10)
            }

            //cubeModel.setProperty(i, "xr", xr + 90)

            var realX = cubeModel.get(i).realX
            var realY = cubeModel.get(i).realY
            var realZ = cubeModel.get(i).realZ

            switch (Math.abs(realX)) {
            case 1:
                cubeModel.setProperty(i, "xr", xr + (90*realX/Math.abs(realX)))
                break;
            case 2:
                cubeModel.setProperty(i, "yr", yr + (90*realX/Math.abs(realX)))
                break;
            case 3:
                cubeModel.setProperty(i, "zr", zr + (90*realX/Math.abs(realX )))
                break;
            default:
                console.log("Unknown value realY " + cubeModel.get(i).realY)
                break;
            }

            var temp = cubeModel.get(i).realY

            cubeModel.setProperty(i, "realY", cubeModel.get(i).realZ)
            cubeModel.setProperty(i, "realZ", -temp)
        }
    }
}

function rotateRightA() {
    for (var i = 0; i < cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z
        const xr = cubeModel.get(i).xr
        const yr = cubeModel.get(i).yr
        const zr = cubeModel.get(i).zr


        if (x === 10) {
            if (y === 0 && z === 0) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 10)
            } else if (y === 5 && z === 0) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 5)
            } else if (y === 10 && z === 0) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "z", 0)
            } else if (y === 0 && z === 5) {
                cubeModel.setProperty(i, "y", 5)
                cubeModel.setProperty(i, "z", 10)
            } else if (y === 10 && z === 5) {
                cubeModel.setProperty(i, "y", 5)
                cubeModel.setProperty(i, "z", 0)
            } else if (y === 0 && z === 10) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 10)
            } else if (y === 5 && z === 10) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 5)
            } else if (y === 10 && z === 10) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "z", 0)
            }

            var realX = cubeModel.get(i).realX
            var realY = cubeModel.get(i).realY
            var realZ = cubeModel.get(i).realZ

            switch (Math.abs(realX)) {
            case 1:
                cubeModel.setProperty(i, "xr", xr - (90*realX/Math.abs(realX)))
                break;
            case 2:
                cubeModel.setProperty(i, "yr", yr - (90*realX/Math.abs(realX)))
                break;
            case 3:
                cubeModel.setProperty(i, "zr", zr - (90*realX/Math.abs(realX)))
                break;
            default:
                console.log("Unknown value realY " + cubeModel.get(i).realY)
                break;
            }

            var temp = cubeModel.get(i).realY

            cubeModel.setProperty(i, "realY", -cubeModel.get(i).realZ)
            cubeModel.setProperty(i, "realZ", temp)
        }
    }
}

function rotateTop() {
    for (var i = 0; i < cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z
        const xr = cubeModel.get(i).xr
        const yr = cubeModel.get(i).yr
        const zr = cubeModel.get(i).zr


        if (y === 10) {
            if (x === 0 && z === 0) {
                cubeModel.setProperty(i, "x", 10)
                cubeModel.setProperty(i, "z", 0)
            } else if (x === 5 && z === 0) {
                cubeModel.setProperty(i, "x", 10)
                cubeModel.setProperty(i, "z", 5)
            } else if (x === 10 && z === 0) {
                cubeModel.setProperty(i, "x", 10)
                cubeModel.setProperty(i, "z", 10)
            } else if (x === 0 && z === 5) {
                cubeModel.setProperty(i, "x", 5)
                cubeModel.setProperty(i, "z", 0)
            } else if (x === 10 && z === 5) {
                cubeModel.setProperty(i, "x", 5)
                cubeModel.setProperty(i, "z", 10)
            } else if (x === 0 && z === 10) {
                cubeModel.setProperty(i, "x", 0)
                cubeModel.setProperty(i, "z", 0)
            } else if (x === 5 && z === 10) {
                cubeModel.setProperty(i, "x", 0)
                cubeModel.setProperty(i, "z", 5)
            } else if (x === 10 && z === 10) {
                cubeModel.setProperty(i, "x", 0)
                cubeModel.setProperty(i, "z", 10)
            }

            const realX = cubeModel.get(i).realX
            const realY = cubeModel.get(i).realY
            const realZ = cubeModel.get(i).realZ

            switch (Math.abs(realY)) {

            case 1:
                cubeModel.setProperty(i, "xr", xr - (90*realY/Math.abs(realY)))
                break;
            case 2:
                cubeModel.setProperty(i, "yr", yr - (90*realY/Math.abs(realY)))
                break;
            case 3:
                cubeModel.setProperty(i, "zr", zr - (90*realY/Math.abs(realY)))
                break;
            default:
                console.log("Unknown value realY " + cubeModel.get(i).realY)
                break;
            }

            //if (realY < 0 ) {
            //    cubeModel.setProperty(i, "realX", cubeModel.get(i).realZ)
            //    cubeModel.setProperty(i, "realZ", -realX)
            //} else {
                cubeModel.setProperty(i, "realX", -cubeModel.get(i).realZ)
                cubeModel.setProperty(i, "realZ", realX)
            //}

        }
    }
}

function rotateTopA() {
    for (var i = 0; i < cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z
        const yr = cubeModel.get(i).yr


        if (y === 10) {
            if (x === 0 && z === 0) {
                cubeModel.setProperty(i, "x", 0)
                cubeModel.setProperty(i, "z", 10)
            } else if (x === 5 && z === 0) {
                cubeModel.setProperty(i, "x", 0)
                cubeModel.setProperty(i, "z", 5)
            } else if (x === 10 && z === 0) {
                cubeModel.setProperty(i, "x", 0)
                cubeModel.setProperty(i, "z", 0)
            } else if (x === 0 && z === 5) {
                cubeModel.setProperty(i, "x", 5)
                cubeModel.setProperty(i, "z", 10)
            } else if (x === 10 && z === 5) {
                cubeModel.setProperty(i, "x", 5)
                cubeModel.setProperty(i, "z", 0)
            } else if (x === 0 && z === 10) {
                cubeModel.setProperty(i, "x", 10)
                cubeModel.setProperty(i, "z", 10)
            } else if (x === 5 && z === 10) {
                cubeModel.setProperty(i, "x", 10)
                cubeModel.setProperty(i, "z", 5)
            } else if (x === 10 && z === 10) {
                cubeModel.setProperty(i, "x", 10)
                cubeModel.setProperty(i, "z", 0)
            }
            cubeModel.setProperty(i, "yr", yr + 90)
        }
    }
}

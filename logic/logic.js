function fillModel () {
    for (var i=0; i<=2; i++) {
        for (var j = 0; j<=2; j++) {
            for (var k = 0; k<=2; k++) {
                cubeModel.append({x: i*5, y: j*5, z: k*5,
                                     xr: 0, yr: 0, zr: 0})
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
        Logic.rotateTop()
    }
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

            cubeModel.setProperty(i, "xr", xr - 90)
        }
    }
}

function rotateRight() {
    for (var i = 0; i < cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z
        const xr = cubeModel.get(i).xr


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

            cubeModel.setProperty(i, "xr", xr + 90)
        }
    }
}

function rotateRightA() {
    for (var i = 0; i < cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z
        const xr = cubeModel.get(i).xr


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

            cubeModel.setProperty(i, "xr", xr - 90)
        }
    }
}

function rotateTop() {
    for (var i = 0; i < cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z
        const yr = cubeModel.get(i).yr


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
            cubeModel.setProperty(i, "yr", yr - 90)
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

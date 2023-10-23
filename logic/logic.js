
const hiddenColor = "black"

function fillModel () {
    cubeModel.clear()
    var count = 0
    for (var i=0; i<=2; i++) {
        for (var j = 0; j<=2; j++) {
            for (var k = 0; k<=2; k++) {
                cubeModel.set(count, {x: i*5 + 10, y: j*5 + 10, z: k*5 + 10,
                                    top_color: j == 2 ? "yellow" : hiddenColor,
                                    right_color: i == 2 ? "green" : hiddenColor,
                                    front_color: k == 2 ? "blue" : hiddenColor,
                                    bottom_color: j == 0 ? "orange" : hiddenColor,
                                    back_color: k == 0 ? "red" : hiddenColor,
                                    left_color: i == 0 ? "pink" : hiddenColor})
                count++;
            }
        }

    }

    count = 0;

    for (i=0; i<=2; i++) {
        for (j = 0; j<=2; j++) {
            for (k = 0; k<=2; k++) {
                cubeModel.set(count, {x: i*5, y: j*5, z: k*5,
                                    top_color: j == 2 ? "yellow" : hiddenColor,
                                    right_color: i == 2 ? "green" : hiddenColor,
                                    front_color: k == 2 ? "blue" : hiddenColor,
                                    bottom_color: j == 0 ? "orange" : hiddenColor,
                                    back_color: k == 0 ? "red" : hiddenColor,
                                    left_color: i == 0 ? "pink" : hiddenColor})
                count++;
            }
        }

    }
}

function shuffleCube() {
    var moves = parseInt(Math.random() * 10)
    switch (moves) {
    case 1:
        rotateRight()
        break;
    case 2:
        rotateRightA()
        break;
    case 3:
        rotateFront()
        break;
    case 4:
        rotateFrontA()
        break;
    case 5:
        rotateTop()
        break;
    case 6:
        rotateTopA()
        break;
    case 7:
        rotateLeft()
        break;
    case 8:
        rotateLeftA()
        break;
    }
}

function coloredSidesCount(cube) {
    return (6 - Object.values(cube).filter((v)=>(v==="black")))
}

function coloredSides(cube) {
    var sides = []
    var p = Object.values(cube).filter((v)=>(v !=="black" && typeof(v) === "string"))

}

function moveCube(name) {
    switch (name) {
        case "R": {
            rotateRight()
            break;
        }
        case "R'": {
            rotateRightA()
            break;
        }

        case "L": {
            rotateLeft()
            break;
        }
        case "L'": {
            rotateLeftA()
            break;
        }

        case "T": {
            rotateTop()
            break;
        }
        case "T'": {
            rotateTopA()
            break;
        }

        case "F": {
            rotateFront()
            break;
        }

        case "F'": {
            rotateFrontA()
            break;
        }
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

            cubeRepeater.objectAt(i).rotate(90, Qt.vector3d(1, 0, 0), Node.ParentSpace)
            cubeRepeater.objectAt(i).nextRotation = cubeRepeater.objectAt(i).rotation
            cubeRepeater.objectAt(i).aAnim.start()
        }
    }
}

function rotateLeftA() {
    for (var i = 0; i<cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z

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

            cubeRepeater.objectAt(i).rotate(-90, Qt.vector3d(1, 0, 0), Node.ParentSpace)
            cubeRepeater.objectAt(i).nextRotation = cubeRepeater.objectAt(i).rotation
            cubeRepeater.objectAt(i).aAnim.start()
        }
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

            cubeRepeater.objectAt(i).rotate(90, Qt.vector3d(1, 0, 0), Node.ParentSpace)
            cubeRepeater.objectAt(i).nextRotation = cubeRepeater.objectAt(i).rotation
            cubeRepeater.objectAt(i).aAnim.start()
        }
    }
    checkCube()
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

            cubeRepeater.objectAt(i).rotate(-90, Qt.vector3d(1, 0, 0), Node.ParentSpace)
            cubeRepeater.objectAt(i).nextRotation = cubeRepeater.objectAt(i).rotation
            cubeRepeater.objectAt(i).aAnim.start()
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

            cubeRepeater.objectAt(i).rotate(-90, Qt.vector3d(0, 1, 0), Node.ParentSpace)
            cubeRepeater.objectAt(i).nextRotation = cubeRepeater.objectAt(i).rotation
            cubeRepeater.objectAt(i).aAnim.start()
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
            cubeRepeater.objectAt(i).rotate(90, Qt.vector3d(0, 1, 0), Node.ParentSpace)
            cubeRepeater.objectAt(i).nextRotation = cubeRepeater.objectAt(i).rotation
            cubeRepeater.objectAt(i).aAnim.start()
        }
    }
}

function rotateFront() {
    for (var i = 0; i < cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z

        if (i === 6) {
            coloredSides(cubeModel.get(i))
        }

        if (z === 10) {
            if (y === 0 && x === 0) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "x", 0)
            } else if (y === 5 && x === 0) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "x", 5)
            } else if (y === 10 && x === 0) {
                cubeModel.setProperty(i, "y", 10)
                cubeModel.setProperty(i, "x", 10)
            } else if (y === 0 && x === 5) {
                cubeModel.setProperty(i, "y", 5)
                cubeModel.setProperty(i, "x", 0)
            } else if (y === 10 && x === 5) {
                cubeModel.setProperty(i, "y", 5)
                cubeModel.setProperty(i, "x", 10)
            } else if (y === 0 && x === 10) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "x", 0)
            } else if (y === 5 && x === 10) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "x", 5)
            } else if (y === 10 && x === 10) {
                cubeModel.setProperty(i, "y", 0)
                cubeModel.setProperty(i, "x", 10)
            }

            cubeRepeater.objectAt(i).rotate(-90, Qt.vector3d(0, 0, 1), Node.ParentSpace)
            cubeRepeater.objectAt(i).nextRotation = cubeRepeater.objectAt(i).rotation
            cubeRepeater.objectAt(i).aAnim.start()
        }
    }

}

function rotateFrontA() {
    for (var i = 0; i < cubeModel.count; i++) {
        const x = cubeModel.get(i).x
        const y = cubeModel.get(i).y
        const z = cubeModel.get(i).z

        if (i === 6) {
            coloredSides(cubeModel.get(i))
        }

        if (z === 10) {
            if (x === 0 && y === 0) {
                cubeModel.setProperty(i, "x", 10)
                cubeModel.setProperty(i, "y", 0)
            } else if (x === 5 && y === 0) {
                cubeModel.setProperty(i, "x", 10)
                cubeModel.setProperty(i, "y", 5)
            } else if (x === 10 && y === 0) {
                cubeModel.setProperty(i, "x", 10)
                cubeModel.setProperty(i, "y", 10)
            } else if (x === 0 && y === 5) {
                cubeModel.setProperty(i, "x", 5)
                cubeModel.setProperty(i, "y", 0)
            } else if (x === 10 && y === 5) {
                cubeModel.setProperty(i, "x", 5)
                cubeModel.setProperty(i, "y", 10)
            } else if (x === 0 && y === 10) {
                cubeModel.setProperty(i, "x", 0)
                cubeModel.setProperty(i, "y", 0)
            } else if (x === 5 && y === 10) {
                cubeModel.setProperty(i, "x", 0)
                cubeModel.setProperty(i, "y", 5)
            } else if (x === 10 && y === 10) {
                cubeModel.setProperty(i, "x", 0)
                cubeModel.setProperty(i, "y", 10)
            }

            cubeRepeater.objectAt(i).rotate(90, Qt.vector3d(0, 0, 1), Node.ParentSpace)
            cubeRepeater.objectAt(i).nextRotation = cubeRepeater.objectAt(i).rotation
            cubeRepeater.objectAt(i).aAnim.start()
        }
    }

}

function setCubeProperty (index, prop, value) {
    cubeModel.setProperty(index, prop, value*0.1)
}

function checkCube () {
    cubeEModel.clear()

//    for (var i=0; i<=2; i++) {
//        for (var j = 0; j<=2; j++) {
//            for (var k = 0; k<=2; k++) {
//                cubeEModel.append({x: i*5, y: j*5, z: k*5,
//                                    top_color: j == 2 ? "yellow" : hiddenColor,
//                                    right_color: i == 2 ? "green" : hiddenColor,
//                                    front_color: k == 2 ? "blue" : hiddenColor,
//                                    bottom_color: j == 0 ? "orange" : hiddenColor,
//                                    back_color: k == 0 ? "red" : hiddenColor,
//                                    left_color: i == 0 ? "pink" : hiddenColor})
//            }
//        }
//    }

    for (var i=0; i<=2; i++) {
        for (var j = 0; j<=2; j++) {
            for (var k = 0; k<=2; k++) {
                if (cubeModel.get(i).x === i*5 &&
                        cubeModel.get(i).y === j*5 &&
                        cubeModel.get(i).z === k*5) {
                }
            }
        }
    }
}

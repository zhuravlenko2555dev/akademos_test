function calcPerimeter(buildings) {
    let perimeter = 0;

    for (let i = 0; i < buildings.length; i++) {
        for (let y = 0; y < buildings[i].length; y++) {
            let isLeftX = y !== 0 ? buildings[i].charAt(y - 1) === 'X' : false;
            let isUpX = i !== 0 ? buildings[(i - 1)].charAt(y) === 'X' : false;
            if (buildings[i].charAt(y) === 'X') {
                if (!isLeftX) perimeter++;
                if (!isUpX) perimeter++;
                if (y === (buildings[i].length - 1)) perimeter++;
                if (i === (buildings.length - 1)) perimeter++;
            } else {
                if (isLeftX) perimeter++;
                if (isUpX) perimeter++;
            }
        }
    }

    return perimeter;
}

console.log(calcPerimeter([' X'])); // The function must return 4.

console.log(calcPerimeter([
    'X',
    'X',
    ' ',
])); // Must return 6

console.log(calcPerimeter([
    'X   X ',
    'X   X ',
    '    X ',
    'XX  X ',
    ' X    ',
])); // Must return 24
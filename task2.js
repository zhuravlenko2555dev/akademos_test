function addDashes(num) {
    let strNum = num.toString();
    let resultNum = "";
    let isCurrentOdd = false;

    for (let i = 0; i < strNum.length; i++) {
        let n = Math.floor(num / Math.pow(10, (strNum.length - (1 + i))));
        let isPreviousOdd = isCurrentOdd;
        if (Math.abs(n % 2) === 1) {
            isCurrentOdd = true;
            if (i !== 0 && !isPreviousOdd) {
                resultNum += "-";
            }
            resultNum += n.toString().slice(-1);
        } else {
            isCurrentOdd = false;
            if (i !== 0 && isPreviousOdd) {
                resultNum += "-";
            }
            resultNum += n.toString().slice(-1);
        }
    }

    return resultNum;
}

console.log(addDashes(645545965)); // '64-55-4-59-6-5'
console.log(addDashes(411222333)); // '4-11-222-333'
console.log(addDashes(81229576231)); // '8-1-22-957-62-31'
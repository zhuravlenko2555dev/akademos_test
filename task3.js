function autocomplete(input, dictionary) {
    let matches = [];
    let lcInput = input.toLowerCase();
    lcInput = lcInput.replace(/[^a-z]/gi, '');

    for (let i = 0; i < dictionary.length; i++) {
        let dItem = dictionary[i].toLowerCase();
        let lcInputItem = lcInput;

        if (lcInputItem.length > dItem.length) {
            lcInputItem = lcInputItem.slice(0, (0 - (lcInputItem.length - dItem.length)));
        }

        do {
            if (dItem.startsWith(lcInputItem)) {
                matches.push(dictionary[i]);
                break;
            }
            lcInputItem = lcInputItem.slice(0, -1);
        } while (lcInputItem.length > 0)

        if (matches.length === 5) {
            break;
        }
    }

    return matches;
}

console.log(autocomplete('li2@r-a', ['light','lime','slime','ball', 'list', 'lips', 'library', 'linux'])); // ['light','lime']
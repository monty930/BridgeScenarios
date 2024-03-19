function update_hand_suit_content(dsiString, dealNum) {
    document.getElementById('table-num').style.display = 'block';
    document.getElementById('table-num').textContent = dealNum;
    let deal = extract_deal(dsiString, dealNum);
    let longest_suit = 0;
    document.querySelectorAll('.hands').forEach(handDiv => {
        const handType = handDiv.classList[1];
        handDiv.querySelectorAll('.suit').forEach(suitDiv => {
            const suitType = suitDiv.querySelector('div').classList[0];
            let suit_char = suitType.split('-')[1];
            if (suit_char === 'diamonds') {
                suit_char = 'diams';
            }
            let suit_string = "<div class='suit-char " + suit_char + "-char'> &" + suit_char + ";</div>"
                + extract_suit(deal, handType, suitType);
            if (handDiv.classList.contains('hand-west') && suit_string.length > longest_suit) {
                longest_suit = suit_string.length;
            }
            suitDiv.querySelector('div').innerHTML = suit_string;
        });
        if (longest_suit === 4) {
            handDiv.classList.add('west-balanced');
        } else {
            handDiv.classList.remove('west-balanced');
        }
    });
    let vul = extract_vul(deal); // (bool bool)
    if (vul[0]) {
        document.getElementById('N-vul').classList.add('vul');
        document.getElementById('S-vul').classList.add('vul');
    } else {
        document.getElementById('N-vul').classList.remove('vul');
        document.getElementById('S-vul').classList.remove('vul');
    }

    if (vul[1]) {
        document.getElementById('E-vul').classList.add('vul');
        document.getElementById('W-vul').classList.add('vul');
    } else {
        document.getElementById('E-vul').classList.remove('vul');
        document.getElementById('W-vul').classList.remove('vul');
    }

    let dealer = extract_dealer(deal); // N / E / S / W
    document.getElementById('N-vul').classList.remove('dealer');
    document.getElementById('E-vul').classList.remove('dealer');
    document.getElementById('S-vul').classList.remove('dealer');
    document.getElementById('W-vul').classList.remove('dealer');
    let dealerDiv = document.getElementById(dealer + '-vul');
    dealerDiv.classList.add('dealer')
}

let rebind_right_buttons = () => {
    rebind_button(MyButtons.generateExample);
    rebind_button(MyButtons.generateDealSet);
    rebind_button(MyButtons.error);
    rebind_button(MyButtons.save);
    rebind_button(MyButtons.nextDeal);
    rebind_button(MyButtons.previousDeal);
    rebind_button(MyButtons.trash);
    rebind_button(MyButtons.regenerateOne);
    rebind_button(MyButtons.addDeal);

    update_buttons_animations();
}

let show_spinner = () => {
    document.getElementById('spinner').style.display = 'block';
    if (document.getElementById('table-num') != null) {
        document.getElementById('table-num').style.display = 'none';
    }
}

// The function hides the entry message and shows the spinner
let init_deal_generation = () => {
    if (document.getElementById('entry-message') != null) {
        document.getElementById('entry-message').style.display = 'none';
    }

    show_spinner();
}

let disable_right_buttons = () => {
    MyButtons.nextDeal.setDeactivated(false);
    MyButtons.addDeal.setDeactivated(false);
    MyButtons.addDeal.element.classList.remove('hidden');
    if (window.localStorage.getItem('CurrentDealNum') === "1") {
        MyButtons.previousDeal.setDeactivated(true);
        let previousImage = document.querySelector('#previousDealButton .dealset-img');
        previousImage.src = './assets/arrow-back-deactiv.png';
    } else {
        MyButtons.previousDeal.setDeactivated(false);
        let previousImage = document.querySelector('#previousDealButton .dealset-img');
        previousImage.src = './assets/arrow-back.png';
    }
    if (window.localStorage.getItem('CurrentDealNum') === window.localStorage.getItem('NumOfDeals')) {
        MyButtons.nextDeal.setDeactivated(true);
        let nextImage = document.querySelector('#nextDealButton .dealset-img');
        nextImage.src = './assets/arrow-deactiv.png';
    } else {
        MyButtons.addDeal.setDeactivated(true);
        MyButtons.addDeal.element.classList.add('hidden');
        let nextImage = document.querySelector('#nextDealButton .dealset-img');
        nextImage.src = './assets/arrow.png';
    }
}

display_form = () => {
    document.getElementById("dialogSaveWindow").style.display = "block";
    document.getElementById("filenameArea").disabled = false;
    document.getElementById("saveChoices").disabled = false;
    document.getElementById("submitButton").disabled = false;
    document.getElementById("closeButton").disabled = false;
}

hide_form = () => {
    document.getElementById("dialogSaveWindow").style.display = "none";
}

disable_form_buttons = () => {
    document.getElementById("filenameArea").disabled = true;
    document.getElementById("saveChoices").disabled = true;
    document.getElementById("submitButton").disabled = true;
    document.getElementById("closeButton").disabled = true;
}

let update_buttons_animations = () => {
    let trashButton = document.getElementById('trashButton');
    let trashImage = document.querySelector('#trashButton .dealset-img');

    if (trashButton) {
        trashButton.addEventListener('mouseover', function () {
            trashImage.src = './assets/trash_open.png';
        });

        trashButton.addEventListener('mouseleave', function () {
            trashImage.src = './assets/trash.png';
        });
    }

    let saveButton = document.getElementById('saveButton');
    let saveImage = document.querySelector('#saveButton .dealset-img');

    if (saveButton) {
        saveButton.addEventListener('mouseover', function () {
            saveImage.src = './assets/download-2.png';
        });

        saveButton.addEventListener('mouseleave', function () {
            saveImage.src = './assets/download-1.png';
        });
    }

    let retryButton = document.getElementById('retryButton');
    let retryImage = document.querySelector('#retryButton .dealset-img');

    if (retryButton) {
        retryButton.addEventListener('mouseover', function () {
            retryImage.classList.add('rotate-image');
        });

        retryButton.addEventListener('mouseleave', function () {
            retryImage.classList.remove('rotate-image');
        });
    }
}
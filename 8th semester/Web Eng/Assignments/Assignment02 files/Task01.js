
let bigSquare = document.getElementById('bigsquare');
let smallSq1 = document.getElementById('ss1');
let smallSq2 = document.getElementById('ss2');
let start = document.getElementById('start');
let stp = document.getElementById('stop');
let reset = document.getElementById('reset');

start.addEventListener('click', startanimation);
stp.addEventListener('click', stopanimation);
reset.addEventListener('click', resetsquares);


function movesquares() {
    const x1 = Math.floor(Math.random() * (bigSquare.clientWidth - smallSq1.clientWidth));  //avaialable 150px to right from it's original position.
    const y1 = Math.floor(Math.random() * (bigSquare.clientHeight - smallSq1.clientHeight));//avaialable 150px to bottom from it's original position.
    smallSq1.style.transform = `translate(${x1}px, ${y1}px)`;

    const x2 = Math.floor(Math.random() * (bigSquare.clientWidth - smallSq2.clientWidth));//avaialable 150px to right from it's original position.
    const y2 = Math.floor(Math.random() * (bigSquare.clientHeight - 2 * smallSq2.clientHeight));//avaialable 100px to bottom from it's original position.
    smallSq2.style.transform = `translate(${x2}px, ${y2}px)`;

}
let returnId;
function startanimation() {
    returnId = setInterval(movesquares, 1000)
}
function stopanimation() {
    clearInterval(returnId);
}
function resetsquares() {
    clearInterval(returnId);
    smallSq1.style.transform = `translate(${0}px,${0}px)`;//move 0px from its original position.
    smallSq2.style.transform = `translate(${0}px,${0}px)`;
}

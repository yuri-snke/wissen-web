var checkCont = 0;
var max = 3;
$(document).ready(function () {
    document.getElementById("botao").disabled = true;
});
function setCheck(objt){
    desabilitarBtn();
    if (objt.checked) {
        checkCont = checkCont + 1;
    }
    else{
        checkCont = checkCont - 1;
    }
    if (checkCont === max) {
        habilitarBtn();
    }
    if (checkCont > max) {
        habilitarBtn();
        objt.checked = false;
        checkCont = checkCont - 1;
        $("#limite").modal("show");
    }
}
function habilitarBtn(){
    document.getElementById("botao").disabled = false;
}
function desabilitarBtn(){
    document.getElementById("botao").disabled = true;
}
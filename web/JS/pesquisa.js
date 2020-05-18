var checkCont = 0;
var max = 1;
function setCheck(objt){
	if (objt.checked) {
		checkCont = checkCont + 1;
	}
	else{
		checkCont = checkCont - 1;
	}
	if (checkCont > max) {
		objt.checked = false;
		checkCont = checkCont - 1;
		$("#limite").modal("show");
	}
}
function evento(){
	var x = document.getElementById('eventos');
	var y = document.getElementById('pessoas');
	var corE = document.getElementById('b-eve');
	var corP = document.getElementById('b-pes');
	var iconeE = document.getElementById('iconeE');
	var iconeP = document.getElementById('iconeP');
	if (x.style.display == 'none' || x.style.display == 'block') {
		$("#eventos").fadeIn("slow");
		iconeE.style.color = "#d49802";
		iconeP.style.color = "#fff";
		corE.style.color = '#d49802';
		corP.style.color = '#fff';
		x.style.display	= 'block';
		y.style.display = 'none';
	}
}
function people(){
	var y = document.getElementById('eventos');
	var x = document.getElementById('pessoas');
	var corE = document.getElementById('b-eve');
	var corP = document.getElementById('b-pes');
	var iconeE = document.getElementById('iconeE');
	var iconeP = document.getElementById('iconeP');
	if (x.style.display == 'none' || x.style.display == 'block') {
		$("#pessoas").fadeIn("slow");
		iconeE.style.color = "#fff";
		iconeP.style.color = "#d49802";
		corP.style.color = '#d49802';
		corE.style.color = '#fff';
		x.style.display	= 'block';
		y.style.display = 'none';
	}
}
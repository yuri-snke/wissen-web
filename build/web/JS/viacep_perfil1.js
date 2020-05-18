$(document).ready(function(){

	function limpaCEP(){
		$("#in_uf").val("");
		$("#in_cidade").val("");
                $("#in_endereco").val("");
	}

	$("#in_cep").blur(function(){
		var cep = $(this).val().replace(/\D/g, '');

		if (cep != "") {

			var validacep = /^[0-9]{8}$/;

			if (validacep.test(cep)) {

				$("#in_uf").val("...");
				$("#in_cidade").val("...");
                                $("#in_endereco").val("...");
				$.getJSON("http://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados){

					if (!("erro" in dados)) {

						$("#in_uf").val(dados.uf);
						$("#in_cidade").val(dados.localidade);
                                                $("#in_endereco").val(dados.logradouro);
					}
					else{
						limpaCEP();
						//Colocar Modal aqui
						$("#cepNE").modal("show");
					}
				});
			}
			else{
				limpaCEP();
				//Colocar outra modal aqui
				$("#cepNAE").modal("show");
			}
		}
		else{
			limpaCEP();
		}
	});
});
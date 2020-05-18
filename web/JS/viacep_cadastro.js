$(document).ready(function(){

	function limpaCEP(){
		$("#icon_uf").val("");
		$("#icon_cidade").val("");
                $("#icon_end").val("");
	}

	$("#icon_cep").blur(function(){
		var cep = $(this).val().replace(/\D/g, '');

		if (cep != "") {

			var validacep = /^[0-9]{8}$/;

			if (validacep.test(cep)) {

				$("#icon_uf").val("...");
				$("#icon_cidade").val("...");
                                $("#icon_end").val("...");

				$.getJSON("http://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados){

					if (!("erro" in dados)) {

						$("#icon_uf").val(dados.uf);
						$("#icon_cidade").val(dados.localidade);
                                                $("#icon_end").val(dados.logradouro);
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
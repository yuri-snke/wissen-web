$(document).ready(function () {

    function limpaCEP() {
        $("#icon_uf").val("");
        $("#icon_cidade").val("");
        $("#icon_bairro").val("");
        $("#icon_endereco").val("");
    }

    $("#icon_cep").blur(function () {
        var cep = $(this).val().replace(/\D/g, '');

        if (cep != "") {

            var validacep = /^[0-9]{8}$/;

            if (validacep.test(cep)) {

                $("#icon_uf").val("...");
                $("#icon_cidade").val("...");
                $("#icon_bairro").val("...");
                $("#icon_endereco").val("...");
                $.getJSON("http://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                    if (!("erro" in dados)) {

                        $("#icon_uf").val(dados.uf);
                        $("#icon_cidade").val(dados.localidade);
                        $("#icon_bairro").val(dados.bairro);
                        $("#icon_endereco").val(dados.logradouro);
                    } else {
                        limpaCEP();
                        //Colocar Modal aqui
                        $("#cepNE").modal("show");
                    }
                });


                $.getJSON("http://maps.googleapis.com/maps/api/geocode/json?address=" + cep + "&language=pt-BR&sensor=true", function (dados) {
                    if (!("erro" in dados)) {

                        $("#icon_lat").val(dados.geometry.location.lat);
                        $("#icon_long").val(dados.geometry.location.lng);
                    }

                });
            } else {
                limpaCEP();
                //Colocar outra modal aqui
                $("#cepNAE").modal("show");
            }
        } else {
            limpaCEP();
        }
    });
});



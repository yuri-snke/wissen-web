$(document).ready(function () {
    $('.carousel[data-type="multi"] .item').each(function () {
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));

        for (var i = 0; i < 1; i++) {
            next = next.next();
            if (!next.length) {
                next = $(this).siblings(':first');
            }

            next.children(':first-child').clone().appendTo($(this));
        }
    });
});
function info() {
    var x = document.getElementById('informacoes');
    var y = document.getElementById('conteudo');
    var w = document.getElementById('alterarFoto');
    var z = document.getElementById('configSeguranca');
    var corI = document.getElementById('l-info');
    var corF = document.getElementById('l-foto');
    var corC = document.getElementById('l-cog');
    if (x.style.display == 'none') {
        $("#informacoes").fadeIn("slow");
        corI.style.color = '#d49802';
        corF.style.color = '#fff';
        corC.style.color = '#fff';
        x.style.display = 'block';
        y.style.display = 'none';
        w.style.display = 'none';
        z.style.display = 'none';
    } else if (x.style.display == 'block') {
        $("#conteudo").fadeIn("slow");
        corI.style.color = '#fff';
        x.style.display = 'none';
        y.style.display = 'block';
        w.style.display = 'none';
        z.style.display = 'none';
    }
}
function foto() {
    var x = document.getElementById('alterarFoto');
    var y = document.getElementById('conteudo');
    var w = document.getElementById('informacoes');
    var z = document.getElementById('configSeguranca');
    var corF = document.getElementById('l-foto');
    var corI = document.getElementById('l-info');
    var corC = document.getElementById('l-cog');
    if (x.style.display == 'none') {
        $("#alterarFoto").fadeIn("slow");
        corF.style.color = '#d49802';
        corI.style.color = '#fff';
        corC.style.color = '#fff';
        x.style.display = 'block';
        y.style.display = 'none';
        w.style.display = 'none';
        z.style.display = 'none';
    } else if (x.style.display == 'block') {
        $("#conteudo").fadeIn("slow");
        corF.style.color = '#fff';
        x.style.display = 'none';
        y.style.display = 'block';
        w.style.display = 'none';
        z.style.display = 'none';
    }
}
function cog() {
    var x = document.getElementById('configSeguranca');
    var y = document.getElementById('conteudo');
    var w = document.getElementById('informacoes');
    var z = document.getElementById('alterarFoto');
    var corF = document.getElementById('l-foto');
    var corI = document.getElementById('l-info');
    var corC = document.getElementById('l-cog');
    if (x.style.display == 'none') {
        $("#configSeguranca").fadeIn("slow");
        corC.style.color = '#d49802';
        corF.style.color = '#fff';
        corI.style.color = '#fff';
        x.style.display = 'block';
        y.style.display = 'none';
        w.style.display = 'none';
        z.style.display = 'none';
    } else if (x.style.display == 'block') {
        $("#conteudo").fadeIn("slow");
        corC.style.color = '#fff';
        x.style.display = 'none';
        y.style.display = 'block';
        w.style.display = 'none';
        z.style.display = 'none';
    }
}
function priv() {
    var x = document.getElementById('privacidade');
    var y = document.getElementById('formCog');
    var corPriv = document.querySelector('.l-priv');
    var corData = document.querySelector('.l-data');
    var botao = document.querySelector('.cancelar')
    if (x.style.display == 'none') {
        $("#privacidade").fadeIn("slow");
        corPriv.style.color = '#d49802';
        corData.style.display = 'none';
        x.style.display = 'block';
        y.style.display = 'none';
        botao.style.display = 'none';
    } else if (x.style.display == 'block') {
        $("#configSeguranca").fadeIn("slow");
        corPriv.style.color = '#fff';
        corData.style.display = 'block';
        x.style.display = 'none';
        y.style.display = 'none';
        botao.style.display = 'block';
        botao.style.margin = '0 auto';
    }
}
function data() {
    var x = document.getElementById('privacidade');
    var y = document.getElementById('formCog');
    var corPriv = document.querySelector('.l-priv');
    var corData = document.querySelector('.l-data');
    var botao = document.querySelector('.cancelar')
    if (x.style.display == 'none') {
        $("#formCog").fadeIn("slow");
        corData.style.color = '#d49802';
        corPriv.style.display = 'none';
        y.style.display = 'block';
        x.style.display = 'none';
        botao.style.display = 'none';
    } else if (x.style.display == 'block') {
        $("#configSeguranca").fadeIn("slow");
        corData.style.color = '#fff';
        corPriv.style.display = 'block';
        y.style.display = 'none';
        x.style.display = 'none';
        botao.style.display = 'block';
        botao.style.margin = '0 auto';
    }
}
function resetFoto() {
    document.getElementById('formFoto').reset();
    var the_return = document.querySelector('.file-return');
    the_return.innerHTML = '';
    var x = document.getElementById('configSeguranca');
    var y = document.getElementById('conteudo');
    var w = document.getElementById('informacoes');
    var z = document.getElementById('alterarFoto');
    var corF = document.getElementById('l-foto');
    var corI = document.getElementById('l-info');
    var corC = document.getElementById('l-cog')
    $("#conteudo").fadeIn("slow");
    corF.style.color = '#fff';
    corI.style.color = '#fff';
    corC.style.color = '#fff';
    x.style.display = 'none';
    y.style.display = 'block';
    w.style.display = 'none';
    z.style.display = 'none';
}
function resetInfo() {
    document.getElementById('formInfo').reset();
    var x = document.getElementById('configSeguranca');
    var y = document.getElementById('conteudo');
    var w = document.getElementById('informacoes');
    var z = document.getElementById('alterarFoto');
    var corF = document.getElementById('l-foto');
    var corI = document.getElementById('l-info');
    var corC = document.getElementById('l-cog');
    $("#conteudo").fadeIn("slow");
    corF.style.color = '#fff';
    corI.style.color = '#fff';
    corC.style.color = '#fff';
    x.style.display = 'none';
    y.style.display = 'block';
    w.style.display = 'none';
    z.style.display = 'none';
}
function resetCog() {
    var x = document.getElementById('configSeguranca');
    var y = document.getElementById('privacidade');
    var z = document.getElementById('formCog');
    var corPriv = document.querySelector('.l-priv');
    var corData = document.querySelector('.l-data');
    var botao = document.querySelector('.cancelar')
    z.reset();
    $("#configSeguranca").fadeIn("slow");
    x.style.display = 'block';
    y.style.display = 'none';
    z.style.display = 'none';
    corPriv.style.color = '#fff';
    corPriv.style.display = 'block';
    corData.style.color = '#fff';
    corData.style.display = 'block';
    botao.style.display = 'block';
    botao.style.margin = '0 auto';
}
function voltar() {
    var x = document.getElementById('configSeguranca');
    var y = document.getElementById('conteudo');
    var w = document.getElementById('informacoes');
    var z = document.getElementById('alterarFoto');
    var corF = document.getElementById('l-foto');
    var corI = document.getElementById('l-info');
    var corC = document.getElementById('l-cog');
    $("#conteudo").fadeIn("slow");
    corF.style.color = '#fff';
    corI.style.color = '#fff';
    corC.style.color = '#fff';
    x.style.display = 'none';
    y.style.display = 'block';
    w.style.display = 'none';
    z.style.display = 'none';
}
function mostrarPS() {
    var detect = document.getElementById('exibirPS');
    if (detect.checked == true) {
        document.getElementById('in_psecret').type = 'text';
    } else {
        document.getElementById('in_psecret').type = 'password';
    }
}
function mostrarS() {
    var detect = document.getElementById('exibirS');
    if (detect.checked == true) {
        document.getElementById('in_senha').type = 'text';
    } else {
        document.getElementById('in_senha').type = 'password';
    }
}

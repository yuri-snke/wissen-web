<%-- 
    Document   : blindtech
    Created on : 31/08/2017, 15:56:19
    Author     : Anderson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!--<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">-->
        
  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- JavaScript -->
        <script type="text/javascript" src="./JS/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./MDB_3.4.1/MDB Free/js/mdb.min.js"></script>
        <script type="text/javascript" src="./Holder/holder.min.js"></script>
        <script type="text/javascript" src="./JS/validator.min.js"></script>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="MDB_3.4.1/MDB Free/css/mdb.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/btech.css">
        <!-- Fontes -->
        <link rel="stylesheet" type="text/css" href="./CSS/Fontes.css">
        <link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
        <!-- Icone -->
        <link rel="icon" href="./Imagens/IconeBlindTech_1.png" type="image/x-icon"/>
        <title>BTech</title>
    </head>
    <body id="btech" data-spy="scroll" data-target=".navbar" data-offset-top="60">
        <nav class="navbar navbar-default navbar-fixed-top grey darken-4 righteous-font">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#menu">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="#btech" class="navbar-brand righteous-font"><img src="./Imagens/LogoBlindTech_1.png" class="logoBtechNav"></a>
                </div>
                <div id="menu" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a class="righteous-font" href="#quemSomos">QUEM SOMOS ?</a></li>
                        <li><a class="righteous-font" href="#missao">MISSÃO</a></li>
                        <li><a class="righteous-font" href="#aplicacao">APLICAÇÕES</a></li>
                        <li><a class="righteous-font" href="#wissen">WISSEN</a></li>
                        <li><a class="righteous-font" href="#desenvolvedores">EQUIPE</a></li>
                        <li><a class="righteous-font" href="#tellme">FALE CONOSCO</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <script type="text/javascript">
            $(document).ready(function () {
                $('body').scrollspy({target: ".navbar", offset: 40});
                $("#menu a").on('click', function (event) {
                    if (this.hash !== "") {
                        event.preventDefault();

                        var hash = this.hash;

                        $('html, body').animate({
                            scrollTop: $(hash).offset().top
                        }, 800, function () {

                            window.location.hash = hash;
                        });
                    }
                });
            });
        </script>
        <div id="background" class="container-fluid text-center">
            <div class="row">
                <div class="fundo">
                    <div class="text-center inicio">
                        <h4 class="righteous-font"> O QUE A TECNOLOGIA TE CEGA, <br> A GENTE TE MOSTRA!</h4>
                        <h1 class="righteous-font">BlindTech</h1>
                        <p>Aquele que tentou e não conseguiu, é superior <br> aquele que não tentou.</p>
                        <form action="index.jsp">
                            <button type="submit" class="btn btn-default btn-lg">O Aplicativo</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="quemSomos">
            <div class="container text-center">
                <h1>BLIND TECH</h1>
                <p>Blind Tech é uma empresa de informática voltada para a área do desenvolvimento de aplicações web e mobile,
                    formada em 2017, por oito estudantes de TI, com a finalidade de entrar para o mercado tecnológico de um jeito tanto diferente,
                    não queremos que as pessoas fiquem presas aos seus telefones e computadores, e sim que a interação social cresça, logo nossa empresa busca
                    eliminar a faixa escura que cobre os olhos das pessoas através de certas tecnologias, fazendo da própria tecnologia sua arma.
                </p>
                <img class="img-thumbnail" data-src="holder.js/700x300" src="./Imagens/About_us.png" >
            </div>
        </div>
        <div class="container">
            <hr>
        </div>
        <div id="missao">
            <div class="container text-center">
                <h1>MISSÃO</h1>
                <div class="row">
                    <div class="col-xs-12 col-md-6">
                        <h4>OBJETIVO</h4>
                        <img src="./Imagens/HandShake.png" class="img-thumbnail" data-src="holder.js/250x250">
                        <p>Jovens e adultos tem o costume de saírem de suas casas para estarem indo a programas que lhes deem um outro tipo de distração.  Por não encontrarem esses tipos de programas, acabam não saindo de suas casas, dificultando interação social entre pessoas de diferentes culturas. A empresa percebeu essa necessidade e buscou atendê-los com aplicativos de fácil manuseio e navegação, com o objetivo de suprir as necessidades sociais, acadêmicas, culturais e de lazer de nossa sociedade atual.</p>
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <h4>PÚBLICO ALVO</h4>
                        <img src="./Imagens/Alvo2.png" class="img-thumbnail" data-src="holder.js/250x250">
                        <p>A empresa BlindTech, visa atender jovens e adultos. Pois conforme pesquisas, vimos que esse tipo público, necessita de uma ferramenta que os ajude a encontrar eventos mais rapidamente.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <hr>
        </div>
        <div id="aplicacao">
            <div id="slider" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#slider" data-slide-to="0" class="active"></li>
                    <li data-target="#slider" data-slide-to="1" ></li>
                    <li data-target="#slider" data-slide-to="2" ></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img class="first-slide" src="./Imagens/corporativo.png" alt="Primeiro Slide">
                        <div class="container">
                            <div class="carousel-caption">
                                <h4>VENHA FAZER PARTE</h4>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img class="second-slide" src="./Imagens/business.png" alt="Segundo Slide" data-src="holder.js/auto">
                        <div class="container">
                            <div class="carousel-caption">
                                <h4>CONHEÇA OS EVENTOS</h4>	
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img class="third-slide" src="./Imagens/festival.png" alt="Terceiro Slide" data-src="holder.js/auto">
                        <div class="container">
                            <div class="carousel-caption">
                                <h4>EXPLORE</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#slider" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#slider" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <script>window.jQuery || document.write('<script src="./bootstrap/js/jquery.min.js"><\/script>')</script>
        <div id="wissen">
            <div class="container text-center">
                <h1>WISSEN</h1>	
                <div class="row">
                    <div class="col-xs-12 col-md-4">
                        <h4>O QUE É ?</h4>
                        <img src="./Imagens/duvida.jpg" data-src="holder.js/250x250" class="img-thumbnail wissen">
                        <p>Um aplicativo que facilita a divulgação de eventos de diversas categorias por todo o Brasil, aumentando assim, a interação social entre pessoas de diferentes culturas. </p>
                    </div>
                    <div class="col-xs-12 col-md-4">
                        <h4>VANTAGENS</h4>
                        <img src="./Imagens/vantagens.jpg" data-src="holder.js/250x250" class="img-thumbnail wissen">
                        <p>Os nossos usuários têm vantagens por preferir utilizar o nosso aplicativo, onde podem realizar diversas alterações, como definir se o evento é particular ou público, se ele é de grande ou pequena escala. Além disso, possui sistema de comentário e de denúncias para avaliação, a segurança é garantida por esses métodos incluindo também um sistema de ranking. Essas alterações são essenciais para uma boa comunicação e funcionamento do aplicativo. </p>
                    </div>
                    <div class="col-xs-12 col-md-4">
                        <h4>PLATAFORMAS</h4>
                        <img src="./Imagens/plataformas.jpg" data-src="holder.js/250x250" class="img-thumbnail wissen">
                        <p>Para utilizar o WISSEN, foram desenvolvidas duas formas de navegação. Sendo uma delas a navegação web, que tem como objetivo ser uma plataforma mais ampla e formal para o manuseio de seus eventos; e a navegação mobile que visa a praticidade de seus usuários, em questão de seus compromissos cotidianos.  </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <hr>
        </div>
        <div id="desenvolvedores">
            <div class="container text-center">
                <h1>EQUIPE</h1>
                <div class="col-xs-12 col-md-3">
                    <img src="./Imagens/Membros/Andre.jpg" class="img-thumbnail photo">
                    <h4>André<br>Pessoa</h4>
                    <p>Front-End WEB</p>
                </div>
                <div class="col-xs-12 col-md-3">
                    <img src="./Imagens/Membros/Fefe.jpg" class="img-thumbnail photo">
                    <h4>Fernanda<br>Morais</h4>
                    <p>Back-End Mobile</p>
                </div>
                <div class="col-xs-12 col-md-3">
                    <img src="./Imagens/Membros/Gabriel.jpg" class="img-thumbnail photo">
                    <h4>Gabriel<br>Martins</h4>
                    <p>Full Stack</p>
                </div>
                <div class="col-xs-12 col-md-3">
                    <img src="./Imagens/Membros/Gustavo.jpg" class="img-thumbnail photo">
                    <h4>Gustavo<br>Daniel</h4>
                    <p>Front-End Mobile</p>
                </div>
                <div class="col-xs-12 col-md-3">
                    <img src="./Imagens/Membros/Jow.jpg" class="img-thumbnail photo">
                    <h4>Jonathan<br>Silva</h4>
                    <p>Front-End WEB</p>
                </div>
                <div class="col-xs-12 col-md-3">
                    <img src="./Imagens/Membros/Juju.jpg" class="img-thumbnail photo">
                    <h4>Juliana<br>Sousa</h4>
                    <p>DBA</p>
                </div>
                <div class="col-xs-12 col-md-3">
                    <img src="./Imagens/Membros/Victor.jpg" class="img-thumbnail photo">
                    <h4>Victor<br>Hugo</h4>
                    <p>Back-End Mobile</p>
                </div>
                <div class="col-xs-12 col-md-3">
                    <img src="./Imagens/Membros/Yuri.jpg" class="img-thumbnail photo">
                    <h4>Yuri<br>Oliveira</h4>
                    <p>DBA Web-Service</p>
                </div>
            </div>
        </div>
        <div class="container">
            <hr>
        </div>
        <div id="tellme">
            <div class="container text-center">
                <h1>FALE CONOSCO</h1>
                <div class="row">
                    <form class="col-xs-12 col-md-12 col-lg-12 text-center" data-toggle="validator" role="form" action="BlindServlet" method="POST">
                        <div class="row">
                            <div class="input-field col-xs-12 col-md-8 col-lg-6 form-group">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="icon_prefix" class="validate" type="email" name="email" data-error="Por favor, informe um e-mail correto." required>
                                <label for="icon_prefix">E-mail</label>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="input-field col-xs-12 col-md-8 col-lg-6 form-group">
                                <i class="material-icons prefix">warning</i>
                                <input id="icon_prefix" class="validate" type="text" name="assunto" data-error="Informe o assunto">
                                <label for="icon_prefix">Assunto</label>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="input-field col-xs-12 col-md-12 col-lg-12 form-group">
                                <i class="material-icons prefix">mode_edit</i>
                                <textarea id="texto" class="validate" name="mensagem"data-minlength="20" maxlength="300" data-error="Escreva algo com pelo menos 30 caracteres"></textarea>
                                <label for="texto"></label>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="col-xs-12 col-md-12 col-lg-12 text-center">
                                <button type="submit" class="enviar btn light-blue darken-4 waves-effect waves-light righteous-font"> Enviar</button>
                                <button type="reset" class="enviar btn light-blue darken-4 waves-effect waves-light righteous-font"> Limpar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>	
        </div>
        <div class="container">
            <hr>
        </div>
        <footer class="footer">
            <div class="container">
                <div class="col-xs-12 col-md-4">
                    <img src="./Imagens/LogoBlindTech.png" class="logoBtech">
                    <p class="text-muted">© 2017 BlindTech Development Group Inc.</p>
                </div>

            </div>
        </footer>
    </body>
</html>
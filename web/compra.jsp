<%-- 
    Document   : compra
    Created on : 03/10/2017, 14:25:03
    Author     : CT Tarde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta TAGS -->
        <!--<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">-->


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- JavaScript -->
        <script type="text/javascript" src="./JS/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./MDB_3.4.1/MDB Free/js/mdb.min.js"></script>
        <script type="text/javascript" src="./Holder/holder.min.js"></script>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="MDB_3.4.1/MDB Free/css/mdb.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/footer.css">
        <link rel="stylesheet" type="text/css" href="./CSS/compra.css">
        <link href="CSS/menu2.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="./Imagens/IconeWissen.png" type="image/x-icon" sizes="16x16"/>
        <!-- Fontes -->

        <link rel="stylesheet" type="text/css" href="./CSS/Fontes.css">
        <link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
        <title>Wissen</title>
    </head>
    <body>
        <nav class="navbar purple darken-4 navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="homepage.jsp" class="navbar-brand righteous-font">Wissen</a>
                </div>
                <div id="menu" class="navbar-collapse collapse">
                    <div class="navbar-left">
                        <form action="pesquisa.jsp">
                            <table>
                                <tr>
                                    <td>
                                        <input class="form-control" placeholder="Buscar. . ." type="search" value="" name="search" id="search">
                                    </td>
                                    <td>
                                        <button class="btn btn-lg warning-color waves-light waves-effect search" type="submit" value=""><span class="glyphicon glyphicon-search"></span></button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="cadastroEv.jsp" class="text-center link"><i class="material-icons prefix">add_circle_outline</i><br> Eventos</a></li>
                        <li class="dropdown">
                            <a href=""  class="dropdown-toggle waves-effect waves-light text-center link" data-toggle="dropdown" role="button" aria-expanded="false"><i class="material-icons prefix">more</i><br> Mais</a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="perfil.jsp">Configurações de Segurança</a></li>
                                <li><a href="index.jsp">Sair</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div id="conteudo" class="container-fluid text-center">
            <h1 class="righteous-font">Pacotes Premiums</h1>
            <h4>A melhor escolha para você,<br> agora!</h4>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pacote">
                <i class="material-icons prefix i-prata">monetization_on</i>
                <h3  class="righteous-font prata">Silver</h3>	
                <p>
                    1 mês.
                </p>
                <form method="POST" action="UsuarioServlet">
                    <input type="hidden" name="tipo" value="1" />
                    <button type="submit" value="Premium" name="Action" class="btn btn-lg buy b-prata righteous-font">Comprar</button><span class="preco righteous-font">R$ 30,00</span>
                </form>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pacote">
                <i class="material-icons prefix i-ouro">monetization_on</i>
                <h3 class="righteous-font ouro">Gold</h3>
                <p>
                    6 meses.
                </p>
                <form method="POST" action="UsuarioServlet">
                    <input type="hidden" name="tipo" value="6" />
                    <button type="submit" value="Premium" name="Action" class="btn btn-lg buy b-ouro righteous-font">Comprar</button><span class="preco righteous-font">R$ 150,00</span>	
                </form>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pacote">
                <i class="material-icons prefix i-diamante">monetization_on</i>
                <h3 class="righteous-font diamante">Diamond</h3>
                <p>
                    12 meses.
                </p>
                <form method="POST" action="UsuarioServlet">
                    <input type="hidden" name="tipo" value="12" />
                    <button type="submit" value="Premium" name="Action" class="btn btn-lg buy b-diamante righteous-font">Comprar</button><span class="preco righteous-font">R$ 210,00</span>	
                </form>
            </div>
        </div>
        <footer class="footer">
            <div class="container">
                <div class="col-xs-12 col-md-4 col-sm-6">
                    <img src="./Imagens/LogoBlindTech.png" class="logoBtech img-responsive">
                </div>
                <div class="col-xs-12 col-md-4 col-sm-3">
                    <p class="text-muted">© 2017 BlindTech Development Group Inc.</p>
                </div>
                <div class="col-xs-12 col-md-4 col-sm-3">
                    <img src="./Imagens/WissenKK.png" class="logoWissen img-responsive">
                </div>
            </div>
        </footer>
    </body>
</html>
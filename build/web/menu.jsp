<%-- 
Document   : menu
Created on : 31/08/2017, 16:23:59
Author     : Anderson
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
        <link href="CSS/menu2.css" rel="stylesheet" type="text/css"/>
        <!-- Fontes -->
        <link rel="stylesheet" type="text/css" href="./CSS/Fontes.css">
        <link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
        <title>Wissen - Menu</title>
        <style>
            
        </style>
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
                        <form>
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
                        <li class="dropdown dropdown-large">
                            <a href="" class="dropdown-toggle waves-effect waves-light text-center link" data-toggle="dropdown" role="button" aria-expanded="false"><i class="material-icons prefiz">priority_high</i><br>Novos</a>
                            <ul class="dropdown-menu dropdown-menu-large row" role="menu">
                                <li>
                                <li class="dropdown-header">Eventos</li>
                                <ul>
                                    <li><a href="">Você tem novos eventos <span class="badge warning-color">#</span></a></li>
                                    <li><a href="">Eventos próximos <span class="badge success-color">#</span></a></li>
                                </ul>
                        </li>
                        <li>
                        <li class="dropdown-header">Amigos</li>
                        <ul>
                            <li><a href="">Você tem novos seguidores <span class="badge warning-color">#</span></a></li>
                        </ul>
                        </li>
                    </ul>
                    </li>
                    <li><a href="" class="text-center link"><i class="material-icons prefix">add_circle_outline</i><br> Eventos</a></li>
                    <li class="dropdown">
                        <a href=""  class="dropdown-toggle waves-effect waves-light text-center link" data-toggle="dropdown" role="button" aria-expanded="false"><i class="material-icons prefix">more</i><br> Mais</a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="perfil.jsp">Configurações de Segurança</a></li>
                            <li><a href="IndexServlet" method="POST" name="Action" value="Sair">Sair</a></li>
                        </ul>
                    </li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
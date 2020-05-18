<%-- 
    Document   : homepageFT
    Created on : 31/08/2017, 16:10:14
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
        <script src="JS/homepageFT2.js" type="text/javascript"></script>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="MDB_3.4.1/MDB Free/css/mdb.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/homepageFT.css">
        <link rel="icon" href="./Imagens/IconeWissen.png" type="image/x-icon" sizes="16x16"/>
        <!-- Fontes -->
        <link rel="stylesheet" type="text/css" href="./CSS/Fontes.css">
        <link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
        <title>Wissen</title>
    </head>
    <body>

        <div id="conteudo">
            <div class="container-fluid text-center">
                <h3>Qual a sua preferência?</h3>
                <p>Obs..  Você pode marcar até 3 categorias</p>
                <p>${ErroFT}</p>
                <form method="post" name="choose" id="escolha" action="UsuarioServlet" method="POST">
                    <h1 class="righteous-font">Categorias</h1>
                    <hr>
                    <ul class="categorias">
                        <div class="col-centered">  
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-1">
                                    <input type="checkbox"  name="cat-1" id="cat-1" onclick="setCheck(this)">
                                    <label for="cat-1" class="cat">Cat - 1</label>
                                    <p class="text-center"><strong>Ao Ar Livre</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-2">
                                    <input type="checkbox"  name="cat-2" id="cat-2" onclick="setCheck(this)">
                                    <label for="cat-2" class="cat">Cat - 2</label>
                                    <p class="text-center"><strong>Bar</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-3">
                                    <input type="checkbox"  name="cat-3" id="cat-3" onclick="setCheck(this)">
                                    <label for="cat-3" class="cat">Cat - 3</label>
                                    <p class="text-center"><strong>Casamento</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-4">
                                    <input type="checkbox"  name="cat-4" id="cat-4" onclick="setCheck(this)">
                                    <label for="cat-4" class="cat">Cat - 4</label>
                                    <p class="text-center"><strong>Cinema</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-5">
                                    <input type="checkbox"  name="cat-5" id="cat-5" onclick="setCheck(this)">
                                    <label for="cat-5" class="cat">Cat - 5</label>
                                    <p class="text-center"><strong>Corporativo</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-6">
                                    <input type="checkbox"  name="cat-6" id="cat-6" onclick="setCheck(this)">
                                    <label for="cat-6" class="cat">Cat - 6</label>
                                    <p class="text-center"><strong>Crianças</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-7">
                                    <input type="checkbox"  name="cat-7" id="cat-7" onclick="setCheck(this)">
                                    <label for="cat-7" class="cat">Cat - 7</label>
                                    <p class="text-center"><strong>Eventos Culturais</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-8">
                                    <input type="checkbox"  name="cat-8" id="cat-8" onclick="setCheck(this)">
                                    <label for="cat-8" class="cat">Cat - 8</label>
                                    <p class="text-center"><strong>Exposição</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-9">
                                    <input type="checkbox" name="cat-9" id="cat-9" onclick="setCheck(this)">
                                    <label for="cat-9" class="cat">Cat - 9</label>
                                    <p class="text-center"><strong>Feiras</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-10">
                                    <input type="checkbox" name="cat-10" id="cat-10" onclick="setCheck(this)">
                                    <label for="cat-10" class="cat">Cat - 10</label>
                                    <p class="text-center"><strong>Festas</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-11">
                                    <input type="checkbox" name="cat-11" id="cat-11" onclick="setCheck(this)">
                                    <label for="cat-11" class="cat">Cat - 11</label>
                                    <p class="text-center"><strong>Festival</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-12">
                                    <input type="checkbox" name="cat-12" id="cat-12" onclick="setCheck(this)">
                                    <label for="cat-12" class="cat">Cat - 12</label>
                                    <p class="text-center"><strong>Formatura</strong></p>
                                </li> 
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-13">
                                    <input type="checkbox" name="cat-13" id="cat-13" onclick="setCheck(this)">
                                    <label for="cat-13" class="cat">Cat - 13</label>
                                    <p class="text-center"><strong>Gastronomia</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-14">
                                    <input type="checkbox" name="cat-14" id="cat-14" onclick="setCheck(this)">
                                    <label for="cat-14" class="cat">Cat - 14</label>
                                    <p class="text-center"><strong>Literatura</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-16">
                                    <input type="checkbox" name="cat-16" id="cat-16" onclick="setCheck(this)">
                                    <label for="cat-16" class="cat">Cat - 16</label>
                                    <p class="text-center"><strong>Restaurante</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-17">
                                    <input type="checkbox" name="cat-17" id="cat-17" onclick="setCheck(this)">
                                    <label for="cat-17" class="cat">Cat - 17</label>
                                    <p class="text-center"><strong>Social</strong></p>
                                </li>
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-18">
                                    <input type="checkbox" name="cat-18" id="cat-18" onclick="setCheck(this)">
                                    <label for="cat-18" class="cat">Cat - 18</label>
                                    <p class="text-center"><strong>Urbano</strong></p>
                                </li> 
                            </div>
                            <div class="col-xs-12 col-md-4 col-sm-6 col-lg-2">
                                <li class="categoria cat-15">
                                    <input type="checkbox" name="cat-15" id="cat-15" onclick="setCheck(this)">
                                    <label for="cat-15" class="cat">Cat - 15</label>
                                    <p class="text-center"><strong>Outros</strong></p>
                                </li> 
                            </div>
                        </div>
                    </ul>
                    <div class="text-center">
                        <button type="submit"  name="Action" value="FirstTime" id="botao" class="btn btn-lg waves-effect waves-light righteous-font"> Prosseguir</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal fade" id="limite" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-left">
                        <h4 class="righteous-font">Lembrete</h4>
                    </div>
                    <div class="modal-body" style="padding: 40px 50px;">
                        <div class="row">
                            <p>Você excedeu o limite, escolha apenas 3 opções</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn deep-purple darken-1 waves-effect waves-light pull-left" data-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!--<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE-Edge">-->

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Wissen</title>
        <!-- JavaScript -->
        <script src="JS/homepage.js" type="text/javascript"></script>
        <script type="text/javascript" src="./JS/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./MDB_3.4.1/MDB Free/js/mdb.min.js"></script>
        <script type="text/javascript" src="./Holder/holder.min.js"></script>
        <script type="text/javascript" src="./JS/validator.min.js"></script>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="MDB_3.4.1/MDB Free/css/mdb.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/index1.css">
        <link rel="icon" href="./Imagens/IconeWissen.png" type="image/x-icon" sizes="16x16"/>
        <!-- Fontes -->
        <link rel="stylesheet" type="text/css" href="./CSS/Fontes.css">
    </head>
    <body id="wissen">
        <div id="comecar">
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <img src="Imagens/WissenKK.png" alt="" class="img-responsive logo"/>
                <button type="button" class="login btn waves-effect waves-light righteous-font" data-toggle="modal" data-target="#loginModal"> Logar</button>
                <button type="button" class="cadastro btn waves-effect waves-light righteous-font" data-toggle="modal" data-target="#cadastroModal">Cadastre-se</button>
                <form action="BlindTech.jsp">
                    <button type="submit" class="visita btn waves-effect waves-light righteous-font">Visite-nos</button>
                </form>
            </div>
        </div>
        <div id="aplicacao">
            <div class="col-md-8 col-lg-8 col-sm-6 col-xs-12">
                <div id="slider" class="carousel slide carousel-fade hoverable" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#slider" data-slide-to="0" class="active"></li>
                        <li data-target="#slider" data-slide-to="1"></li>
                    </ol>
                    <div class="carousel-inner z-depth-2" role="listbox">
                        <div class="item active">
                            <div class="view overlay hm-blue-slight">
                                <a>
                                    <img src="Imagens/carrro11.png" alt="" class="img-responsive"/>
                                    <div class="mask waves-effect waves-light"></div>
                                </a>
                            </div>
                       
                        </div>
                        <div class="item">
                            <div class="view overlay hm-blue-slight">
                                <a><img src="Imagens/carro2.png" class="img-responsive">
                                    <div class="mask waves-effect waves-light"></div>
                                </a>
                            </div>          
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="loginModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="righteous-font">Login</h4>
                        <h8 class="righteous-font">${ErroLogin}</h8>
                    </div>
                    <div class="modal-body" style="padding: 40px 50px;">
                        <div class="row">
                            <form class="col-md-12" data-toggle="validator" role="form" method="POST" action="UsuarioServlet">
                                <div class="row">
                                    <div class="input-field form-group">
                                        <i class="material-icons prefix">email</i>
                                        <input id="icon_email" type="email" name="email" data-error="Por favor, informe um e-mail correto." required>
                                        <label for="icon_email">Seu Email</label>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div class="input-field form-group">
                                        <i class="material-icons prefix">lock</i>

                                        <input id="icon_lock" type="password" name="senha" required>
                                        <label for="icon_lock">Sua Senha</label>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" name="Action" value="Logar" class="login btn waves-effect waves-light">Logar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-warning waves-effect waves-light pull-left" data-dismiss="modal"> Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="cadastroModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="righteous-font">Cadastro</h4>
                    </div>
                    <div class="modal-body" style="padding: 40px 50px;">
                        <div class="row">
                            <form class="col-md-12" action="UsuarioServlet" data-toggle="validator" role="form" method="POST">
                                <div class="row">
                                    <div class="input-field form-group">
                                        <i class="material-icons prefix">email</i>

                                        <input id="icon_email" type="email" name="email" data-error="Por favor, informe um e-mail correto." required>
                                        <label for="icon_email">Seu Email</label>
                                        <div class="help-block with-errors"></div>
                                        <h8 class="righteous-font">${ErroEmail}</h8>
                                    </div>
                                    <div class="input-field form-group">
                                        <i class="material-icons prefix">lock</i>
                                        <input id="senha" type="password" name="senha" data-minlength="5" required>
                                        <label for="senha">Sua Senha</label>
                                        <span class="help-block">Mínimo de (5) caracteres</span>
                                    </div>
                                    <div class="input-field form-group">
                                        <i class="material-icons prefix">lock</i>
                                        <input id="icon_lockConf" type="password" name="senhaConf" data-match="#senha" data-match-error="Atenção. As senhas não estão iguais" required>
                                        <label for="icon_lockConf">Confirmar Senha</label>
                                        <div class="help-block with-errors"></div>
                                        <h8 class="righteous-font">${ErroSenha}</h8>
                                    </div>
                                    <div class="input-field form-group check">
                                        <input type="checkbox" name="aceito" id="aceito" data-error="Você deve marcar este campo!" required />
                                        <label for="aceito">Li e concordo com os <a href="termos.jsp">Termos de Uso</a></label>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="cadastro btn waves-effect waves-light" value="Cadastro" name="Action">Vamos Lá!</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-warning waves-effect waves-light pull-left" data-dismiss="modal"> Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
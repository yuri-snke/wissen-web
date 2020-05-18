<%-- 
    Document   : cadastroEv
    Created on : 27/09/2017, 17:11:55
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
        <script type="text/javascript" src="./JS/validator.min.js"></script>        
        <script type="text/javascript" src="./JS/viacep_cadastroev.js"></script>                
        <script type="text/javascript" src="./JS/jquery.mask.min.js"></script>
        <script type="text/javascript" src="./JS/masks.js"></script>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="MDB_3.4.1/MDB Free/css/mdb.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/menu2.css">
        <link rel="stylesheet" type="text/css" href="./CSS/footer.css">
        <link rel="stylesheet" type="text/css" href="./CSS/cadastroEv.css">
        <!-- Fontes -->
        <link rel="stylesheet" type="text/css" href="./CSS/Fontes.css">
        <link rel="icon" href="./Imagens/IconeWissen.png" type="image/x-icon" sizes="16x16"/>

        <link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Wissen</title>
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

        <div id="cadastroEv" class="container">
            <h1 class="text-center righteous-font">Cadastrar Evento</h1>
            <h6 class="text-center righteous-font">${ErroCadastro}</h6>
            <form action="EventoServlet"method="POST" data-toggle="validator" role="form" enctype="multipart/form-data" id="cpf_form">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <fieldset>

                        <legend class="righteous-font">Evento</legend>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label for="icon_titulo"><i class="material-icons prefix">event</i> Título do Evento</label>
                            <input id="icon_titulo" type="text" name="titulo" data-error="Preencha este campo!" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_responsavel"><i class="material-icons prefix">person</i> Responsável</label>
                            <input id="icon_responsavel" type="text" name="responsavel" data-error="Preencha este campo!" required placeholder="Nome da empresa/usuário">
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_cpf"><i class="material-icons prefix">description</i> CPF</label>
                            <input id="icon_cpf" type="text" name="cpf" data-minlength="11" data-error="Mínimo de 14 dígitos" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>

                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label for="icon_desc"><i class="material-icons prefix">description</i> Descrição</label>
                            <textarea id="icon_desc" class="desc" type="text" name="desc" maxlength="700" data-error="Preencha este campo!" required placeholder="Ex: Prezados, nosso evento tem a finalidade de oferecer uma oportunidade de reencontro, discussões, troca de experiências, etc."></textarea>
                            <div class="help-block with-errors text-center"></div>
                        </div>
                    </fieldset>

                    <fieldset>
                        <legend class="righteous-font">Privacidade</legend>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label><i class="material-icons prefix">visibility</i> Tornar evento Privado?</label>
                            <div class="cogPriv">
                                <input type="checkbox" name="priv" id="in_priv">
                                <label for="in_priv"> </label>
                            </div>
                        </div>
                    </fieldset>
                </div>




                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">



                    <fieldset>
                        <legend class="righteous-font">Informações</legend>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label for="icon_categoria"><i class="material-icons prefix">dashboard</i> Categorias</label>
                            <select id="icon_categoria" class="form-control categoria" name="categoria" data-error="Escolha uma categoria" required>
                                <option value="Selecione" class="opSel">Selecione</option>

                                <option value="0">Ao Ar Livre</option>
                                <option value="1">Cinema</option>
                                <option value="2">Bar</option>
                                <option value="3">Casamento</option>
                                <option value="4">Corporativo</option>
                                <option value="5">Crianças</option>
                                <option value="6">Eventos Culturais</option>
                                <option value="7">Exposição</option>
                                <option value="8">Feiras</option>
                                <option value="9">Festas</option>
                                <option value="10">Festival</option>
                                <option value="11">Formatura</option>
                                <option value="12">Gastronomia</option>
                                <option value="13">Literatura</option>
                                <option value="14">Restaurante</option>
                                <option value="15">Social</option>
                                <option value="16">Urbano</option>
                                <option value="17">Outros</option>




                            </select>
                            <div class="help-block with-errorrs text-center"></div>
                        </div>

                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <select id="icon_categoria" class="form-control categoria" name="categoria1" data-error="Escolha uma categoria" required>
                                <option value="Selecione" class="opSel">Selecione</option>

                                <option value="0">Ao Ar Livre</option>
                                <option value="1">Cinema</option>
                                <option value="2">Bar</option>
                                <option value="3">Casamento</option>
                                <option value="4">Corporativo</option>
                                <option value="5">Crianças</option>
                                <option value="6">Eventos Culturais</option>
                                <option value="7">Exposição</option>
                                <option value="8">Feiras</option>
                                <option value="9">Festas</option>
                                <option value="10">Festival</option>
                                <option value="11">Formatura</option>
                                <option value="12">Gastronomia</option>
                                <option value="13">Literatura</option>
                                <option value="14">Restaurante</option>
                                <option value="15">Social</option>
                                <option value="16">Urbano</option>
                                <option value="17">Outros</option>
                            </select>
                            <div class="help-block with-errorrs text-center"></div>
                        </div>

                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <select id="icon_categoria" class="form-control categoria" name="categoria2" data-error="Escolha uma categoria" required>

                                <option value="Selecione" class="opSel">Selecione</option>
                                <option value="0">Ao Ar Livre</option>
                                <option value="1">Cinema</option>
                                <option value="2">Bar</option>
                                <option value="3">Casamento</option>
                                <option value="4">Corporativo</option>
                                <option value="5">Crianças</option>
                                <option value="6">Eventos Culturais</option>
                                <option value="7">Exposição</option>
                                <option value="8">Feiras</option>
                                <option value="9">Festas</option>
                                <option value="10">Festival</option>
                                <option value="11">Formatura</option>
                                <option value="12">Gastronomia</option>
                                <option value="13">Literatura</option>
                                <option value="14">Restaurante</option>
                                <option value="15">Social</option>
                                <option value="16">Urbano</option>
                                <option value="17">Outros</option>
                            </select>
                            <div class="help-block with-errorrs text-center"></div>
                        </div>

                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_inicio"><i class="material-icons prefix">date_range</i> Início</label>
                            <input id="icon_inicio" type="text" name="data_inicio" data-error="Preencha este campo!" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_termino"><i class="material-icons prefix">date_range</i> Término</label>
                            <input id="icon_termino" type="text" name="data_termino" data-error="Preencha este campo!" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_hora_inicio"><i class="material-icons prefix">access_time</i> Início</label>
                            <input id="icon_hora_inicio" type="text" name="hora_inicio" data-error="Preencha este campo!" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_hora_termino"><i class="material-icons prefix">access_time</i> Término</label>
                            <input id="icon_hora_termino" type="text" name="hora_termino" data-error="Preencha este campo!" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_contato"><i class="material-icons prefix">phone</i> Contato</label>
                            <input id="icon_contato" type="text" name="contato">
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_zap"><i class="fa fa-whatsapp" style="font-size: 28px; padding-bottom: 9px; font-weight: bold;"></i> <span style="position: relative; top: 5px; left: 2px;">Celular</span></label>
                            <input id="icon_zap" type="text" name="cel" data-error="Preencha este campo!" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_cep"><i class="material-icons prefix">map</i> CEP</label>
                            <input id="icon_cep" type="text" name="cep" data-error="Preencha este campo!" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_uf"><i class="material-icons prefix">map</i> Estado</label>
                            <input id="icon_uf" type="text" name="estado" data-error="Preencha este campo!" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>                       
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_cidade"><i class="material-icons prefix">location_city</i> Cidade</label>
                            <input id="icon_cidade" type="text" name="cidade" data-error="Preencha este campo!" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>                        
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="icon_bairro"><i class="material-icons prefix">map</i> Bairro</label>
                            <input id="icon_bairro" type="text" name="bairro" data-error="Preencha este campo!" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label for="icon_local"><i class="material-icons prefix">map</i> Local</label>
                            <input id="icon_local" type="text" name="local" data-error="Preencha este campo!" required placeholder="Ex: Estrada Mix">
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label for="icon_endereco"><i class="material-icons prefix">map</i> Endereço</label>
                            <input id="icon_endereco" type="text" name="endereco" data-error="Preencha este campo!" required>
                            <div class="help-block with-errors text-center"></div>
                        </div>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label for="icon_prec"><i class="material-icons prefix">attach_money</i> Preço</label>
                            <input id="icon_prec" type="text" name="preco" placeholder="Digite apenas números!">
                        </div>
                        <input id="icon_lat" type="hidden" name="Latitude">
                        <input id="icon_long" type="hidden" name="Longitude">




                    </fieldset>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">


                    <fieldset>
                        <legend class="righteous-font">Imagens de Divulgação</legend>
                        <div class="form-group col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="input-file-container">  
                                <input class="input-file" id="my-file" type="file" name="fotoCapa">
                                <label tabindex="0" for="my-file" class="input-file-trigger"><i class="material-icons prefix">add_a_photo</i></label>
                                <p class="aviso">Dê preferência a uma imagem 1500x600</p>
                            </div>
                            <p class="file-return"></p>
                        </div>
                        <script type="text/javascript">
                            document.querySelector("html").classList.add('js');
                            var fileInput = document.querySelector(".input-file"),
                                    button = document.querySelector(".input-file-trigger"),
                                    the_return = document.querySelector(".file-return");
                            button.addEventListener("keydown", function (event) {
                                if (event.keyCode == 13 || event.keyCode == 32) {
                                    fileInput.focus();
                                }
                            });
                            button.addEventListener("click", function (event) {
                                fileInput.focus();
                                return false;
                            });
                            fileInput.addEventListener("change", function (event) {
                                the_return.innerHTML = this.value;
                            });
                        </script>
                        <div class="form-group col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="input-file-container-2">  
                                <input class="input-file-2" id="my-file-2" type="file" name="foto2">
                                <label tabindex="0" for="my-file-2" class="input-file-trigger-2"><i class="material-icons prefix">add_a_photo</i></label>
                            </div>
                            <p class="file-return-2"></p>
                        </div>
                        <script type="text/javascript">
                            document.querySelector("html").classList.add('js-2');
                            var fileInput_2 = document.querySelector(".input-file-2"),
                                    button_2 = document.querySelector(".input-file-trigger-2"),
                                    the_return_2 = document.querySelector(".file-return-2");
                            button_2.addEventListener("keydown", function (event_2) {
                                if (event_2.keyCode == 13 || event_2.keyCode == 32) {
                                    fileInput_2.focus();
                                }
                            });
                            button_2.addEventListener("click", function (event_2) {
                                fileInput_2.focus();
                                return false;
                            });
                            fileInput_2.addEventListener("change", function (event_2) {
                                the_return_2.innerHTML = this.value;
                            });
                        </script>
                        <div class="form-group col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="input-file-container-3">  
                                <input class="input-file-3" id="my-file-3" type="file" name="foto3">
                                <label tabindex="0" for="my-file-3" class="input-file-trigger-3"><i class="material-icons prefix">add_a_photo</i></label>
                            </div>
                            <p class="file-return-3"></p>
                        </div>
                        <script type="text/javascript">
                            document.querySelector("html").classList.add('js-3');
                            var fileInput_3 = document.querySelector(".input-file-3"),
                                    button_3 = document.querySelector(".input-file-trigger-3"),
                                    the_return_3 = document.querySelector(".file-return-3");
                            button_3.addEventListener("keydown", function (event_3) {
                                if (event_3.keyCode == 13 || event_3.keyCode == 32) {
                                    fileInput_3.focus();
                                }
                            });
                            button_3.addEventListener("click", function (event_3) {
                                fileInput_3.focus();
                                return false;
                            });
                            fileInput_3.addEventListener("change", function (event_3) {
                                the_return_3.innerHTML = this.value;
                            });
                        </script>
                    </fieldset>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                    <button type="submit" name="Action" value="Cadastrar" class="btn btn-lg waves-effect waves-light btn-cadastrar righteous-font"><i class="material-icons prefix">send</i> Cadastrar</button>
                </div>
            </form>
        </div>
        <div class="modal fade" id="cepNE" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-left">
                        <h4 class="righteous-font">Lembrete</h4>
                    </div>
                    <div class="modal-body" style="padding: 40px 50px;">
                        <div class="row">
                            <p>CEP não encontrado</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn deep-purple darken-1 waves-effect waves-light pull-left" data-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="cepNAE" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-left">
                        <h4 class="righteous-font">Lembrete</h4>
                    </div>
                    <div class="modal-body" style="padding: 40px 50px;">
                        <div class="row">
                            <p>Formato de CEP inválido</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn deep-purple darken-1 waves-effect waves-light pull-left" data-dismiss="modal"> OK</button>
                    </div>
                </div>
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
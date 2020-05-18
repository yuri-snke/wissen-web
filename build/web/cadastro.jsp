<%-- 
    Document   : cadastro
    Created on : 20/10/2017, 16:17:14
    Author     : CT Tarde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       
        
        <title>Wissen</title>
        <!-- JavaScript -->
        <script type="text/javascript" src="./JS/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./MDB_3.4.1/MDB Free/js/mdb.min.js"></script>
        <script type="text/javascript" src="./Holder/holder.min.js"></script>
        <script type="text/javascript" src="./JS/validator.min.js"></script>
        <script type="text/javascript" src="./JS/viacep_cadastro.js"></script>
        <script type="text/javascript" src="./JS/masks.js"></script>
        <script type="text/javascript" src="./JS/jquery.mask.min.js"></script>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="./MDB_3.4.1/MDB Free/css/mdb.min.css">
        <link href="CSS/cadastro.css" rel="stylesheet" type="text/css"/>
        <!-- Fontes -->
        <link rel="stylesheet" type="text/css" href="./CSS/Fontes.css">
        <link rel="icon" href="./Imagens/IconeWissen.png" type="image/x-icon" sizes="16x16"/>
        <style>

        </style>
    </head>
    <body id="wissen">
        <div id="conteudo" class="container">
            <div id="form-header" class="text-center">
                <h3 class="righteous-font">Complete Seu Perfil</h3>
            </div>
            <div class="text-center" id="form-body">
                <form method="post" data-toggle="validator" role="form" action="UsuarioServlet" enctype="multipart/form-data">
                    <div class="col-lg-5 col-sm-5 col-md-5 col-xs-12" id="dados-p">
                        <div class="form-group col-xs-12">
                            <label for="icon_name"><i class="material-icons prefix">person</i> Nome</label>
                            <input id="icon_name" type="text" name="nome" data-error="Preencha este Campo!" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-xs-12">
                            <label for="icon_sobrenome"><i class="material-icons prefix">person</i> Sobrenome</label>
                            <input id="icon_sobrenome" type="text" name="sobrenome" data-error="Preencha este Campo!" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-xs-12">
                            <label for="icon_date"><i class="material-icons prefix">person</i> Idade</label>
                            <input id="icon_date" type="text" name="idade" maxlength="3" data-error="Preencha este Campo!" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-xs-12 c-sexo">
                            <label class="l-sexo"><i class="material-icons prefix">face</i> Sexo</label>
                            <div class="sexo">
                                <input type="radio" value="masculino" name="sexo" id="masc" required>
                                <label for="masc"> Masculino</label>
                                <input type="radio" value="feminino" name="sexo" id="femi" required>
                                <label for="femi"> Feminino</label>
                            </div>
                        </div>
                        <div class="form-group col-xs-12 secret">
                            <label for="icon_secret"><i class="material-icons prefix">lock</i> Palavra Secreta</label>
                            <input id="icon_secret" type="text" name="secret" data-error="Isso é importante" required>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12" id="dados-i">
                        <div class="form-group col-xs-12">
                            <label for="icon_phone"><i class="material-icons prefix">smartphone</i> Celular</label>
                            <input id="icon_phone" type="text" name="celular" data-minlength="9" data-error="Isso é importante" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-xs-12">
                            <label for="icon_cep"><i class="material-icons prefix">map</i> CEP</label>
                            <input id="icon_cep" type="text" name="cep" data-minlength="8" data-error="Isso é importante" required placeholder="Digite apenas números" onkeypress="mascara(this, mcep)" maxlength="9">
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-xs-12">
                            <label for="icon_uf"><i class="material-icons prefix">map</i> Estado</label>
                            <input type="text" id="icon_uf" name="uf">
                        </div>
                        <div class="form-group col-xs-12">
                            <label for="icon_cidade"><i class="material-icons prefix">location_city</i> Cidade</label>
                            <input type="text" id="icon_cidade" name="cidade">
                        </div>
                        <div class="form-group col-xs-12">
                            <label for="icon_end"><i class="material-icons prefix">location_city</i> Endereço</label>
                            <input type="text" id="icon_end" name="endereco">
                        </div>
                    </div>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label class="add-photo text-center">Adicionar Foto</label>
                        <div class="form-group">
                            <div class="input-file-container">  
                                <input class="input-file" id="my-file" type="file" name="foto">
                                <label tabindex="0" for="my-file" class="input-file-trigger"><i class="material-icons prefix">add_a_photo</i></label>
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
                    </div>
                    <div class="text-center col-lg-10 col-md-10 col-sm-10 col-xs-12">
                        <h6 class="righteous-font">${ErroImagem}</h6>
                        <h6 class="righteous-font">${ErroCadastro}</h6>
                        <div class="text-center">
                            <button type="submit "id="botao" name="Action" value="Cadastrar" class="btn btn-lg waves-effect waves-light righteous-font">Cadastrar</button>
                        </div>
                    </div>
                </form>
            </div>
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
    </body>
</html>



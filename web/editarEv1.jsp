<%-- 
    Document   : editarEv1
    Created on : 24/10/2017, 14:54:34
    Author     : CT Tarde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        

        <!-- Meta TAGS -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- JavaScript -->
        <script type="text/javascript" src="./JS/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./MDB_3.4.1/MDB Free/js/mdb.min.js"></script>
        <script type="text/javascript" src="./Holder/holder.min.js"></script>
        <script type="text/javascript" src="./JS/validator.min.js"></script>
        <script type="text/javascript" src="./JS/masks.js"></script>
        <script src="JS/jquery.mask.min.js" type="text/javascript"></script>
        <script src="JS/viacep_cadastroev.js" type="text/javascript"></script>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="MDB_3.4.1/MDB Free/css/mdb.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/menu2.css">
        <link rel="stylesheet" type="text/css" href="./CSS/footer.css">
        <link href="CSS/cadastroEv.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="./Imagens/IconeWissen.png" type="image/x-icon" sizes="16x16"/>
        <!-- Fontes -->
        <link rel="stylesheet" type="text/css" href="./CSS/Fontes.css">
        <link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Wissen</title>
    </head>


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
    <%
        DTO.Evento ev = (DTO.Evento) request.getAttribute("teste");
    %>


    <div id="cadastroEv" class="container">
        <h1 class="text-center righteous-font">Atualizar Evento</h1>
        <h6 class="text-center righteous-font">${ErroAtualizacao}</h6>
        <form action="EventoServlet"method="POST" data-toggle="validator" role="form" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%=ev.getId()%>" />
            <input type="hidden" name="NomeImagemCapa" value="<%=ev.getImagemCapa()%>" />
            <input type="hidden" name="NomeImagens" value="<%=ev.getImagens()%>" />
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <fieldset>

                    <legend class="righteous-font">Evento</legend>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="icon_titulo"><i class="material-icons prefix">event</i> Título do Evento</label>
                        <input id="icon_titulo" type="text" name="titulo" value="<%=ev.getNome()%>" data-error="Preencha este campo!" required>
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="icon_responsavel"><i class="material-icons prefix">person</i> Responsável</label>
                        <input id="icon_responsavel" type="text" name="responsavel" value="<%=ev.getResponsavel()%>" data-error="Preencha este campo!" required placeholder="Ex: Nome da Empresa ou usuário">
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="icon_desc"><i class="material-icons prefix">description</i> Descrição</label>
                        <textarea id="icon_desc" class="desc" type="text" name="desc" maxlength="700" data-error="Preencha este campo!" required placeholder="Ex: Prezados, nosso evento tem a finalidade de oferecer uma oportunidade de reencontro, discussões, troca de experiências, etc."><%=ev.getDescricao()%></textarea>
                        <div class="help-block with-errors text-center"></div>
                    </div>
                </fieldset>

                <fieldset>
                    <legend class="righteous-font">Privacidade</legend>

                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label><i class="material-icons prefix">visibility</i> Tornar evento Privado?</label>
                        <div class="cogPriv">
                            <%if (ev.getPrivado() == 1) {%>
                            <input type="checkbox" name="priv" id="in_priv" checked>
                            <%} else {
                            %>
                            <input type="checkbox" name="priv" id="in_priv">
                            <%}%>
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
                            <%String[] categorias = {"Ao Ar Livre", "Cinema", "Bar", "Casamento", "Corporativo",
                                    "Criancas", "Eventos Culturais", "Exposicao", "Feiras", "Festas", "Festival",
                                    "Formatura", "Gastronomia", "Literatura", "Restaurante", "Social", "Urbano", "Outros"};
                                int w = 0;
                                String Tipo[] = ev.getTipo().split(";");
                                for (String categoria : categorias) {
                                    if (Tipo.length > 0) {
                                        if (categoria.equalsIgnoreCase(Tipo[0])) {
                            %>
                            <option value="<%=w++%>" selected="true"><%=categoria%></option>
                            <%
                                    }
                                }
                            %>
                            <option value="<%=w++%>"><%=categoria%></option>
                            <%
                                }
                            %>




                        </select>
                        <div class="help-block with-errorrs text-center"></div>
                    </div>

                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <select id="icon_categoria" class="form-control categoria" name="categoria1" data-error="Escolha uma categoria" required>
                            <option value="Selecione" class="opSel">Selecione</option>

                            <%
                                w = 0;
                                for (String categoria : categorias) {
                                    if (Tipo.length > 1) {
                                        if (categoria.equalsIgnoreCase(Tipo[1])) {
                            %>
                            <option value="<%=w++%>" selected="true"><%=categoria%></option>
                            <%
                                    }
                                }
                            %>
                            <option value="<%=w++%>"><%=categoria%></option>
                            <%
                                }
                            %>
                        </select>
                        <div class="help-block with-errorrs text-center"></div>
                    </div>

                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <select id="icon_categoria" class="form-control categoria" name="categoria2" data-error="Escolha uma categoria" required>

                            <option value="Selecione" class="opSel">Selecione</option>
                            <%
                                w = 0;
                                for (String categoria : categorias) {
                                    if (Tipo.length > 2) {
                                        if (categoria.equalsIgnoreCase(Tipo[2])) {
                            %>
                            <option value="<%=w++%>" selected="true"><%=categoria%></option>
                            <%
                                    }
                                }
                            %>
                            <option value="<%=w++%>"><%=categoria%></option>
                            <%
                                }
                            %>
                        </select>
                        <div class="help-block with-errorrs text-center"></div>
                    </div>

                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label for="icon_inicio"><i class="material-icons prefix">date_range</i> Início</label>
                        <input id="icon_inicio" type="text" name="data_inicio" value="<%=ev.getDataIni()%>"data-error="Preencha este campo!" required>
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label for="icon_termino"><i class="material-icons prefix">date_range</i> Término</label>
                        <input id="icon_termino" type="text" name="data_termino" value="<%=ev.getDataTer()%>"data-error="Preencha este campo!" required>
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label for="icon_hora_inicio"><i class="material-icons prefix">access_time</i> Início</label>
                        <input id="icon_hora_inicio" type="text" name="hora_inicio" value="<%=ev.getHoraIni()%>" data-error="Preencha este campo!" required>
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label for="icon_hora_termino"><i class="material-icons prefix">access_time</i> Término</label>
                        <input id="icon_hora_termino" type="text" name="hora_termino" value="<%=ev.getHoraTer()%>" data-error="Preencha este campo!" required>
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label for="icon_contato"><i class="material-icons prefix">phone</i> Contato</label>
                        <input id="icon_contato" type="text" name="contato" data-error="Preencha este campo!" value="<%=ev.getTelFixo()%>" required placeholder="(DDD) XXXXX-XXXX" onkeypress="mascara(this, telefone)" maxlength="15">
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label for="icon_zap"><i class="fa fa-whatsapp" style="font-size: 28px; padding-bottom: 9px; font-weight: bold;"></i> <span style="position: relative; top: 5px; left: 2px;">Celular</span></label>
                        <input id="icon_zap" type="text" name="cel" data-error="Preencha este campo!" value="<%=ev.getTelMovel()%>" required placeholder="(DDD) XXXXX-XXXX" onkeypress='mascara(this, telefone)' maxlength="15">
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label for="icon_cep"><i class="material-icons prefix">map</i> CEP</label>
                        <input id="icon_cep" type="text" name="cep" data-error="Preencha este campo!" value="<%=ev.getCEP()%>" required placeholder="Digite apenas números!" onkeypress='mascara(this, mcep)' maxlength="9">
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label for="icon_uf"><i class="material-icons prefix">map</i> Estado</label>
                        <input id="icon_uf" type="text" name="estado" data-error="Preencha este campo!" value="<%=ev.getEstado()%>"required>
                        <div class="help-block with-errors text-center"></div>
                    </div>                       
                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label for="icon_cidade"><i class="material-icons prefix">map</i> Cidade</label>
                        <input id="icon_cidade" type="text" name="cidade" data-error="Preencha este campo!" value="<%=ev.getCidade()%>"required>
                        <div class="help-block with-errors text-center"></div>
                    </div>                        
                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label for="icon_bairro"><i class="material-icons prefix">map</i> Bairro</label>
                        <input id="icon_bairro" type="text" name="bairro" data-error="Preencha este campo!" value="<%=ev.getBairro()%>"required>
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="icon_local"><i class="material-icons prefix">map</i> Local</label>
                        <input id="icon_local" type="text" name="local" data-error="Preencha este campo!" value="<%=ev.getLocal()%>"required placeholder="Ex: Estrada Mix">
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="icon_endereco"><i class="material-icons prefix">map</i> Endereço</label>
                        <input id="icon_endereco" type="text" name="endereco" data-error="Preencha este campo!" value="<%=ev.getEndereco()%>"required>
                        <div class="help-block with-errors text-center"></div>
                    </div>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="icon_prec"><i class="material-icons prefix">attach_money</i> Preço</label>
                        <input id="icon_prec" type="text" name="preco" placeholder="Digite apenas números!" value="<%=ev.getPreco()%>" onkeypress="mascara(this, mvalor)">
                    </div>
                </fieldset>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">


                <fieldset>
                    <legend class="righteous-font">Imagens de Divulgação</legend>

                    <div class="form-group col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="input-file-container">  
                            <input class="input-file" id="my-file" type="file" name="fotoCapa" required>
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
                    <div class="form-group col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="input-file-container-2">  
                            <input class="input-file-2" id="my-file-2" type="file" name="2foto" required>
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
                            <input class="input-file-3" id="my-file-3" type="file" name="3foto" required>
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
                <button type="submit" name="Action" value="Atualizar" class="btn btn-lg waves-effect waves-light btn-cadastrar righteous-font"><i class="material-icons prefix">send</i> Atualizar</button>
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

</html>

<%@page import="DAO.DAOUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Evento"%>
<%@page import="DAO.DAOEvento"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="DPO.IPRequest"%>
<%@page import="DTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta TAGS -->
        <!--<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">-->

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta Http-Equiv="Cache-Control" Content="no-cache">  
        <meta Http-Equiv="Pragma" Content="no-cache">  
        <meta Http-Equiv="Expires" Content="0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- JavaScript -->
        <script type="text/javascript" src="./JS/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./MDB_3.4.1/MDB Free/js/mdb.min.js"></script>
        <script type="text/javascript" src="./Holder/holder.min.js"></script>
        <script src="JS/perfil2.js" type="text/javascript"></script>
        <script type="text/javascript" src="./JS/jquery.mask.min.js"></script>
        <script type="text/javascript" src="./JS/masks.js"></script>
        <script src="JS/viacep_perfil1.js" type="text/javascript"></script>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="MDB_3.4.1/MDB Free/css/mdb.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/menu2.css">
        <link rel="stylesheet" type="text/css" href="./CSS/footer.css">
        <link rel="stylesheet" type="text/css" href="./CSS/perfil2.css">
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

        <div id="dados" class="container">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <%String ImagemPerfil = DTO.Usuario.getFoto();
                    if (ImagemPerfil.equalsIgnoreCase("SemImagemPerfil")) {
                %>    
                <img src="" data-src="holder.js/200x200" class="img-thumbnail photo-perfil">
                <% } else {
                %>

                <img src="<%=IPRequest.getImgPerfil() + ImagemPerfil%>" data-src="holder.js/200x200" class="img-thumbnail">
                <%
                    }
                %>

                <h4><%=DTO.Usuario.getNome()%></h4>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-left links">
                <ul class="opcoes">
                    <li><a onclick="foto()" class="link" id="l-foto"><span class="glyphicon glyphicon-camera"></span> Alterar Foto</a></li>
                    <li><a onclick="info()" class="link" id="l-info"><span class="glyphicon glyphicon-user"></span> Informações</a></li>
                    <li><a onclick="cog()" class="link" id="l-cog"><span class="glyphicon glyphicon-cog"></span> Configurações de Segurança</a></li>
                </ul>
            </div>
        </div>

        <div class="container">
            ${AtualizadoCS}
            ${AtualizadoSS}
            <hr>
        </div>
        <div id="conteudo" class="container">
            <div class="row evseguidos">
                <h3 class="righteous-font">Eventos Seguidos</h3>
                <div class="carousel slide" id="carousel-evseguidos" data-ride="carousel" data-type="multi" data-interval="false">
                    <div class="carousel-inner">

                        <%
                            boolean first = true;
                            LinkedHashMap params = new LinkedHashMap<>();
                            DPO.EventoRequest lembrete = new DPO.EventoRequest();
                            params.put("sql", lembrete.getSqlListEvSeguidos());
                            DAOEvento dao = new DAOEvento();
                            ArrayList<Evento> ev = dao.ResponseRequest(DPO.EventoRequest.getListaEventos(), params);
                            for (Evento evento : ev) {
                                if (first) {
                        %>
                        <div class="item active">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="card hoverable">
                                    <div class="card-image">
                                        <div class="view overlay hm-white-slight z-depth-1">
                                            <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250">
                                            <a href="evento.jsp?evento=<%=evento.getId()%>">
                                                <div class="mask waves-effect"></div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <%if (evento.getNome().trim().length() > 31) {
                                        %>
                                        <h5><%=evento.getNome().trim().substring(0, 31) + "..."%></h5>
                                        <%} else {%>
                                        <h5><%=evento.getNome().trim()%></h5>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%first = false;
                        } else {
                        %>

                        <div class="item">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="card hoverable">
                                    <div class="card-image">
                                        <div class="view overlay hm-white-slight z-depth-1">
                                            <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250">  
                                            <a href="evento.jsp?evento=<%=evento.getId()%>">
                                                <div class="mask waves-effect"></div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <%if (evento.getNome().trim().length() > 31) {
                                        %>
                                        <h5><%=evento.getNome().trim().substring(0, 31) + "..."%></h5>
                                        <%} else {%>
                                        <h5><%=evento.getNome().trim()%></h5>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                                }
                            }
                        %>

                    </div>
                    <%if (ev.size() > 3) {%>
                    <div class="left carousel-control">
                        <a href="#carousel-evseguidos" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </div>
                    <div class="right carousel-control">
                        <a href="#carousel-evseguidos" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <%}%>
                </div>
            </div>
            <div class="row outro">
                <h3 class="righteous-font">Meus Eventos</h3>
                <div class="carousel slide" id="carousel-outro" data-ride="carousel" data-type="multi" data-interval="false">
                    <div class="carousel-inner">
                        <%
                            first = true;
                            params = new LinkedHashMap<>();
                            lembrete = new DPO.EventoRequest();
                            params.put("sql", lembrete.getSqlListMeuEventos());
                            dao = new DAOEvento();
                            ev = dao.ResponseRequest(DPO.EventoRequest.getListaEventos(), params);
                            for (Evento evento : ev) {
                                if (first) {
                        %>
                        <div class="item active">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="card hoverable">
                                    <div class="card-image">
                                        <div class="view overlay hm-white-slight z-depth-1">
                                            <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250">
                                            <a href="evento.jsp?evento=<%=evento.getId()%>">
                                                <div class="mask waves-effect"></div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <%if (evento.getNome().trim().length() > 31) {
                                        %>
                                        <h5><%=evento.getNome().trim().substring(0, 31) + "..."%></h5>
                                        <%} else {%>
                                        <h5><%=evento.getNome().trim()%></h5>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                            first = false;
                        } else {
                        %>
                        <div class="item">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="card hoverable">
                                    <div class="card-image">
                                        <div class="view overlay hm-white-slight z-depth-1">
                                            <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250">
                                            <a href="evento.jsp?evento=<%=evento.getId()%>">
                                                <div class="mask waves-effect"></div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <%if (evento.getNome().trim().length() > 31) {
                                        %>
                                        <h5><%=evento.getNome().trim().substring(0, 31) + "..."%></h5>
                                        <%} else {%>
                                        <h5><%=evento.getNome().trim()%></h5>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>

                    </div>
                    <%if (ev.size() > 3) {%>
                    <div class="left carousel-control">
                        <a href="#carousel-outro" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </div>
                    <div class="right carousel-control">
                        <a href="#carousel-outro" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="container">
                <div class="row mseguidores amigos">
                    <h3 class="righteous-font">Meus Seguidores</h3>
                    <ul>   <%
                        params = new LinkedHashMap<>();
                        DPO.UsuarioRequest usua = new DPO.UsuarioRequest();
                        params.put("sql", usua.getSqlListSeguidores());

                        DAOUsuario daousuario = new DAOUsuario();
                        ArrayList<DTO.FollowUser> seguidores = daousuario.Seguidores(DPO.UsuarioRequest.getListSeguidores(), params);
                        int j = 0;
                        %>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">        
                            <%
                                for (DTO.FollowUser usuario : seguidores) {
                                    if (j > 5) {
                            %>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                <%
                                        j = 0;
                                    }
                                %>

                                <li>
                                    <a href="followPerfil.jsp?usuario=<%=usuario.getId_User()%>"">
                                        <img src="<%=IPRequest.getImgPerfil() + usuario.getFoto()%>" data-src="holder.js/200x200" class="img-responsive">
                                        <p><%=usuario.getNome()%></p>
                                    </a>
                                </li>
                                <%}%>
                            </div>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container" id="alterarFoto" style="display: none;">
            <div class="text-center">

                <h3 class="righteous-font"><span class="glyphicon glyphicon-camera"></span> Alterar Foto</h3>

                <form action="UsuarioServlet" method="post" id="formFoto" enctype="multipart/form-data">
                    <img src="Imagens/profile_image.png" data-src="holder.js/200x200" class="img-thumbnail imagem">
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
                    <button type="submit" class="btn btn-lg waves-effect waves-light righteous-font" name="Action" value="Subir" ><i class="material-icons prefix">file_upload</i> Subir</button>
                    <div class="text-right">
                        <button type="button" class="btn btn-lg btn-warning waves-effect waves-light righteous-font" onclick="resetFoto()"><i class="material-icons prefix">reply</i> Voltar</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="container" id="informacoes" style="display: none;">
            <div class="text-center">
                <h3 class="righteous-font"><span class="glyphicon glyphicon-user"></span> Informações</h3>
                <form action="UsuarioServlet" method="POST" data-toggle="validator" role="form" id="formInfo">
                    <div class="edicao">
                        <input type="hidden" name="id">
                        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <label for="in_nome"><i class="material-icons prefix">person</i> Nome</label>    
                            <%String[] nome = Usuario.getNome().trim().split(" ");%>
                            <input type="text" name="nome" id="in_nome" value="<%=nome[0]%>">

                        </div>
                        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <label for="in_sobrenome"><i class="material-icons prefix">person</i> Sobrenome</label>
                            <%
                                String sobrenome = "";
                                int w = 1;
                                while (w < nome.length) {
                                    sobrenome += " " + nome[w];
                                    w++;
                                }
                            %>
                            <input type="text" name="sobrenome" id="in_sobrenome" value="<%=sobrenome.trim()%>">
                        </div>
                        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <label for="in_idade"><i class="material-icons prefix">date_range</i> Idade</label>
                            <input type="text" name="idade" id="in_idade" value="<%=Usuario.getIdade()%>">
                        </div>
                        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <label for="in_celular"><i class="material-icons prefix">smartphone</i> Celular</label>
                            <input type="text" name="celular" id="in_celular" value="<%=Usuario.getCelular()%>">
                        </div>
                        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <label for="in_cep"><i class="material-icons prefix">map</i> CEP</label>
                            <input type="text" name="cep" id="in_cep" value="<%=Usuario.getCep()%>">
                        </div>
                        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <label for="in_uf"><i class="material-icons prefix">map</i> Estado</label>
                            <input type="text" name="estado" id="in_uf" value="<%=Usuario.getEstado()%>">
                        </div>
                        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <label for="in_cidade"><i class="material-icons prefix">map</i> Cidade</label>
                            <input type="text" name="cidade" id="in_cidade" value="<%=Usuario.getCidade()%>">
                        </div>
                        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <label for="in_endereco"><i class="material-icons prefix">map</i> Endereço</label>
                            <input type="text" name="endereco" id="in_endereco" value="<%=Usuario.getEndereco()%>">
                        </div>
                        <div class="text-center col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <button type="submit" class="btn btn-lg waves-effect waves-light righteous-font" name="Action" value="Atualizar">Salvar</button>
                        </div>
                        <div class="text-left col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            <button type="button" class="btn btn-lg btn-warning waves-effect waves-light righteous-font" onclick="resetInfo()"><i class="material-icons prefix">reply</i> Voltar</button>
                        </div>

                    </div>

                </form>

            </div>
        </div>


        <div class="container" id="configSeguranca" style="display: none;">
            <div class="text-center">
                <h3 class="righteous-font"><span class="glyphicon glyphicon-cog"></span> Configurações de Segurança</h3>
                <nav class="cogNavigation text-left">
                    <ul class="menu">
                        <li><a onclick="priv()" class="l-priv"><i class="material-icons prefix">lock_open</i> Privacidade</a></li>
                        <li><a onclick="data()" class="l-data"><i class="material-icons prefix">perm_data_setting</i> Dados</a></li>
                    </ul>
                </nav>
                <form action="UsuarioServlet" method="POST" data-toggle="validator" role="form" id="privacidade" style="display: none;">
                    <label>Tornar conta Privada?</label>
                    <div class="priv">
                        <div class="cogPriv">
                            <input type="hidden" name="id">
                            <%if (DTO.Usuario.getPrivado() == 1) {%>
                            <input type="checkbox" name="priv" id="in_priv" checked>
                            <%} else {
                            %>
                            <input type="checkbox" name="priv" id="in_priv">
                            <%}%>
                            <label for="in_priv"> </label>
                        </div>
                        <div class="text-center col-lg-8 col-md-8 col-sm-8 col-xs-12 botao">
                            <button type="submit" class="btn btn-lg waves-effect waves-light righteous-font" name="Action" value="Privado">Salvar</button>
                        </div>
                        <div class="text-left col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            <button type="button" class="btn btn-lg btn-warning waves-effect waves-light righteous-font" onclick="resetCog()"><i class="material-icons prefix">reply</i> Voltar</button>
                        </div>
                    </div>
                </form>



                <form action="UsuarioServlet" method="POST" data-toggle="validator" role="form" id="formCog" style="display: none">
                    <div class="cog">
                        <input type="hidden" name="id">

                        <div class="form-group col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <label for="in_psecret"><i class="material-icons prefix">lock</i> Palavra Secreta</label>
                            <input type="password" name="palavraSecreta" id="in_psecret">
                            <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 checkPS text-left">
                                <input type="checkbox" name="exibir" id="exibirPS" onclick="mostrarPS()" />
                                <label for="exibirPS"> Exibir Palavra Secreta</label>
                            </div>
                        </div>

                        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <label for="in_email"><i class="material-icons prefix">email</i> Novo E-mail</label>
                            <input type="email" name="email" id="in_email">
                        </div>

                        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <label for="in_senha"><i class="material-icons prefix">lock</i> Nova Senha</label>
                            <input type="password" name="Senha" id="in_senha">
                            <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 checkS text-left">
                                <input type="checkbox" name="exibir" id="exibirS" onclick="mostrarS()" />
                                <label for="exibirS"> Exibir Senha</label>
                            </div>
                        </div>

                        <div class="form-group col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <label class="disable" for="in_csenha"><i class="material-icons prefix">lock</i> Confirmar nova Senha</label>
                            <input type="password" name="ConfSenha" id="in_csenha" class="disable">
                        </div>


                        <div class="text-center col-lg-8 col-md-8 col-sm-8 col-xs-12 botao">
                            <button type="submit" class="btn btn-lg waves-effect waves-light righteous-font" name="Action" value="Salvar">Salvar</button>
                        </div>
                        <div class="text-left col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            <button type="button" class="btn btn-lg btn-warning waves-effect waves-light righteous-font" onclick="resetCog()"><i class="material-icons prefix">reply</i> Voltar</button>
                        </div>
                    </div>
                </form>
                <div class="text-center">
                    <button type="button" class="btn btn-lg btn-warning waves-effect waves-light righteous-font cancelar" onclick="voltar()"><i class="material-icons prefix">reply</i> Voltar</button>
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

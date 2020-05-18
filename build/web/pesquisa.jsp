<%-- 
    Document   : pesquisa
    Created on : 09/10/2017, 16:22:50
    Author     : CT Tarde
--%>

<%@page import="DAO.DAOUsuario"%>
<%@page import="DPO.IPRequest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOEvento"%>
<%@page import="java.util.LinkedHashMap"%>
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
        <script type="text/javascript" src="./JS/pesquisa.js"></script>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="MDB_3.4.1/MDB Free/css/mdb.min.css">
        <link href="CSS/menu2.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="./CSS/footer.css">
        <link rel="stylesheet" type="text/css" href="./CSS/pesquisa1.css">
        <link rel="icon" href="./Imagens/IconeWissen.png" type="image/x-icon" sizes="16x16"/>
        <!-- Fontes -->
        <link rel="stylesheet" type="text/css" href="./CSS/Fontes.css">
        <link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
        <title>Wissen</title>
    </head>
    <body>
        <!-- Barra de pesquisa e menu do usuario -->
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

        <!-- pesquisa dos evetos, usuario -->

        <!-- SEARCHBAR -->


        <div id="conteudo" class="container text-center">
            <form role="search">
                <table class="searchbar">
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


        <!-- Abas -->


        <%
            String Pesquisa = request.getParameter("search");

            LinkedHashMap<String, Object> params = new LinkedHashMap<>();
            
            if (!"todos".equalsIgnoreCase(Pesquisa)) {
                params.put("sql", DPO.EventoRequest.getSqlPesquisa().replace("CHANGE", Pesquisa));
            } else {
                params.put("sql", DPO.EventoRequest.getSqlTodos());
            }
            DAOEvento dao = new DAOEvento();
            ArrayList<DTO.Evento> ev;
            ev = dao.ResponseRequest(DPO.EventoRequest.getListaEventos(), params);

            params = new LinkedHashMap<>();
            if (!"todos".equalsIgnoreCase(Pesquisa)) {
                params.put("sql", DPO.EventoRequest.getSqlPesquisaUser() + Pesquisa + "%' and Privado != 1");
            } else {
                params.put("sql", DPO.EventoRequest.getSqlTodoUser());

            }
            DAOUsuario daousuario = new DAOUsuario();
            ArrayList<DTO.FollowUser> seguidores = daousuario.Seguidores(DPO.UsuarioRequest.getListSeguidores(), params);

        %>
        <div class="container">
            <h3 class="righteous-font">Pesquisar...</h3>
            <div class="abas text-center">
                <ul>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        <li><a onclick="evento()" id="b-eve"><i class="material-icons prefix" id="iconeE">event</i> Eventos</a></li>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        <li><a onclick="people()" id="b-pes"><i class="material-icons prefix" id="iconeP">person</i> Pessoas</a></li>
                    </div>
                </ul>
            </div>
            <hr>
        </div>
        <!-- Resultado das pesquisas dos eventos -->

        <!-- EVENTOS -->
        <div class="container" id="eventos">
            <%                try {
                    if (ev.size() > 0) {
                        for (DTO.Evento evento : ev) {%>
            <div class="tijolo">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <a href="evento.jsp?evento=<%=evento.getId()%>"> <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250/auto" class="img-responsive"> </a>
                    <table class="statusEv">
                        <tr>
                            <td class="numeroEv">Status (Tempo Limite): <span class="badge success-color"> #</span></td>
                            <td class="dataEv">Data: <%=evento.getDataIni()%></td>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <h4><%=evento.getNome()%></h4>
                    <p>
                        <%if (evento.getDescricao().length() - 1 > 150) {%>
                        <%=evento.getDescricao().substring(0, 150).trim() + "..."%>
                        <%} else {
                        %>
                        <%=evento.getDescricao()%>
                        <%
                            }
                        %>
                    </p>
                    <a href="evento.jsp?evento=<%=evento.getId()%>" class="btn btn-lg text-center b-ver righteous-font" role="button">Ver Mais</a>
                </div>
            </div>


            <%}

                    }
                } catch (NullPointerException e) {
                    System.out.println("eventos null\n\n" + e);
                }
            %>
        </div>

        <!-- PESSOAS -->

        <div class="container" id="pessoas" style="display: none;">
            <%
                try {
                    if (seguidores.size() > 0) {
                        for (DTO.FollowUser usuario : seguidores) {%>

            <input type="hidden" value="Follow" name="Action">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 tijoloPessoas">
                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                    <a href="followPerfil.jsp?usuario=<%=usuario.getId_User()%>"> <img src="<%=IPRequest.getImgPerfil() + usuario.getFoto()%>" data-src="holder.js/200x200"> </a>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                    <%
                        String nome[] = usuario.getNome().split(" ");
                        if (nome.length > 3) {
                    %> 
                    <h4><%=nome[0] + " " + nome[1] + "..."%></h4>
                    <%
                    } else {%>
                    <h4><%=usuario.getNome()%></h4>
                    <%}%>
                    <span class="btn btn-lg b-add"><a href="followPerfil.jsp?usuario=<%=usuario.getId_User()%>"><i class="material-icons prefix">person_add</i></a></span><span class="add-amigo"> <a href="followPerfil.jsp?usuario=<%=usuario.getId_User()%>">Visitar Perfil</a></span>
                </div>
            </div>
            <%}
                    }
                } catch (NullPointerException e) {
                    System.out.println("seguidores null\n\n" + e);
                }
            %>
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
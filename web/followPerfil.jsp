<%-- 
    Document   : followPerfil
    Created on : 23/10/2017, 15:03:32
    Author     : CT Tarde
--%>

<%@page import="DTO.FollowUser"%>
<%@page import="DPO.UsuarioRequest"%>
<%@page import="DAO.DAOUsuario"%>
<%@page import="DTO.Evento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOEvento"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="DPO.IPRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta TAGS -->
        <!--<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">-->
              <!--Cache-->

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- JavaScript -->
        <script type="text/javascript" src="./JS/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./MDB_3.4.1/MDB Free/js/mdb.min.js"></script>
        <script type="text/javascript" src="./Holder/holder.min.js"></script>
        <script src="JS/homepage.js" type="text/javascript"></script>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="MDB_3.4.1/MDB Free/css/mdb.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/menu2.css">
        <link rel="stylesheet" type="text/css" href="./CSS/footer.css">
        <link href="CSS/followPerfil1.css" rel="stylesheet" type="text/css"/>
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

        <%
            LinkedHashMap<String, Object> params = new LinkedHashMap<>();
            params.put("sql", DPO.UsuarioRequest.getSqlPegaUm() + request.getParameter("usuario"));
            DAOUsuario daoUsuario = new DAOUsuario();
            ArrayList<FollowUser> us = daoUsuario.Seguidores(UsuarioRequest.getListSeguidores(), params);
            FollowUser usuario = us.get(0);
        %>
        <div id="dados" class="container">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <img src="<%=IPRequest.getImgPerfil() + usuario.getFoto()%>" data-src="holder.js/200x200" class="img-thumbnail">
                <h4><%=usuario.getNome()%></h4>
            </div>


            <%
                if (DAOUsuario.VerificaSeguir(usuario.getId_User())) {
            %>

            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-left links">

                <form method="POST" action="UsuarioServlet">
                    <input type="hidden" name="userSecu" value=<%=usuario.getId_User()%>>
                    <label class="btn btn-lg b-remove" for="remover"><i class="material-icons prefix">close</i></label><label class="rem-amigo" for="remover"> Remover amigo</label>
                    <input type="submit" name="Action" value="Seguir" id="remover" style="display: none;">
                </form>

            </div>

            <%
            } else {
                if (!DTO.Usuario.getId_User().equals(usuario.getId_User())) {%>

            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-left links">

                <form method="POST" action="UsuarioServlet">
                    <input type="hidden" name="userSecu" value=<%=usuario.getId_User()%>>
                    <label class="btn btn-lg b-add" for="adiciona"><i class="material-icons prefix">person_add</i></label><label class="add-amigo" for="adiciona"> Adicionar amigo</label>
                    <input type="submit" name="Action" value="Seguir" id="adiciona" style="display: none;">
                </form>

            </div>

            <%}
                }%>
        </div>
        <div class="container">
            <hr>
        </div>
        <div id="conteudo" class="container">
            <div class="row outro">
                <%String nome[] = usuario.getNome().trim().split(" ");

                %>

                <h3 class="righteous-font">Eventos criados por <%=nome[0]%></h3>
                <div class="carousel slide" id="carousel-outro" data-ride="carousel" data-type="multi" data-interval="false">
                    <div class="carousel-inner">
                        <%
                            boolean first = true;
                            params = new LinkedHashMap<>();
                            DPO.EventoRequest lembrete = new DPO.EventoRequest();
                            params.put("sql", lembrete.getSqlListMeusEvFollow().replace("EMAIL", usuario.getEmail()));
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
                                        <%if (evento.getNome().trim().length() > 24) {
                                        %>
                                        <h5><%=evento.getNome().trim().substring(0, 24) + "..."%></h5>
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
                                        <%if (evento.getNome().trim().length() > 24) {
                                        %>
                                        <h5><%=evento.getNome().trim().substring(0, 24) + "..."%></h5>
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
                    <%}%>
                </div>
                </ul>
            </div>
            <div class="row evseguidos">
                <h3 class="righteous-font">Eventos Seguidos</h3>
                <div class="carousel slide" id="carousel-evseguidos" data-ride="carousel" data-type="multi" data-interval="false">
                    <div class="carousel-inner">

                        <%
                            first = true;
                            params = new LinkedHashMap<>();
                            lembrete = new DPO.EventoRequest();
                            params.put("sql", lembrete.getSqlListEvSeguidosFollow().replace("ID", usuario.getId_User()));
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
                                        <%if (evento.getNome().trim().length() > 24) {
                                        %>
                                        <h5><%=evento.getNome().trim().substring(0, 24) + "..."%></h5>
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
                                        <%if (evento.getNome().trim().length() > 24) {
                                        %>
                                        <h5><%=evento.getNome().trim().substring(0, 24) + "..."%></h5>
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

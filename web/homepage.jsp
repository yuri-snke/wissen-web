<%@page import="DTO.FollowersEvent"%>
<%@page import="DPO.IPRequest"%>
<%@page import="DTO.Evento"%>
<%@page import="DTO.Evento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="DAO.DAOEvento"%>
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
        <script type="text/javascript" src="./JS/homepage.js"></script>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="MDB_3.4.1/MDB Free/css/mdb.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/menu2.css">
        <link rel="stylesheet" type="text/css" href="./CSS/homepage.css">
        <link rel="stylesheet" type="text/css" href="./CSS/footer.css">
        <link rel="icon" href="./Imagens/IconeWissen.png" type="image/x-icon" sizes="16x16"/>
        <!-- Fontes -->
        <link rel="stylesheet" type="text/css" href="./CSS/Fontes.css">
        <link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
        <title>Wissen</title>
        <%

            if (DTO.Usuario.isPremium()) {
                DTO.Usuario.setPremium(false);
        %>

        <script>
            $(document).ready(function () {
                $("#compra").modal("show");
            });
        </script>

        <%
            }

        %>

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
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar text-center">
                        <li>
                            <a href="perfil.jsp" class="perfil">
                                <%                                    try {
                                        if (DTO.Usuario.getFoto().equals("SemImagemPerfil")) {%>
                                <img src="" data-src="holder.js/200x200" class="img-circle">
                                <%} else {%>
                                <img src="<%=IPRequest.getImgPerfil() + DTO.Usuario.getFoto()%>" data-src="holder.js/200x200" class="img-circle">
                                <%}
                                    } catch (NullPointerException e) {
                                        RequestDispatcher r = request.getRequestDispatcher("index.jsp");
                                        r.forward(request, response);
                                    }%>
                                <h5><%=DTO.Usuario.getNome()%></h5>
                            </a>
                        </li>
                    </ul>
                    <hr>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="#">Início <span class="sr-only">(current)</span></a></li>
                        <li><a href="cadastroEv.jsp">Criar Evento</a></li>
                        <li><a href="https://drive.google.com/file/d/1E_vnh2ZCeI9qm4k9EAuL8aWb7rNjLwpZ/view?usp=sharing">Manual do Usuário</a></li>
                    </ul>
                    <hr>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="perfil.jsp">Meus Eventos</a></li>
                        <li class="active"><a href="compra.jsp">Comprar PREMIUM</a></li>
                    </ul>
                </div>


                <!-- ---------------------------------------------------------------------------------------------------------------------------------------------  -->                            


                <div class="col-sm-9 col-md-10 main">
                    <h1 class="page-header"></h1>
                    <div id="slider" class="carousel slide carousel-fade" data-ride="carousel">
                        <div class="carousel-inner z-depth-2">
                            <%
                                boolean first = true;
                                LinkedHashMap<String, Object> params = new LinkedHashMap<>();
                                params.put("sql", DPO.EventoRequest.getSqlPremium());
                                DAOEvento dao = new DAOEvento();
                                ArrayList<DTO.Evento> ev = dao.ResponseRequest(DPO.EventoRequest.getListaEventos(), params);
                                for (Evento evento : ev) {
                                    if (first) {

                            %>
                            <div class="item active">
                                <div class="view overlay hm-blue-slight">
                                    <a href="evento.jsp?evento=<%=evento.getId()%>"><img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" class="img-responsive imgCaroseul">
                                        <div class="mask waves-effect waves-light"></div>
                                    </a>
                                </div>
                                <div class="carousel-caption hidde-xs">
                                    <div class="animated fadeInDown">
                                        <h3 class="righteous-font"><%=evento.getNome()%></h3>

                                    </div>
                                </div>
                            </div>
                            <%
                                first = false;
                            } else {
                            %>
                            <div class="item">
                                <div class="view overlay hm-blue-slight">
                                    <a href="evento.jsp?evento=<%=evento.getId()%>"><img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" class="img-responsive imgCaroseul">
                                        <div class="mask waves-effect waves-light"></div>
                                    </a>
                                </div>
                                <div class="carousel-caption hidde-xs">
                                    <div class="animated fadeInDown">
                                        <h3 class="righteous-font"><%=evento.getNome()%></h3>
                                    </div>
                                </div>
                            </div>
                            <%}
                                }%>
                        </div>
                        <div class="left carousel-control">
                            <a href="#slider" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </div>
                        <div class="right carousel-control">
                            <a href="#slider" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>

                        </div>
                    </div>


                    <!-- ---------------------------------------------------------------------------------------------------------------------------------------------  -->                            

                    <div class="row" id="recomendados">
                        <h3 class="text-left righteous-font">Recomendados</h3>
                        <div id="carousel-recomend" class="carousel slide" data-ride="carousel" data-type="multi" data-interval="false">
                            <div class="carousel-inner">
                                <%
                                    first = true;
                                    params = new LinkedHashMap<>();
                                    DPO.EventoRequest query = new DPO.EventoRequest();
                                    params.put("sql1", query.getSqlLista1());
                                    params.put("sql2", query.getSqlLista2());
                                    params.put("sql3", query.getSqlLista3());
                                    params.put("sql4", query.getSqlLista4());
                                    params.put("sql5", query.getSqlLista5());
                                    params.put("sql6", query.getSqlLista6());
                                    params.put("sql7", query.getSqlLista7());

                                    dao = new DAOEvento();
                                    ev = dao.ResponseRequest(DPO.EventoRequest.getListaEventosRecomendados(), params);
                                    for (Evento evento : ev) {
                                        if (first) {
                                %>
                                <div class="item active">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                        <div class="card hoverable">
                                            <div class="card-image">
                                                <div class="view overlay hm-white-slight z-depth-1">
                                                    <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250" class="img-responsive">
                                                    <a href="evento.jsp?evento=<%=evento.getId()%>">
                                                        <div class="mask waves-effect"></div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="card-content">

                                                <%if (evento.getNome().length() > 33) {
                                                %>
                                                <h5><%=evento.getNome().substring(0, 33) + "..."%></h5>
                                                <%} else {%>
                                                <h5><%=evento.getNome()%></h5>
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
                                                    <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250" class="img-responsive">
                                                    <a href="evento.jsp?evento=<%=evento.getId()%>">
                                                        <div class="mask waves-effect"></div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="card-content">

                                                <%if (evento.getNome().trim().length() > 33) {
                                                %>
                                                <h5><%=evento.getNome().trim().substring(0, 33) + "..."%></h5>
                                                <%} else {%>
                                                <h5><%=evento.getNome().trim()%></h5>
                                                <%}%>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <%}
                                    }%>

                            </div>
                            <%
                                if (ev.size() > 3) {
                            %>
                            <div class="left carousel-control">
                                <a href="#carousel-recomend" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </div>
                            <div class="right carousel-control">
                                <a href="#carousel-recomend" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>

                            </div>
                            <%}%>
                        </div>
                    </div>





                    <!-- ---------------------------------------------------------------------------------------------------------------------------------------------  -->                            

                    <%
                        first = true;
                        params = new LinkedHashMap<>();
                        DPO.EventoRequest Followers = new DPO.EventoRequest();
                        params.put("sql", Followers.getSqlListEvFollSeg());
                        dao = new DAOEvento();
                        ArrayList<FollowersEvent> even = dao.RequestFollowersEvents(DPO.EventoRequest.getListaEventos(), params);
                        if (even.size() > 0) {
                    %>

                    <div class="row" id="mseguidores">
                        <h3 class="text-left righteous-font">Meus Seguidores</h3>
                        <div id="carousel-seguidores" class="carousel slide" data-ride="carousel" data-type="multi" data-interval="false">
                            <div class="carousel-inner">
                                <%
                                    for (FollowersEvent evento : even) {
                                        if (first) {
                                %>
                                <div class="item active">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                        <div class="card hoverable">
                                            <div class="card-image">
                                                <div class="view overlay hm-white-slight z-depth-1">
                                                    <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250" class="img-responsive">
                                                    <a href="evento.jsp?evento=<%=evento.getId()%>">
                                                        <div class="mask waves-effect"></div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="card-content">

                                                <%if (evento.getNome().length() > 31) {
                                                %>
                                                <h5><%=evento.getNome().substring(0, 31) + "..."%></h5>
                                                <%} else {%>
                                                <h5><%=evento.getNome()%></h5>
                                                <%}%>

                                                <img src="<%=IPRequest.getImgPerfil() + evento.getImagemPerfil_User()%>" data-src="holder.js/50x50" class="img-circle img-responsive">
                                                <span><%=evento.getNome_User()%></span>

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
                                                    <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250" class="img-responsive">
                                                    <a href="evento.jsp?evento=<%=evento.getId()%>">
                                                        <div class="mask waves-effect"></div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="card-content">
                                                <%if (evento.getNome().length() > 31) {
                                                %>
                                                <h5><%=evento.getNome().substring(0, 31) + "..."%></h5>
                                                <%} else {%>
                                                <h5><%=evento.getNome()%></h5>
                                                <%}%>
                                                <img src="<%=IPRequest.getImgPerfil() + evento.getImagemPerfil_User()%>" data-src="holder.js/50x50" class="img-circle img-responsive">
                                                <span><%=evento.getNome_User()%></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        }
                                    }%>
                            </div>
                            <%
                                if (even.size() > 3) {
                            %>
                            <div class="left carousel-control">
                                <a href="#carousel-seguidores" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </div>
                            <div class="right carousel-control">
                                <a href="#carousel-seguidores" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <%}  %>

                        </div>
                    </div>
                    <%}%>


                    <!-- ---------------------------------------------------------------------------------------------------------------------------------------------  -->                            

                    <%
                        first = true;
                        params = new LinkedHashMap<>();
                        DPO.EventoRequest lembrete = new DPO.EventoRequest();
                        params.put("sql", lembrete.getSqlListEvSeguidos());
                        dao = new DAOEvento();
                        ArrayList<DTO.FollowersEvent> Fev = dao.RequestLembreteEvents(DPO.EventoRequest.getListaEventos(), params);
                        if (Fev.size() > 0) {
                    %>
                    <div class="row" id="lembrete">
                        <h3 class="text-left righteous-font">Lembretes</h3>
                        <div id="carousel-lembrete" class="carousel slide" data-ride="carousel" data-type="multi" data-interval="false">
                            <div class="carousel-inner">
                                <%
                                    for (FollowersEvent evento : Fev) {
                                        if (first) {
                                %>
                                <div class="item active">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                        <div class="card hoverable">
                                            <div class="card-image">
                                                <div class="view overlay hm-white-slight z-depth-1">
                                                    <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250" class="img-responsive">
                                                    <a href="evento.jsp?evento=<%=evento.getId()%>&Status=<%=evento.getStatusFollow()%>">
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
                                                    <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250" class="img-responsive">
                                                    <a href="evento.jsp?evento=<%=evento.getId()%>&Status=<%=evento.getStatusFollow()%>">
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
                            <%
                                if (Fev.size() > 3) {
                            %>
                            <div class="left carousel-control">
                                <a href="#carousel-lembrete" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </div>
                            <div class="right carousel-control">
                                <a href="#carousel-lembrete" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>

                            </div>
                            <%}%>
                        </div>
                    </div>
                    <%}%>



                    <!-- ---------------------------------------------------------------------------------------------------------------------------------------------  -->                            



                    <div class="row" id="interesses">
                        <h3 class="text-left righteous-font">Outros</h3>
                        <div id="carousel-interesses" class="carousel slide" data-ride="carousel" data-type="multi" data-interval="false">
                            <div class="carousel-inner">
                                <%
                                    first = true;
                                    params = new LinkedHashMap<>();
                                    params.put("sql", DPO.EventoRequest.getSqlNPremium());
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
                                                    <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250" class="img-responsive">
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
                                                    <img src="<%=IPRequest.getImgEventCapa() + evento.getImagemCapa()%>" data-src="holder.js/500x250" class="img-responsive">
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
                            <div class="left carousel-control">
                                <a href="#carousel-interesses" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </div>
                            <div class="right carousel-control">
                                <a href="#carousel-interesses" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="compra" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <h4 class="righteous-font">Lembrete</h4>
                </div>
                <div class="modal-body" style="padding: 40px 50px;">
                    <div class="row text-center">
                        <p>Você comprou um pacote premium,<br> agora seus eventos ganharam destaque!</p>
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
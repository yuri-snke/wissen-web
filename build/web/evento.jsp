<%-- 
    Document   : evento
    Created on : 27/09/2017, 17:10:04
    Author     : CT Tarde
--%>

<%@page import="DTO.Usuario"%>
<%@page import="DPO.IPRequest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOEvento"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="DTO.Evento"%>
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
        <link rel="stylesheet" type="text/css" href="./CSS/menu2.css">
        <link rel="stylesheet" type="text/css" href="./CSS/footer.css">
        <link rel="stylesheet" type="text/css" href="./CSS/evento2.css">
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
            params.put("sql", DPO.EventoRequest.getSqlPegaUm() + request.getParameter("evento"));
            DAOEvento dao = new DAOEvento();
            DTO.Evento ev = dao.PegaEvento(DPO.EventoRequest.getListaEventos(), params);
        %>
        <div id="conteudo" class="container-fluid">
            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                <div class="ev-header">
                    <h1 class="righteous-font"><%=ev.getNome()%></h1>
                </div>
                <div class="ev-body">
                    <div class="ev-descricao">
                        <p>
                            <%=ev.getDescricao()%>
                        </p>
                    </div>

                    <%if (ev.getEmailCriador().equalsIgnoreCase(Usuario.getEmail())) {%>
                    <form action="EventoServlet" method="POST">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <input type="hidden" name="id" value="<%=ev.getId()%>" />
                            <button name="Action" value="Excluir" type="button" class="btn btn-lg waves-effect waves-light botao righteous-font pull-right" data-toggle="modal" data-target="#excluir"><span class="glyphicon glyphicon-remove"></span> Excluir</button>
                            <button name="Action" value="Editar" class="btn btn-lg waves-effect waves-light botao righteous-font pull-right"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
                        </div>
                    </form>
                    <%} else {
                    %>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <button data-toggle="modal" data-target="#denuncia" class="btn btn-lg b-denuncia pull-right">Denunciar</button>
                    </div>
                    <%
                        }%>
                    <div class="modal fade" id="excluir" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="righteous-font">Têm certeza que deseja excluir?</h4>
                                </div>
                                <div class="modal-body" style="padding: 40px 50px;">
                                    <div class="row">
                                        <form class="col-md-12 text-center" method="POST" action="EventoServlet">
                                            <input type="hidden" name="id" value="<%=ev.getId()%>" />
                                            <button type="submit" name="Action" value="Excluir" class="excluir btn waves-effect waves-light">Confirmar</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn deep-purple darken-1 waves-effect waves-light pull-left" data-dismiss="modal"> Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="ev-user">
                        <table>
                            <tr>
                                <td><span>Responsável: <%=ev.getResponsavel()%></span></td>
                            </tr>
                        </table>
                        <div class="ev-info col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <ul>
                                <li>De: <%= ev.getDataIni()%>  até  <%=ev.getDataTer()%></li>
                                <li>Das: <%= ev.getHoraIni()%>  até  <%=ev.getHoraTer()%></li>
                                <li>Contato: <%= ev.getTelFixo()%></li>
                                <li>Celular: <%= ev.getTelMovel()%></li>
                                <li>Preco: <%= ev.getPreco()%></li>
                            </ul>
                        </div>
                        <div class="ev-info col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <ul>

                                <li>CEP: <%= ev.getCEP()%></li>
                                <li>Local: <%= ev.getLocal()%></li>
                                <li>Endereço: <%= ev.getEndereco()%></li>
                                <li>Estado: <%= ev.getEstado()%></li>
                                <li>Cidade: <%= ev.getCidade()%></li>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ev-footer col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ul>
                        <li>Interessados <span class="badge warning-color"> <%= ev.getInteressados()%></span></li>
                        <li>Comparecerão <span class="badge success-color"> <%= ev.getComparecerao()%></span></li>
                    </ul>
                </div>
                <div class="ev-form col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <script>
                        function Tint(objt) {
                            if (objt.checked) {
                                $('.conf-2').css('display', 'block');
                                $('.conf-1').css('display', 'none');
                            }
                        }
                        function Comp(objt) {
                            if (objt.checked) {
                                $('.conf-1').css('display', 'block');
                                $('.conf-2').css('display', 'none');
                            }
                        }
                    </script>
                    <%if (!ev.getEmailCriador().equalsIgnoreCase(Usuario.getEmail())) {%>
                    <form action="EventoServlet" method="POST">
                        <input type="hidden" name="id" value="<%=ev.getId()%>" />
                        <input type="hidden" name="Inter" value="<%=ev.getInteressados()%>" />
                        <input type="hidden" name="Compa" value="<%=ev.getComparecerao()%>" />
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <ul class="opcoes">
                                <li class="opcao">
                                    <%
                                        int Status = 0;
                                        try {
                                            Status = Integer.parseInt(request.getParameter("Status"));
                                        } catch (NumberFormatException e) {
                                        }
                                        if (Status == 1) {
                                    %>
                                    <input type="radio" name="opcao" id="opcao-2" onclick="Tint(this)" checked="true">
                                    <%
                                    } else {
                                    %>
                                    <input type="radio" name="opcao" id="opcao-2" onclick="Tint(this)">
                                    <%
                                        }
                                    %>
                                    <label class="i" for="opcao-2"><i class="material-icons prefix">event_note</i> Tenho Interesse</label>
                                    <label class="conf-2 pull-right" for="botao-2" style="display: none">Confirmar</label>
                                    <input type="submit" value="TenhoInteresse" name="Action" id="botao-2" style="display: none">
                                </li>
                                <li class="opcao">
                                    <%
                                        if (Status == 2) {
                                    %>
                                    <input type="radio" name="opcao" id="opcao-1" onclick="Comp(this)" checked="true">
                                    <%
                                    } else {
                                    %>
                                    <input type="radio" name="opcao" id="opcao-1" onclick="Comp(this)">
                                    <%
                                        }

                                    %>
                                    <label class="c" for="opcao-1"><i class="material-icons prefix">event_available</i> Comparecerei</label>
                                    <label class="conf-1" for="botao-1" style="display: none">Confirmar</label>
                                    <input type="submit" value="Comparecerei" name="Action" id="botao-1" style="display: none">
                                </li>
                            </ul>
                        </div>
                    </form>   
                    <%                                        }
                    %>
                </div>
            </div>
            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12" id="slider-wrapper">
                <div class="img-destaque" id="image-slider">
                    <%                        String[] imagens = ev.getImagens().split(";");
                    %>
                    <ul>
                        <li class="active-img">
                            <img src="<%=IPRequest.getImgEventCapa() + ev.getImagemCapa()%>" alt="" />
                        </li>

                        <%
                            if (!imagens[0].equals("SemImagem")) {
                        %>
                        <li>
                            <img src="<%=IPRequest.getImgEventCapa() + imagens[0]%>" alt="" />
                        </li>
                        <%}
                            if (imagens.length == 2) {%>
                        <li>
                            <img src="<%=IPRequest.getImgEventCapa() + imagens[1]%>" alt="" />
                        </li>													
                        <%}%>
                    </ul>
                </div>
                <div class="img-outras" id="thumbnail">
                    <ul>
                        <li class="active"><img src="<%=IPRequest.getImgEventCapa() + ev.getImagemCapa()%>" alt="" /></li>
                            <% if (!imagens[0].equals("SemImagem")) {%>
                        <li class="active"><img src="<%=IPRequest.getImgEventCapa() + imagens[0]%>" alt="" /></li>
                            <%}
                                if (imagens.length == 2) {%>
                        <li class="active"><img src="<%=IPRequest.getImgEventCapa() + imagens[1]%>" alt="" /></li>		
                            <%}%>
                    </ul>
                </div>
                <script type="text/javascript" src="./JS/evento.js"></script>
            </div>
        </div>
        <div class="modal fade" id="denuncia" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="righteous-font">Denunciar Evento</h4>
                    </div>
                    <div class="modal-body" style="padding: 40px 50px;">
                        <div class="row">
                            <form class="col-md-12" role="form" method="POST" action="EventoServlet">
                                <input type="hidden" name="id"  value=<%=ev.getId()%>/>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="m-linha">Motivo: </label>
                                        <input type="text" name="motivo" />
                                    </div>
                                    <div class="form-group">
                                        <label class="m-linha">Descrição: </label>
                                        <textarea maxlength="200" name="desc" class="desc"></textarea>
                                        <div class="text-center">
                                            <button type="submit" name="Action" value="Denuncia" class="btn btn-lg b-enviar">Enviar</button>
                                        </div>
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
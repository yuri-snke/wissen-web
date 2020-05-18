/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import DAO.DAOEvento;
import DTO.Usuario;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.InputMismatchException;
import java.util.LinkedHashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author CT Tarde
 */
@WebServlet(name = "EventoServlet", urlPatterns = {"/EventoServlet"})
@MultipartConfig(maxFileSize = 30971520)
public class EventoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EventoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EventoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String Action = request.getParameter("Action");

        if (Action.equals("Cadastrar")) {

            DTO.Evento NovoEvento = new DTO.Evento();

            NovoEvento.setId(request.getParameter("id"));
            NovoEvento.setImagemCapa(request.getParameter("NomeImagemCapa"));
            NovoEvento.setImagens(request.getParameter("NomeImagens"));
            NovoEvento.setNome(request.getParameter("titulo"));
            NovoEvento.setDescricao(request.getParameter("desc"));

            int priv = -1;
            if (request.getParameter("priv") == null) {
                priv = 0;
            } else {
                priv = 1;
            }
            NovoEvento.setPrivado(priv);

            String[] categorias = {"Ao Ar Livre", "Cinema", "Bar", "Casamento", "Corporativo",
                "Criancas", "Eventos Culturais", "Exposicao", "Feiras", "Festas", "Festival",
                "Formatura", "Gastronomia", "Literatura", "Restaurante", "Social", "Urbano", "Outros"};

            String categoria = request.getParameter("categoria");
            String categoria1 = request.getParameter("categoria1");
            String categoria2 = request.getParameter("categoria2");

            if (categoria.equals("Selecione")) {
                if (categoria1.equals("Selecione")) {
                    if (categoria2.equals("Selecione")) {
                        request.setAttribute("ErroCadastro", "Selecione uma Categoria.");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroEv.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        NovoEvento.setTipo(categorias[Integer.parseInt(categoria2)]);
                    }

                } else {
                    NovoEvento.setTipo(categorias[Integer.parseInt(categoria1)] + ";" + categorias[Integer.parseInt(categoria2)]);
                }

            } else {
                if (categoria2.equals("Selecione")) {
                    NovoEvento.setTipo(categorias[Integer.parseInt(categoria)]);
                } else {
                    NovoEvento.setTipo(categorias[Integer.parseInt(categoria)] + ";" + categorias[Integer.parseInt(categoria1)] + ";" + categorias[Integer.parseInt(categoria2)]);
                }
            }

            NovoEvento.setDataIni(request.getParameter("data_inicio"));
            NovoEvento.setDataTer(request.getParameter("data_termino"));
            NovoEvento.setHoraIni(request.getParameter("hora_inicio"));
            NovoEvento.setHoraTer(request.getParameter("hora_inicio"));
            NovoEvento.setTelFixo(request.getParameter("contato"));
            NovoEvento.setTelMovel(request.getParameter("cel"));
            NovoEvento.setCEP(request.getParameter("cep"));
            NovoEvento.setEstado(request.getParameter("estado"));
            NovoEvento.setCidade(request.getParameter("cidade"));
            NovoEvento.setBairro(request.getParameter("bairro"));
            NovoEvento.setLocal(request.getParameter("local"));
            NovoEvento.setPreco(request.getParameter("preco"));
              
            String cpf = request.getParameter("cpf").replace("-", "").replace(".","");
            System.out.println(cpf);
            if (ValidaCPF(cpf)) {
                NovoEvento.setCpfCnpj(request.getParameter("cpf"));
            } else {
                request.setAttribute("ErroCadastro", "CPF INVÁLIDO.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroEv.jsp");
                dispatcher.forward(request, response);
            }

            NovoEvento.setEndereco(request.getParameter("endereco"));
            NovoEvento.setResponsavel(request.getParameter("responsavel"));
            NovoEvento.setLatitude(request.getParameter("Latitude"));
            NovoEvento.setLongitude(request.getParameter("Longitude"));

            Part FotoCapa = request.getPart("fotoCapa");
            Part foto2 = request.getPart("foto2");
            
            Part foto3 = request.getPart("foto3");
            System.out.println("-----  "+request.getPart("foto3").toString());
            
            String BFotoCapa = null;
            String BFoto2 = null;
            String BFoto3 = null;
            if (FotoCapa != null) {

                InputStream fotoCapa = FotoCapa.getInputStream();
                byte[] bFotoCapa = IOUtils.toByteArray(fotoCapa);
                BFotoCapa = Base64.getEncoder().encodeToString(bFotoCapa);
                if (foto2 != null) {

                    InputStream Foto2 = foto2.getInputStream();
                    byte[] bFoto2 = IOUtils.toByteArray(Foto2);
                    BFoto2 = Base64.getEncoder().encodeToString(bFoto2);

                }
                if (foto3 != null) {

                    InputStream Foto3 = foto3.getInputStream();
                    byte[] bFoto3 = IOUtils.toByteArray(Foto3);
                    BFoto3 = Base64.getEncoder().encodeToString(bFoto3);
                }
            } else {
                request.setAttribute("ErroCadastro", "Selecione a Foto de Capa.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroEv.jsp");
                dispatcher.forward(request, response);
            }

            if (DAO.DAOEvento.Cadastro(NovoEvento, BFotoCapa, BFoto2, BFoto3)) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("ErroCadastro", "Erro ao Cadastrar Evento.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroEv.jsp");
                dispatcher.forward(request, response);
            }

        } else if (Action.equalsIgnoreCase("Editar")) {
            LinkedHashMap<String, Object> params = new LinkedHashMap<>();
            params.put("sql", DPO.EventoRequest.getSqlPegaUm() + request.getParameter("id"));
            DAOEvento dao = new DAOEvento();
            DTO.Evento ev = dao.PegaEvento(DPO.EventoRequest.getListaEventos(), params);
            request.setAttribute("teste", ev);
            RequestDispatcher dispatcher = request.getRequestDispatcher("editarEv1.jsp");
            dispatcher.forward(request, response);

        } else if (Action.equalsIgnoreCase("Atualizar")) {

            DTO.Evento NovoEvento = new DTO.Evento();
            NovoEvento.setId(request.getParameter("id"));
            NovoEvento.setImagemCapa(request.getParameter("NomeImagemCapa"));
            NovoEvento.setImagens(request.getParameter("NomeImagens"));

            NovoEvento.setNome(request.getParameter("titulo"));
            NovoEvento.setDescricao(request.getParameter("desc"));
            int priv = -1;
            if (request.getParameter("priv") == null) {
                priv = 0;
            } else {
                priv = 1;
            }
            NovoEvento.setPrivado(priv);

            String[] categorias = {"Ao Ar Livre", "Cinema", "Bar", "Casamento", "Corporativo",
                "Criancas", "Eventos Culturais", "Exposicao", "Feiras", "Festas", "Festival",
                "Formatura", "Gastronomia", "Literatura", "Restaurante", "Social", "Urbano", "Outros"};

            String categoria = request.getParameter("categoria");
            String categoria1 = request.getParameter("categoria1");
            String categoria2 = request.getParameter("categoria2");

            if (categoria.equals("Selecione")) {
                if (categoria1.equals("Selecione")) {
                    if (categoria2.equals("Selecione")) {
                        request.setAttribute("ErroCadastro", "Selecione uma Categoria.");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroEv.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        NovoEvento.setTipo(categorias[Integer.parseInt(categoria2)]);
                    }

                } else {
                    NovoEvento.setTipo(categorias[Integer.parseInt(categoria1)] + ";" + categorias[Integer.parseInt(categoria2)]);
                }

            } else {
                if (categoria2.equals("Selecione")) {
                    NovoEvento.setTipo(categorias[Integer.parseInt(categoria)]);
                } else {
                    NovoEvento.setTipo(categorias[Integer.parseInt(categoria)] + ";" + categorias[Integer.parseInt(categoria1)] + ";" + categorias[Integer.parseInt(categoria2)]);
                }
            }

            NovoEvento.setDataIni(request.getParameter("data_inicio"));
            NovoEvento.setDataTer(request.getParameter("data_termino"));
            NovoEvento.setHoraIni(request.getParameter("hora_inicio"));
            NovoEvento.setHoraTer(request.getParameter("hora_inicio"));
            NovoEvento.setTelFixo(request.getParameter("contato"));
            NovoEvento.setTelMovel(request.getParameter("cel"));
            NovoEvento.setCEP(request.getParameter("cep"));
            NovoEvento.setEstado(request.getParameter("estado"));
            NovoEvento.setCidade(request.getParameter("cidade"));
            NovoEvento.setBairro(request.getParameter("bairro"));
            NovoEvento.setLocal(request.getParameter("local"));
            NovoEvento.setPreco(request.getParameter("preco"));
            NovoEvento.setCpfCnpj(request.getParameter("cpf"));
            NovoEvento.setEndereco(request.getParameter("endereco"));
            NovoEvento.setResponsavel(request.getParameter("responsavel"));

            Part FotoCapa = request.getPart("fotoCapa");
            Part foto02 = request.getPart("2foto");
            Part foto03 = request.getPart("3foto");
            String BFotoCapa = null;
            String BFoto2 = null;
            String BFoto3 = null;

            if (FotoCapa != null) {
                InputStream fotoCapa = FotoCapa.getInputStream();
                byte[] bFotoCapa = IOUtils.toByteArray(fotoCapa);
                BFotoCapa = Base64.getEncoder().encodeToString(bFotoCapa);

                if (foto02 != null) {
                    InputStream Foto2 = foto02.getInputStream();
                    byte[] bFoto2 = IOUtils.toByteArray(Foto2);
                    BFoto2 = Base64.getEncoder().encodeToString(bFoto2);

                }
                if (foto03 != null) {
                    InputStream Foto3 = foto03.getInputStream();
                    byte[] bFoto3 = IOUtils.toByteArray(Foto3);
                    BFoto3 = Base64.getEncoder().encodeToString(bFoto3);

                }
            } else {
                request.setAttribute("ErroAtualizacao", "Selecione a Foto de Capa.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("editarEv1.jsp");
                dispatcher.forward(request, response);
            }

            if (DAO.DAOEvento.Atualizar(NovoEvento, BFotoCapa, BFoto2, BFoto3)) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("evento.jsp?evento=" + NovoEvento.getId());
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("ErroAtualizacao", "Selecione as 3 imagens.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("evento.jsp?evento=" + NovoEvento.getId());
                dispatcher.forward(request, response);
            }
        } else if (Action.equalsIgnoreCase("TenhoInteresse")) {
            DAOEvento dao = new DAOEvento();
            if (dao.Seguir(Usuario.getId_User(), request.getParameter("id"), "1", request.getParameter("Inter"), request.getParameter("Compa"))) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("evento.jsp?evento=" + request.getParameter("id") + "&Status=1");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("evento.jsp?evento=" + request.getParameter("id") + "&Status=1");
                dispatcher.forward(request, response);
            }
        } else if (Action.equalsIgnoreCase("Comparecerei")) {
            DAOEvento dao = new DAOEvento();
            if (dao.Seguir(Usuario.getId_User(), request.getParameter("id"), "2", request.getParameter("Inter"), request.getParameter("Compa"))) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("evento.jsp?evento=" + request.getParameter("id") + "&Status=2");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("evento.jsp?evento=" + request.getParameter("id") + "&Status=2");
                dispatcher.forward(request, response);
            }
        } else if (Action.equalsIgnoreCase("Excluir")) {
            DAOEvento dao = new DAOEvento();
            if (dao.Excluir(request.getParameter("id"))) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("evento.jsp?evento=" + request.getParameter("id"));
                dispatcher.forward(request, response);
            }
        } else if (Action.equalsIgnoreCase("Denuncia")) {
            DAOEvento dao = new DAOEvento();
            if (dao.Denuncia(request.getParameter("motivo"), request.getParameter("desc"), request.getParameter("id"))) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("evento.jsp?evento=" + request.getParameter("id"));
                dispatcher.forward(request, response);
            }
        }

    }

    public static boolean ValidaCPF(String CPF) {
        if (CPF.equals("00000000000") || CPF.equals("11111111111")
                || CPF.equals("22222222222") || CPF.equals("33333333333")
                || CPF.equals("44444444444") || CPF.equals("55555555555")
                || CPF.equals("66666666666") || CPF.equals("77777777777")
                || CPF.equals("88888888888") || CPF.equals("99999999999")
                || (CPF.length() != 11)) {
            return (false);
        }

        char dig10, dig11;
        int sm, i, r, num, peso;

// "try" - protege o codigo para eventuais erros de conversao de tipo (int)
        try {
// Calculo do 1o. Digito Verificador
            sm = 0;
            peso = 10;
            for (i = 0; i < 9; i++) {
// converte o i-esimo caractere do CPF em um numero:
// por exemplo, transforma o caractere '0' no inteiro 0         
// (48 eh a posicao de '0' na tabela ASCII)         
                num = (int) (CPF.charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11)) {
                dig10 = '0';
            } else {
                dig10 = (char) (r + 48); // converte no respectivo caractere numerico
            }
// Calculo do 2o. Digito Verificador
            sm = 0;
            peso = 11;
            for (i = 0; i < 10; i++) {
                num = (int) (CPF.charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11)) {
                dig11 = '0';
            } else {
                dig11 = (char) (r + 48);
            }

// Verifica se os digitos calculados conferem com os digitos informados.
            if ((dig10 == CPF.charAt(9)) && (dig11 == CPF.charAt(10))) {
                return (true);
            } else {
                return (false);
            }
        } catch (InputMismatchException erro) {
            return (false);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

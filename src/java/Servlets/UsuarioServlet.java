/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import DAO.DAOUsuario;
import DTO.Usuario;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
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
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
@MultipartConfig(maxFileSize = 20971520)
public class UsuarioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet IndexServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IndexServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String Action = request.getParameter("Action");
        switch (Action) {
            case "Logar":

                Usuario.setEmail(request.getParameter("email").toLowerCase());
                Usuario.setSenha(request.getParameter("senha"));
                if (DAO.DAOUsuario.Login()) {
                    if ("SemPref".equals(DTO.Usuario.getPreferencias())) {
                        RequestDispatcher dispatcher = request.getRequestDispatcher("homepageFT.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
                        dispatcher.forward(request, response);
                    }
                } else {
                    request.setAttribute("ErroLogin", "Email ou Senha inválido.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);

                }
                break;
            case "Cadastro":
                Usuario.setEmail(request.getParameter("email").toLowerCase());
                if (DAOUsuario.verificaEmail(Usuario.getEmail())) {
                    if (request.getParameter("senha").equals(request.getParameter("senhaConf"))) {
                        Usuario.setSenha(request.getParameter("senha"));
                        RequestDispatcher dispatcher = request.getRequestDispatcher("cadastro.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        request.setAttribute("ErroSenha", "As senhas não são iguais.");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                        dispatcher.forward(request, response);

                    }
                } else {
                    request.setAttribute("ErroEmail", "Este Email já está cadastrado.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);

                }
                break;
            case "Cadastrar":
                Usuario.setNome(request.getParameter("nome"));
                Usuario.setSobrenome(request.getParameter("sobrenome"));
                Usuario.setIdade(request.getParameter("idade"));
                Usuario.setGenero(request.getParameter("sexo"));
                Usuario.setPalavraSec(request.getParameter("secret"));
                Usuario.setCelular(request.getParameter("celular"));
                Usuario.setCep(request.getParameter("cep"));
                Usuario.setEstado(request.getParameter("uf"));
                Usuario.setCidade(request.getParameter("cidade"));
                Usuario.setEndereco(request.getParameter("endereco"));
                Usuario.setFoto(GeraFoto());
                if (DAOUsuario.CadastraUsuario()) {

                    Part filepart = request.getPart("foto");

                    if (filepart != null) {
                        InputStream input = filepart.getInputStream();
                        byte[] bytes = IOUtils.toByteArray(input);
                        String base = Base64.getEncoder().encodeToString(bytes);
                        if (DAOUsuario.CadastraFoto(base)) {
                            RequestDispatcher dispatcher = request.getRequestDispatcher("homepageFT.jsp");
                            dispatcher.forward(request, response);
                        } else {
                            request.setAttribute("ErroImagem", "Erro ao cadastrar a Imagem. Se o erro continuar entre em contato conosco no site oficial da BlindTech. =)");
                            RequestDispatcher dispatcher = request.getRequestDispatcher("cadastro.jsp");
                            dispatcher.forward(request, response);
                        }

                    }

                } else {
                    request.setAttribute("ErroCadastro", "Erro ao cadastrar o Usuário. Se o erro continuar entre em contato conosco no site oficial da BlindTech. =)");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("cadastro.jsp");
                    dispatcher.forward(request, response);
                }
                break;
            case "Sair":
                Usuario.setNome("");
                Usuario.setSobrenome("");
                Usuario.setIdade("");
                Usuario.setGenero("");
                Usuario.setPalavraSec("");
                Usuario.setCelular("");
                Usuario.setCep("");
                Usuario.setEstado("");
                Usuario.setCidade("");
                Usuario.setEndereco("");
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);

                break;
            case "FirstTime":
                String Categorias[] = {"Ar Livre", "Bar", "Casamento", "Cinema", "Corporativo", "Crianca", "Eventos Culturais", "Exposicao", "Feiras", "Festas", "Festivais", "Formatura", "Gastronomia", "Literatura", "Outros", "Restaurante", "Social", "Urbano"};
                String prefs = "";
                int w = 1;
                int c = 0;
                while (w < 19) {
                    if (request.getParameter("cat-" + w) != null) {
                        if (c < 2) {
                            prefs = prefs + Categorias[w - 1] + ";";
                            c++;
                        } else {
                            prefs = prefs + Categorias[w - 1];
                        }
                    }
                    w++;
                }
                DTO.Usuario.setPreferencias(prefs);
                if (DAOUsuario.CadastraPref()) {
                    dispatcher = request.getRequestDispatcher("homepage.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("ErroFT", "Erro ao cadastrar suas preferências.");
                    dispatcher = request.getRequestDispatcher("homepageFT.jsp");
                    dispatcher.forward(request, response);
                }
                break;
            case "Atualizar":
                Usuario.setNome(request.getParameter("nome"));
                Usuario.setSobrenome(request.getParameter("sobrenome"));
                Usuario.setIdade(request.getParameter("idade"));
                Usuario.setCelular(request.getParameter("celular"));
                Usuario.setCep(request.getParameter("cep"));
                Usuario.setEstado(request.getParameter("estado"));
                Usuario.setCidade(request.getParameter("cidade"));
                Usuario.setEndereco(request.getParameter("endereco"));
                if (DAOUsuario.AtualizaPerfil()) {
                    
                    request.setAttribute("AtualizadoCS", "Dados atualizados com sucesso.");
                    dispatcher = request.getRequestDispatcher("perfil.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("AtualizadoSS", "Erro ao atualizar os seus dados.");
                    dispatcher = request.getRequestDispatcher("perfil.jsp");
                    dispatcher.forward(request, response);
                }
                break;
            case "Salvar":
                try {
                    if (request.getParameter("palavaSecreta").equals(DTO.Usuario.getPalavraSec())) {

                        if (DAOUsuario.verificaEmailOutros(request.getParameter("email"))) {
                            if (request.getParameter("senha").equals(request.getParameter("ConfSenha"))) {
                                Usuario.setEmail(request.getParameter("email"));
                                Usuario.setSenha(request.getParameter("senha"));
                                if (DAOUsuario.AtualizaPerfilSeg()) {
                                    request.setAttribute("AtualizadoCS", "Dados atualizados com sucesso.");
                                    dispatcher = request.getRequestDispatcher("perfil.jsp");
                                    dispatcher.forward(request, response);
                                } else {
                                    request.setAttribute("AtualizadoSS", "Erro ao atualizar os seus dados.");
                                    dispatcher = request.getRequestDispatcher("perfil.jsp");
                                    dispatcher.forward(request, response);
                                }
                            } else {
                                request.setAttribute("AtualizadoSS", "Erro ao atualizar os seus dados. As senhas não iguais.");
                                dispatcher = request.getRequestDispatcher("perfil.jsp");
                                dispatcher.forward(request, response);
                            }
                        } else {
                            request.setAttribute("AtualizadoSS", "Erro ao atualizar os seus dados. Este email já existe.");
                            dispatcher = request.getRequestDispatcher("perfil.jsp");
                            dispatcher.forward(request, response);
                        }
                    } else {
                        request.setAttribute("AtualizadoSS", "Erro ao atualizar os seus dados. Palavra Secreta inválida.");
                        dispatcher = request.getRequestDispatcher("perfil.jsp");
                        dispatcher.forward(request, response);
                    }
                } catch (NullPointerException e) {
                    request.setAttribute("AtualizadoSS", "Erro ao atualizar os seus dados. Insira valores válidos.");
                    dispatcher = request.getRequestDispatcher("perfil.jsp");
                    dispatcher.forward(request, response);
                }

                break;
            case "Subir":
                if (Usuario.getFoto().equals("SemImagemPerfil")) {
                    Usuario.setFoto(GeraFoto());
                }
                Part filepart = request.getPart("foto");

                if (filepart != null) {
                    InputStream input = filepart.getInputStream();
                    byte[] bytes = IOUtils.toByteArray(input);
                    String base = Base64.getEncoder().encodeToString(bytes);
                    if (DAOUsuario.CadastraFoto(base)) {
                        request.setAttribute("AtualizadoCS", "Imagem atualizada com sucesso.");
                        dispatcher = request.getRequestDispatcher("perfil.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        request.setAttribute("AtualizadoSS", "Erro ao cadastrar a Imagem.");
                        dispatcher = request.getRequestDispatcher("perfil.jsp");
                        dispatcher.forward(request, response);
                    }

                }

                break;
            case "Privado":
                if (request.getParameter("priv") == null) {
                    DTO.Usuario.setPrivado(0);
                } else {
                    DTO.Usuario.setPrivado(1);
                }
                if (DAOUsuario.SetPrivado()) {
                    request.setAttribute("AtualizadoCS", "Dados atualizados com sucesso.");
                    dispatcher = request.getRequestDispatcher("perfil.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("AtualizadoSS", "Erro ao atualizar os seus dados.");
                    dispatcher = request.getRequestDispatcher("perfil.jsp");
                    dispatcher.forward(request, response);
                }
                break;

            case "Premium":
                LocalDate hoje = LocalDate.now();

                if (DAOUsuario.Premium(hoje.plusMonths(Integer.parseInt(request.getParameter("tipo"))) + "")) {
                    DTO.Usuario.setPremium(true);
                    dispatcher = request.getRequestDispatcher("homepage.jsp");
                    dispatcher.forward(request, response);
                } else {
                    dispatcher = request.getRequestDispatcher("compra.jsp");
                    dispatcher.forward(request, response);
                }
                break;

            case "Follow":
                LinkedHashMap<String, Object> params = new LinkedHashMap<>();
                params.put("sql", DPO.UsuarioRequest.getSqlFollow() + "'" + request.getParameter("email") + "'");
                DAOUsuario dao = new DAOUsuario();
                ArrayList<DTO.FollowUser> ev = dao.Seguidores(DPO.UsuarioRequest.getListSeguidores(), params);
                request.setAttribute("usuario", ev.get(0));
                dispatcher = request.getRequestDispatcher("followPerfil.jsp");
                dispatcher.forward(request, response);
                break;

            case "Seguir":

                DAOUsuario.seguir(request.getParameter("userSecu"));
                dispatcher = request.getRequestDispatcher("followPerfil.jsp?usuario=" + request.getParameter("userSecu"));
                dispatcher.forward(request, response);

                break;
            default:
                break;
        }

    }

    public static String GeraFoto() {
        StringBuilder sb = new StringBuilder();
        int qtdChars = 1;
        while (qtdChars <= 35) {
            int charInt = (int) (Math.random() * 91);
            if (((charInt >= 48) && (charInt <= 57)) || ((charInt >= 65) && (charInt <= 90))) {
                char c = (char) charInt;
                sb.append(c);
                qtdChars++;
            }
        }
        return sb.toString() + ".jpg";
    }

    @Override
    public String getServletInfo() {
        return "Servlet cujo a finalidade é receber dados de login e cadastro do usuario e verificar se tudo ocorreu certo e redireciona-lo para o lugar correto";
    }

}

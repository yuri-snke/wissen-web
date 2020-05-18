package Servlets;

import DAO.Email;
import DTO.FaleConosco;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BlindServlet", urlPatterns = {"/BlindServlet"})
public class BlindServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlindServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlindServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String Email = request.getParameter("email");
        String Assunto = request.getParameter("assunto");
        String Mensagem = request.getParameter("mensagem");

        FaleConosco.setEmail(Email);
        FaleConosco.setAssunto(Assunto);
        FaleConosco.setMensagem(Mensagem);

        Email email = new Email();

        email.EnviarEmail();
        RequestDispatcher dispatcher = request.getRequestDispatcher("BlindTech.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

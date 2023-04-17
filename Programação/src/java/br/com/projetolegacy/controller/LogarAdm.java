/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projetolegacy.controller;

import br.com.projetolegacy.dao.AdmDAOImpl;
import br.com.projetolegacy.model.Adm;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vinicius
 */
@WebServlet(name = "LogarAdm", urlPatterns = {"/LogarAdm"})
public class LogarAdm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        //determinar se é login ou logout
        if (acao.equals("login")) {
            String email = request.getParameter("loginAdm");
            String senha = request.getParameter("senhaAdm");

            if (!email.equals("") && !senha.equals("")) {
                //Criar Login
                try {
                    AdmDAOImpl dao = new AdmDAOImpl();
                    Adm oAdm = dao.logarAdm(email, senha);

                    if (oAdm != null) {
                        //Login deu certo
                        HttpSession sessao = request.getSession(true);
                        //Determinar o tempo que ela fica aberta
                        sessao.setAttribute("admlogado", oAdm);

                        //Carregar dados do ADM
                        AdmDAOImpl daoadm = new AdmDAOImpl();
                        Adm oAdm1 = (Adm) daoadm.carregar(oAdm.getIdAdm());
                        request.setAttribute("mensagem", "Seja Bem Vindo: " + oAdm1.getNomeAdm());
                        sessao.setAttribute("adm", oAdm);
                        request.getRequestDispatcher("HomeAdm").forward(request, response);
                    } else {
                        //Login deu errado
                        request.setAttribute("mensagem", "Alguma coisa ta em valida FI ! ");
                        request.getRequestDispatcher("Adm/loginadm.jsp").forward(request, response);
                    }
                } catch (Exception ex) {
                    System.out.println("Problemas ao logar ADM! \n ERRO: " + ex.getMessage());
                    ex.printStackTrace();
                }
            } else {
                request.setAttribute("mensagem", "O bonitinho digita um email e uma senha porfavor");
                request.getRequestDispatcher("Adm/loginadm.jsp").forward(request, response);
            }
        } else if (acao.equals("logout")) {
            HttpSession session = request.getSession(true);
            session.invalidate();
            response.sendRedirect("Adm/loginadm.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

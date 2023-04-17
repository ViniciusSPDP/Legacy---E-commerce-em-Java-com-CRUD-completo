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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vinicius
 */
@WebServlet(name = "SalvarAdm", urlPatterns = {"/SalvarAdm"})
public class SalvarAdm extends HttpServlet {

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

        //Recuperar os dados da JSP
        Adm oAdm = new Adm();

        //Recupera os atributos do ADM
        oAdm.setNomeAdm(request.getParameter("nomeAdm"));
        oAdm.setLoginAdm(request.getParameter("loginAdm"));
        oAdm.setSenhaAdm(request.getParameter("senhaAdm"));
        String mensagem = "";

        try {
            AdmDAOImpl dao = new AdmDAOImpl();

            if (request.getParameter("idAdm").equals("")) {

                if (dao.cadastrar(oAdm)) {
                    mensagem = "Adm cadastrado (a) com sucesso";
                } else {
                    mensagem = "Erro ao cadastrar Adm";
                }
            } else {
                oAdm.setIdAdm(Integer.parseInt(request.getParameter("idAdm")));
                if (dao.alterar(oAdm)) {
                    mensagem = "Adm Alterada com Sucesso";
                } else {
                    mensagem = "Erro ao Alterar Adm";
                }
            }
            request.setAttribute("mensagem", mensagem);
            //Quando o ListarAdm estiver Pronto
            request.getRequestDispatcher("ListarAdm").forward(request, response);
            //request.getRequestDispatcher("Adm/gerenciaradm.jsp").forward(request, response);

        } catch (Exception ex) {
            System.out.println("Problemas ao salvar Adm \n erro: " + ex.getMessage());
            ex.printStackTrace();
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

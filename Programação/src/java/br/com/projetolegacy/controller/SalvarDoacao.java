/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projetolegacy.controller;

import br.com.projetolegacy.dao.DoacaoDAOImpl;
import br.com.projetolegacy.model.Campanha;
import br.com.projetolegacy.model.Doacao;
import br.com.projetolegacy.model.Instituicao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vinicius
 */
@WebServlet(name = "SalvarDoacao", urlPatterns = {"/SalvarDoacao"})
public class SalvarDoacao extends HttpServlet {

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

        Doacao oDoacao = new Doacao();

        oDoacao.setCampanha(new Campanha(Integer.parseInt(request.getParameter("idCampanha"))));
        oDoacao.setInstituicao(new Instituicao(Integer.parseInt(request.getParameter("idInstituicao"))));

        String mensagem = "";

        try {
            DoacaoDAOImpl dao = new DoacaoDAOImpl();
            dao.cadastrar(oDoacao);
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("DadosDoacao").forward(request, response);

        } catch (Exception ex) {
            System.out.println("Problemas ao salvar Campanha \n erro: " + ex.getMessage());
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

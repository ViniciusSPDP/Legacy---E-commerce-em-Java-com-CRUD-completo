/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projetolegacy.controller;

import br.com.projetolegacy.dao.CampanhaDAOImpl;
import br.com.projetolegacy.model.Campanha;
import br.com.projetolegacy.model.Influenciador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rocha
 */
@WebServlet(name = "SalvarCampanha", urlPatterns = {"/SalvarCampanha"})
public class SalvarCampanha extends HttpServlet {

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
        Campanha oCampanha = new Campanha();

        //Recupera os atributos do ADM
        oCampanha.setNomeCampanha(request.getParameter("nomeCampanha"));
        oCampanha.setDescricaoCampanha(request.getParameter("descricaoCampanha"));
        oCampanha.setInfluenciador(new Influenciador(Integer.parseInt(request.getParameter("idInfluenciador"))));
        
        String mensagem = "";

        try {
            CampanhaDAOImpl dao = new CampanhaDAOImpl();

            if (request.getParameter("idCampanha").equals("")) {

                if (dao.cadastrar(oCampanha)) {
                    mensagem = "Campanha cadastrado (a) com sucesso";

                } else {
                    mensagem = "Erro ao cadastrar Campanha";
                }
            } else {
                oCampanha.setIdCampanha(Integer.parseInt(request.getParameter("idCampanha")));
                if (dao.alterar(oCampanha)) {
                    mensagem = "Campanha Alterada com Sucesso";
                } else {
                    mensagem = "Erro ao Alterar Campanha";
                }
            }
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("DadosCampanha").forward(request, response);
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

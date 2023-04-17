/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projetolegacy.controller;

import br.com.projetolegacy.dao.CampanhaDAOImpl;
import br.com.projetolegacy.dao.GenericDAO;
import br.com.projetolegacy.dao.InfluenciadorDAOImpl;
import br.com.projetolegacy.dao.InstituicaoDAOImpl;
import br.com.projetolegacy.model.Influenciador;
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
@WebServlet(name = "DadosCampanha", urlPatterns = {"/DadosCampanha"})
public class DadosCampanha extends HttpServlet {

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

        HttpSession sessaoAtiva = request.getSession(true);
        Influenciador oInfluenciador = new Influenciador();
        oInfluenciador = (Influenciador) sessaoAtiva.getAttribute("influenciadorlogado");

        try {
            GenericDAO dao = new InfluenciadorDAOImpl();
            //AdmDAOImpl daoadm = new AdmDAOImpl();

            Influenciador oInfluenciador1 = (Influenciador) dao.carregar(oInfluenciador.getIdInfluenciador());
            //       request.setAttribute("nome", oAdm1.getNomeAdm());
            request.setAttribute("id", oInfluenciador1.getIdInfluenciador());
            sessaoAtiva.setAttribute("influenciador", oInfluenciador);

            CampanhaDAOImpl daoc = new CampanhaDAOImpl();
            request.setAttribute("listacampanhainfluenciador", daoc.listarCampanhaInfluenciador(oInfluenciador1.getIdInfluenciador()));

            InstituicaoDAOImpl daoi = new InstituicaoDAOImpl();
            request.setAttribute("listainstituicao", daoi.listar());
            
            request.getRequestDispatcher("Campanha/gerenciarcampanha.jsp").forward(request, response);

        } catch (Exception ex) {
            System.out.println("Erro no Servlet DadosCampanha: " + ex.getMessage());
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.projetolegacy.controller;

import br.com.projetolegacy.dao.CampanhaDAOImpl;
import br.com.projetolegacy.dao.CarrinhoDAOImpl;
import br.com.projetolegacy.dao.ProdutoDAOImpl;
import br.com.projetolegacy.model.Campanha;
import br.com.projetolegacy.model.Carrinho;
import br.com.projetolegacy.model.Influenciador;
import br.com.projetolegacy.model.Produto;
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
 * @author Aluno
 */
@WebServlet(name = "DadosProduto", urlPatterns = {"/DadosProduto"})
public class DadosProduto extends HttpServlet {

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
        
        
        Integer idCampanha = 0;
        if (request.getAttribute("idCampanha") != null) {
            idCampanha = (Integer) request.getAttribute("idCampanha");
        } else {
            idCampanha = Integer.parseInt(request.getParameter("idCampanha"));
        }
        
        
        
        //Fazer o listar produtoCampanha
        
        try {
            request.setAttribute("idCampanha", idCampanha);
            ProdutoDAOImpl daop = new ProdutoDAOImpl();
            

            request.setAttribute("listarprodutocampanha", daop.listarProdutoCampanha(idCampanha));
            request.getRequestDispatcher("Produto/gerenciarproduto.jsp").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Erro no Servlet DadosProduto " + ex.getMessage());
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

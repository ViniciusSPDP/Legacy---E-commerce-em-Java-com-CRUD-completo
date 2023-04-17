/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.projetolegacy.controller;

import br.com.projetolegacy.dao.ProdutoDAOImpl;
import br.com.projetolegacy.model.Carrinho;
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
@WebServlet(name = "ListarProdutoCarrinho", urlPatterns = {"/ListarProdutoCarrinho"})
public class ListarProdutoCarrinho extends HttpServlet {

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
        Carrinho oCarrinho = new Carrinho();
        oCarrinho = (Carrinho) sessaoAtiva.getAttribute("carrinho");
        


        try {
            ProdutoDAOImpl dao = new ProdutoDAOImpl();
            request.setAttribute("listaprodutocarrinho", dao.listarProdutoCarrinho(oCarrinho.getIdCarrinho()));
            
            
            //Listar Total de Cada Campanha
            
            ProdutoDAOImpl daoP = new ProdutoDAOImpl();
            request.setAttribute("listadoacao", daoP.listarTotalCampanhaCarrinho(oCarrinho.getIdCarrinho()));
            
            
            request.getRequestDispatcher("Carrinho/itenscarrinho.jsp").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Erro ao Listar Carrinho: " + ex.getMessage());
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

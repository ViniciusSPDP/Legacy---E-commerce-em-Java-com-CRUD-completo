/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projetolegacy.controller;

import br.com.projetolegacy.dao.CarrinhoDAOImpl;
import br.com.projetolegacy.dao.InfluenciadorDAOImpl;
import br.com.projetolegacy.model.Carrinho;
import br.com.projetolegacy.model.Influenciador;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "FinalizarCarrinho", urlPatterns = {"/FinalizarCarrinho"})
public class FinalizarCarrinho extends HttpServlet {

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
        Influenciador oInfluenciador = (Influenciador) sessaoAtiva.getAttribute("influenciadorlogado");
        
        oCarrinho.setValortotalCarrinho(Double.parseDouble(request.getParameter("valorTotal")));        

        try {
            CarrinhoDAOImpl dao = new CarrinhoDAOImpl();
            dao.finalizarCarrinho(oCarrinho);

            //Carregar carrinho de compras
            CarrinhoDAOImpl daocarrinho = new CarrinhoDAOImpl();

            //Cadastrar o Carrinho
            oCarrinho = new Carrinho();
            oCarrinho.setoInfluenciador(oInfluenciador);

            if (daocarrinho.cadastrar(oCarrinho)) {

                daocarrinho = new CarrinhoDAOImpl();
                oCarrinho = (Carrinho) daocarrinho.carregar(oInfluenciador.getIdInfluenciador());
                sessaoAtiva.setAttribute("carrinho", oCarrinho);

            } else {
                System.out.println("Erro ao cadastrar carrinho na sessao");
            }

            request.setAttribute("mensagem", "Carrinho Finalizado");
            //request.getRequestDispatcher("Influenciador/homeinfluenciador.jsp").forward(request, response);
            request.getRequestDispatcher("ListarProduto").forward(request, response);
            

        } catch (Exception ex) {
            System.out.println("Problemas ao finalizar o carrinho o produto no carrinho \n erro: " + ex.getMessage());
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

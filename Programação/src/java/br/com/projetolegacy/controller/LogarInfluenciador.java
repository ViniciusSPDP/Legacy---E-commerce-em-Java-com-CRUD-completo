/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.projetolegacy.controller;

import br.com.projetolegacy.dao.CarrinhoDAOImpl;
import br.com.projetolegacy.dao.InfluenciadorDAOImpl;
import br.com.projetolegacy.model.Carrinho;
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
 * @author Aluno
 */
@WebServlet(name = "LogarInfluenciador", urlPatterns = {"/LogarInfluenciador"})
public class LogarInfluenciador extends HttpServlet {

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
            String email = request.getParameter("emailInfluenciador");
            String senha = request.getParameter("senhaInfluenciador");

            if (!email.equals("") && !senha.equals("")) {
                //Criar Login
                try {
                    InfluenciadorDAOImpl dao = new InfluenciadorDAOImpl();
                    Influenciador oInfluenciador = dao.logarInfluenciador(email, senha);

                    if (oInfluenciador != null) {
                        //Login deu certo
                        HttpSession sessao = request.getSession(true);
                        //Determinar o tempo que ela fica aberta
                        sessao.setAttribute("influenciadorlogado", oInfluenciador);

                        //Carregar carrinho de compras
                        CarrinhoDAOImpl daocarrinho = new CarrinhoDAOImpl();
                        Carrinho oCarrinho = (Carrinho) daocarrinho.carregar(oInfluenciador.getIdInfluenciador());

                        if (oCarrinho != null) {
                            sessao.setAttribute("carrinho", oCarrinho);
                        } else {
                            //NEGOCIO DIFICIL - Criar o Carrinho
                            InfluenciadorDAOImpl daoinfluenciador = new InfluenciadorDAOImpl();
                            Influenciador oInfluenciador1 = new Influenciador();
                            oInfluenciador = (Influenciador) daoinfluenciador.carregar(oInfluenciador.getIdInfluenciador());
 
                            //Cadastrar o Carrinho
                            oCarrinho = new Carrinho();
                            oCarrinho.setoInfluenciador(oInfluenciador);
                            daocarrinho = new CarrinhoDAOImpl();

                            if (daocarrinho.cadastrar(oCarrinho)) {

                                daocarrinho = new CarrinhoDAOImpl();
                                oCarrinho = (Carrinho) daocarrinho.carregar(oInfluenciador.getIdInfluenciador());
                                sessao.setAttribute("carrinho", oCarrinho);

                            } else {
                                System.out.println("Erro ao cadastrar carrinho na sessao");
                            }

                        }

                        request.setAttribute("mensagem", "Seja Bem Vindo: " + oInfluenciador.getApelidoInfluenciador());
                        request.getRequestDispatcher("ListarProduto").forward(request, response);

                    } else {
                        //Login deu errado
                        request.setAttribute("mensagem", "Email ou senha Errada! ");
                        request.getRequestDispatcher("Influenciador/logininfluenciador.jsp").forward(request, response);
                    }
                } catch (Exception ex) {
                    System.out.println("Problemas ao logar Influencidor! \n ERRO: " + ex.getMessage());
                    ex.printStackTrace();
                }
            } else {
                request.setAttribute("mensagem", "Digite um email e uma senha porfavor");
                request.getRequestDispatcher("Influenciador/logininfluenciador.jsp").forward(request, response);
            }
        } else if (acao.equals("logout")) {
            HttpSession session = request.getSession(true);
            session.invalidate();
            response.sendRedirect("Influenciador/logininfluenciador.jsp");
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

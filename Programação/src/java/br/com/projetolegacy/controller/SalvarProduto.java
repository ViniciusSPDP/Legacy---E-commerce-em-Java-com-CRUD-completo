/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.projetolegacy.controller;

import br.com.projetolegacy.dao.ProdutoDAOImpl;
import br.com.projetolegacy.model.Campanha;
import br.com.projetolegacy.model.Carrinho;
import br.com.projetolegacy.model.Produto;
import br.com.projetolegacy.util.Upload;
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
 * @author Aluno
 */
@WebServlet(name = "SalvarProduto", urlPatterns = {"/SalvarProduto"})
public class SalvarProduto extends HttpServlet {

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

        String mensagem = "";
        Upload up = new Upload();

        //Caminho onde a foto ficara
        up.setFolderUpload("fotos");

        try {
            if (up.formProcess(getServletContext(), request)) {
                Produto oProduto = new Produto();

                //Recupera dados da JSP
                oProduto.setNomeProduto(up.getForm().get("nomeProduto").toString());
                oProduto.setDescricaoProduto(up.getForm().get("descricaoProduto").toString());
                oProduto.setFotoProduto(up.getFiles().get(0));
                oProduto.setFotoProduto1(up.getFiles().get(1));
                oProduto.setFotoProduto2(up.getFiles().get(2));
                oProduto.setTempousoProduto(up.getForm().get("tempousoProduto").toString());
                oProduto.setPrecoProduto(Double.parseDouble(up.getForm().get("precoProduto").toString()));

                //Chave estrangeira
                //oProduto.setCarrinho(new Carrinho(Integer.parseInt(up.getForm().get("idCarrinho").toString())));
                oProduto.setCampanha(new Campanha(Integer.parseInt(up.getForm().get("idCampanha").toString())));

                try {
                    ProdutoDAOImpl dao = new ProdutoDAOImpl();
                    if (up.getForm().get("idProduto").toString().equals("")) {
                        if (dao.cadastrar(oProduto)) {
                            mensagem = "O Produto cadastrado com sucesso";
                        } else {
                            mensagem = "Erro ao cadastrar Produto";
                        }
                    } else {
                        oProduto.setIdProduto(Integer.parseInt(up.getForm().get("idProduto").toString()));
                        if (dao.alterar(oProduto)) {
                            mensagem = "Produto alterado com Sucesso :D";
                        } else {
                            mensagem = "ERRO ao alterar Produto";
                        }
                    }
                    request.setAttribute("mensagem", mensagem);
                    
                    request.setAttribute("idCampanha", oProduto.getCampanha().getIdCampanha());
                    //request.getRequestDispatcher("DadosInstituicao").forward(request, response);
                    request.getRequestDispatcher("DadosProduto").forward(request, response);
                } catch (Exception ex) {
                    System.out.println("Problema no Servlet SalvarProduto \n ERRO: " + ex.getMessage());
                    ex.printStackTrace();
                }
            }
        }catch (Exception ex) {
            System.out.println("Erro de Upload \n ERRO: " + ex.getMessage());
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
                protected void doGet
                (HttpServletRequest request, HttpServletResponse response)
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
                protected void doPost
                (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                    processRequest(request, response);
                }

                /**
                 * Returns a short description of the servlet.
                 *
                 * @return a String containing servlet description
                 */
                @Override
                public String getServletInfo
        
        
        
        
            
                
                
                
                    () {
        return "Short description";
                }// </editor-fold>

            }

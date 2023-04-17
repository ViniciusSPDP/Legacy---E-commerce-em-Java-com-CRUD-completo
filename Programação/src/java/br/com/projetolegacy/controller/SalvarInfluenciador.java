/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.projetolegacy.controller;

import br.com.projetolegacy.dao.GenericDAO;
import br.com.projetolegacy.dao.InfluenciadorDAOImpl;
import br.com.projetolegacy.model.Influenciador;
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
@WebServlet(name = "SalvarInfluenciador", urlPatterns = {"/SalvarInfluenciador"})
public class SalvarInfluenciador extends HttpServlet {

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
                Influenciador oInfluenciador = new Influenciador();

                //Recupera dados da JSP
                oInfluenciador.setNomeInfluenciador(up.getForm().get("nomeInfluenciador").toString());
                oInfluenciador.setApelidoInfluenciador(up.getForm().get("apelidoInfluenciador").toString());
                oInfluenciador.setTelInfluenciador(up.getForm().get("telInfluenciador").toString());
                oInfluenciador.setInstaInfluenciador(up.getForm().get("instaInfluenciador").toString());
                oInfluenciador.setTkInfluenciador(up.getForm().get("tkInfluenciador").toString());
                oInfluenciador.setYtInfluenciador(up.getForm().get("ytInfluenciador").toString());
                oInfluenciador.setFaceInfluenciador(up.getForm().get("faceInfluenciador").toString());
                oInfluenciador.setCpfInfluenciador(up.getForm().get("cpfInfluenciador").toString());
                oInfluenciador.setEmailInfluenciador(up.getForm().get("emailInfluenciador").toString());
                oInfluenciador.setSenhaInfluenciador(up.getForm().get("senhaInfluenciador").toString());
                oInfluenciador.setCepInfluenciador(up.getForm().get("cepInfluenciador").toString());
                oInfluenciador.setRuaInfluenciador(up.getForm().get("ruaInfluenciador").toString());
                oInfluenciador.setNumInfluenciador(up.getForm().get("numInfluenciador").toString());
                oInfluenciador.setBairroInfluenciador(up.getForm().get("bairroInfluenciador").toString());
                oInfluenciador.setCidadeInfluenciador(up.getForm().get("cidadeInfluenciador").toString());
                oInfluenciador.setEstadoInfluenciador(up.getForm().get("estadoInfluenciador").toString());
                oInfluenciador.setFotoInfluenciador(up.getFiles().get(0));
                oInfluenciador.setDescricaoInfluenciador(up.getForm().get("descricaoInfluenciador").toString());

                try {
                    GenericDAO dao = new InfluenciadorDAOImpl();
                    if (up.getForm().get("idInfluenciador").toString().equals("")) {
                        if (dao.cadastrar(oInfluenciador)) {
                            mensagem = "Influenciador cadastrado com sucesso";
                        } else {
                            mensagem = "Erro ao cadastrar Influenciador";
                        }
                    } else {
                        oInfluenciador.setIdInfluenciador(Integer.parseInt(up.getForm().get("idInfluenciador").toString()));

                        if (dao.alterar(oInfluenciador)) {
                            mensagem = "Influenciador alterado com Sucesso :D";
                        } else {
                            mensagem = "ERRO ao alterar Influenciador";
                        }
                    }
                    request.setAttribute("mensagem", mensagem);
                    request.getRequestDispatcher("ListarInfluenciador").forward(request, response);
                    //request.getRequestDispatcher("Influenciador/gerenciarinfluenciador.jsp").forward(request, response);

                } catch (Exception ex) {
                    System.out.println("Problema no Servlet SalvarInfluenciador \n ERRO: " + ex.getMessage());
                    ex.printStackTrace();
                }
            }

        } catch (Exception ex) {
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projetolegacy.controller;

import br.com.projetolegacy.dao.InstituicaoDAOImpl;
import br.com.projetolegacy.model.Adm;
import br.com.projetolegacy.model.Instituicao;
import br.com.projetolegacy.util.Upload;
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
@WebServlet(name = "SalvarInstituicao", urlPatterns = {"/SalvarInstituicao"})
public class SalvarInstituicao extends HttpServlet {

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
                Instituicao oInstituicao = new Instituicao();

                //Recupera dados da JSP
                oInstituicao.setNomeInstituicao(up.getForm().get("nomeInstituicao").toString());
                oInstituicao.setFotoInstituicao(up.getFiles().get(0));
                oInstituicao.setTelInstituicao(up.getForm().get("telInstituicao").toString());
                oInstituicao.setCnpjInstituicao(up.getForm().get("cnpjInstituicao").toString());
                oInstituicao.setSenhaInstituicao(up.getForm().get("senhaInstituicao").toString());
                oInstituicao.setCepInstituicao(up.getForm().get("cepInstituicao").toString());
                oInstituicao.setRuaInstituicao(up.getForm().get("ruaInstituicao").toString());
                oInstituicao.setBairroInstituicao(up.getForm().get("bairroInstituicao").toString());
                oInstituicao.setCidadeInstituicao(up.getForm().get("cidadeInstituicao").toString());
                oInstituicao.setEstadoInstituicao(up.getForm().get("estadoInstituicao").toString());
                oInstituicao.setNumInstituicao(up.getForm().get("numInstituicao").toString());

                //Criar Construtor
                oInstituicao.setAdm(new Adm(Integer.parseInt(up.getForm().get("idAdm").toString())));

                try {
                    InstituicaoDAOImpl dao = new InstituicaoDAOImpl();
                    if (up.getForm().get("idInstituicao").toString().equals("")) {
                        if (dao.cadastrar(oInstituicao)) {
                            mensagem = "A Instituicao cadastrado com sucesso";
                        } else {
                            mensagem = "Erro ao cadastrar Instituicao";
                        }
                    } else {
                        oInstituicao.setIdInstituicao(Integer.parseInt(up.getForm().get("idInstituicao").toString()));
                        if (dao.alterar(oInstituicao)) {
                            mensagem = "Instituicao alterado com Sucesso :D";
                        } else {
                            mensagem = "ERRO ao alterar Instituicao";
                        }
                    }
                    request.setAttribute("mensagem", mensagem);
                    request.getRequestDispatcher("DadosInstituicao").forward(request, response);
                    //request.getRequestDispatcher("Instituicao/gerenciarinstituicao.jsp").forward(request, response);
                } catch (Exception ex) {
                    System.out.println("Problema no Servlet SalvarInstituicao \n ERRO: " + ex.getMessage());
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.dao;

import br.com.projetolegacy.model.Adm;
import br.com.projetolegacy.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Aluno
 */
public class AdmDAOImpl implements GenericDAO {

    Connection conn;

    public AdmDAOImpl() throws Exception {
        try {
            conn = ConnectionFactory.conexao();
            System.out.println("Conectado com Sucesso");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object object) {
        PreparedStatement stmt = null;
        Adm oAdm = (Adm) object;

        String sql = "insert into Adm ("
                + "nomeAdm, "
                + "loginAdm, "
                + "senhaAdm) "
                + "values(?,?,?);";

        try {
            //O stmt utilizou a conexão, preparou o sql
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, oAdm.getNomeAdm());
            stmt.setString(2, oAdm.getLoginAdm());
            stmt.setString(3, oAdm.getSenhaAdm());

            //Executa o SQL já com os parametros
            stmt.execute();
            return true;

        } catch (Exception ex) {
            System.out.println("Erro ao cadastrar AdmDAOImpl erroo: \n Erro:" + ex.getMessage());
            ex.printStackTrace();
            return false;
        } finally {//O finally sempre é executado, neste caso fecha a conexão
            try {
                ConnectionFactory.fechar(conn, stmt, null);//Fecha a conexão?
            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexao "
                        + "\n Erro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
    }

    @Override
    public List<Object> listar() {
        PreparedStatement stmt = null;
        //Manipula o SQL
        ResultSet rs = null;
        //Armazena os dados do SQL (dados de retorno)
        List<Object> resultado = new ArrayList<>();
        //Será utilizado para converter rs em list para ser exibido na JSP
        //SQL ira fazer a busca
        String sql = "select * from Adm;";

        try {
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                //vazio
                Adm oAdm = new Adm();

                oAdm.setIdAdm(rs.getInt("idAdm"));
                oAdm.setNomeAdm(rs.getString("nomeAdm"));
                oAdm.setLoginAdm(rs.getString("loginAdm"));
                oAdm.setSenhaAdm(rs.getString("senhaAdm"));

                resultado.add(oAdm);
            }
        } catch (SQLException ex) {
            System.out.println("Errooooo ao listarAdm !!!  " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);

            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do listar Adm " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return resultado;

    }

    @Override
    public void excluir(int idObject) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Object carregar(int idObject) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        Adm oAdm = new Adm();

        String sql = "SELECT * FROM Adm WHERE idAdm=?;";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idObject);
            rs = stmt.executeQuery();

            if (rs.next()) {

                oAdm.setIdAdm(rs.getInt("idAdm"));
                oAdm.setNomeAdm(rs.getString("nomeAdm"));
                oAdm.setLoginAdm(rs.getString("loginAdm"));
                oAdm.setSenhaAdm(rs.getString("senhaAdm"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao carregar Adm : " + ex.getMessage());
            ex.printStackTrace();

        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexão :" + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return oAdm;
    }

    @Override
    public Boolean alterar(Object object) {
        PreparedStatement stmt = null;
        Adm oAdm = (Adm) object;
        String sql = "UPDATE Adm SET nomeAdm=?, loginAdm=?, senhaAdm=? WHERE idAdm = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, oAdm.getNomeAdm());
            stmt.setString(2, oAdm.getLoginAdm());
            stmt.setString(3, oAdm.getSenhaAdm());
            stmt.setInt(4, oAdm.getIdAdm());

            stmt.executeUpdate();
            return true;
        } catch (Exception ex) {
            System.out.println("Erro alterarAdmDAOImpl \n Erro:" + ex.getMessage());
            ex.printStackTrace();
            return false;
        } finally {//O finally sempre é executado, neste caso fecha a conexão
            try {
                ConnectionFactory.fechar(conn, stmt, null);//Fecha a conexão?
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar parâmetros de conexão"
                        + "\n Erro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
    }
    
    //Login
    public Adm logarAdm(String login, String senha) {
        PreparedStatement stmt = null;
        Adm oAdm = null;
        ResultSet rs = null;

        String sql = "select * from Adm where loginAdm = ? and senhaAdm = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, login);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();

            if (rs.next()) {
                oAdm = new Adm();
                oAdm.setIdAdm(rs.getInt("idAdm"));
                oAdm.setLoginAdm(rs.getString("loginAdm"));
                oAdm.setSenhaAdm(rs.getString("senhaAdm"));
                oAdm.setNomeAdm(rs.getString("nomeAdm"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao LogarADMDAOImpl " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexão " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return oAdm;
    }

}

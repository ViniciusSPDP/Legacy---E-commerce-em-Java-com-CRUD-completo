/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.dao;

import br.com.projetolegacy.model.Influenciador;
import br.com.projetolegacy.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Aluno
 */
public class InfluenciadorDAOImpl implements GenericDAO {

    Connection conn;

    public InfluenciadorDAOImpl() throws Exception {
        //Conexão
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
        Influenciador oInfluenciador = (Influenciador) object;

        String sql = "insert into Influenciador ("
                + "nomeInfluenciador, "
                + "apelidoInfluenciador, "
                + "telInfluenciador, "
                + "instaInfluenciador, "
                + "tkInfluenciador, "
                + "ytInfluenciador, "
                + "faceInfluenciador, "
                + "cpfInfluenciador, "
                + "emailInfluenciador, "
                + "senhaInfluenciador, "
                + "cepInfluenciador, "
                + "ruaInfluenciador, "
                + "numInfluenciador, "
                + "bairroInfluenciador, "
                + "cidadeInfluenciador, "
                + "estadoInfluenciador, "
                + "fotoInfluenciador,"
                + "descricaoInfluenciador) "
                + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?);";

        try {
            //O stmt utilizou a conexão, preparou o sql
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, oInfluenciador.getNomeInfluenciador());
            stmt.setString(2, oInfluenciador.getApelidoInfluenciador());
            stmt.setString(3, oInfluenciador.getTelInfluenciador());
            stmt.setString(4, oInfluenciador.getInstaInfluenciador());
            stmt.setString(5, oInfluenciador.getTkInfluenciador());
            stmt.setString(6, oInfluenciador.getYtInfluenciador());
            stmt.setString(7, oInfluenciador.getFaceInfluenciador());
            stmt.setString(8, oInfluenciador.getCpfInfluenciador());
            stmt.setString(9, oInfluenciador.getEmailInfluenciador());
            stmt.setString(10, oInfluenciador.getSenhaInfluenciador());
            stmt.setString(11, oInfluenciador.getCepInfluenciador());
            stmt.setString(12, oInfluenciador.getRuaInfluenciador());
            stmt.setString(13, oInfluenciador.getNumInfluenciador());
            stmt.setString(14, oInfluenciador.getBairroInfluenciador());
            stmt.setString(15, oInfluenciador.getCidadeInfluenciador());
            stmt.setString(16, oInfluenciador.getEstadoInfluenciador());
            stmt.setString(17, oInfluenciador.getFotoInfluenciador());
            stmt.setString(18, oInfluenciador.getDescricaoInfluenciador());

            //Executa o SQL já com os parametros
            stmt.execute();
            return true;

        } catch (Exception ex) {
            System.out.println("Erro ao cadastrar InfluenciadorDAOImpl erroo: \n Erro:" + ex.getMessage());
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
        String sql = "select * from Influenciador";

        try {
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {

                Influenciador oInfluenciador = new Influenciador();

                oInfluenciador.setIdInfluenciador(rs.getInt("idInfluenciador"));
                oInfluenciador.setNomeInfluenciador(rs.getString("nomeInfluenciador"));
                oInfluenciador.setApelidoInfluenciador(rs.getString("apelidoInfluenciador"));
                oInfluenciador.setTelInfluenciador(rs.getString("telInfluenciador"));
                oInfluenciador.setDescricaoInfluenciador(rs.getString("descricaoInfluenciador"));
                oInfluenciador.setInstaInfluenciador(rs.getString("instaInfluenciador"));
                oInfluenciador.setTkInfluenciador(rs.getString("tkInfluenciador"));
                oInfluenciador.setYtInfluenciador(rs.getString("ytInfluenciador"));
                oInfluenciador.setFaceInfluenciador(rs.getString("faceInfluenciador"));
                oInfluenciador.setCpfInfluenciador(rs.getString("cpfInfluenciador"));
                oInfluenciador.setSenhaInfluenciador(rs.getString("senhaInfluenciador"));
                oInfluenciador.setFotoInfluenciador(rs.getString("fotoInfluenciador"));
                oInfluenciador.setEmailInfluenciador(rs.getString("emailInfluenciador"));
                oInfluenciador.setCepInfluenciador(rs.getString("cepInfluenciador"));
                oInfluenciador.setRuaInfluenciador(rs.getString("ruaInfluenciador"));
                oInfluenciador.setNumInfluenciador(rs.getString("numInfluenciador"));
                oInfluenciador.setBairroInfluenciador(rs.getString("bairroInfluenciador"));
                oInfluenciador.setEstadoInfluenciador(rs.getString("estadoInfluenciador"));
                oInfluenciador.setCidadeInfluenciador(rs.getString("cidadeInfluenciador"));

                resultado.add(oInfluenciador);

            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listarInfluenciador" + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);

            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexão do listar Influenciador " + ex.getMessage());
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
        Influenciador oInfluenciador = new Influenciador();

        String sql = "SELECT * FROM Influenciador WHERE idInfluenciador=?;";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idObject);
            rs = stmt.executeQuery();

            if (rs.next()) {
                oInfluenciador.setIdInfluenciador(rs.getInt("idInfluenciador"));
                oInfluenciador.setNomeInfluenciador(rs.getString("nomeInfluenciador"));
                oInfluenciador.setApelidoInfluenciador(rs.getString("apelidoInfluenciador"));
                oInfluenciador.setTelInfluenciador(rs.getString("telInfluenciador"));
                oInfluenciador.setDescricaoInfluenciador(rs.getString("descricaoInfluenciador"));
                oInfluenciador.setInstaInfluenciador(rs.getString("instaInfluenciador"));
                oInfluenciador.setTkInfluenciador(rs.getString("tkInfluenciador"));
                oInfluenciador.setYtInfluenciador(rs.getString("ytInfluenciador"));
                oInfluenciador.setFaceInfluenciador(rs.getString("faceInfluenciador"));
                oInfluenciador.setCpfInfluenciador(rs.getString("cpfInfluenciador"));
                oInfluenciador.setSenhaInfluenciador(rs.getString("senhaInfluenciador"));
                oInfluenciador.setFotoInfluenciador(rs.getString("fotoInfluenciador"));
                oInfluenciador.setEmailInfluenciador(rs.getString("emailInfluenciador"));
                oInfluenciador.setCepInfluenciador(rs.getString("cepInfluenciador"));
                oInfluenciador.setRuaInfluenciador(rs.getString("ruaInfluenciador"));
                oInfluenciador.setNumInfluenciador(rs.getString("numInfluenciador"));
                oInfluenciador.setBairroInfluenciador(rs.getString("bairroInfluenciador"));
                oInfluenciador.setEstadoInfluenciador(rs.getString("estadoInfluenciador"));
                oInfluenciador.setCidadeInfluenciador(rs.getString("cidadeInfluenciador"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao carregar Influenciador : " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexão :" + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return oInfluenciador;
    }

    @Override
    public Boolean alterar(Object object) {

        PreparedStatement stmt = null;
        Influenciador oInfluenciador = (Influenciador) object;
        String sql = "UPDATE Influenciador SET "
                + "nomeInfluenciador=?, "
                + "apelidoInfluenciador=?, "
                + "telInfluenciador=?, "
                + "instaInfluenciador=?, "
                + "tkInfluenciador=?, "
                + "ytInfluenciador=?, "
                + "faceInfluenciador=?, "
                + "cpfInfluenciador=?, "
                + "emailInfluenciador=?, "
                + "senhaInfluenciador=?, "
                + "cepInfluenciador=?, "
                + "ruaInfluenciador=?, "
                + "numInfluenciador=?, "
                + "bairroInfluenciador=?, "
                + "cidadeInfluenciador=?, "
                + "estadoInfluenciador=?, "
                + "fotoInfluenciador=?,"
                + "descricaoInfluenciador=? "
                + "WHERE idInfluenciador = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, oInfluenciador.getNomeInfluenciador());
            stmt.setString(2, oInfluenciador.getApelidoInfluenciador());
            stmt.setString(3, oInfluenciador.getTelInfluenciador());
            stmt.setString(4, oInfluenciador.getInstaInfluenciador());
            stmt.setString(5, oInfluenciador.getTkInfluenciador());
            stmt.setString(6, oInfluenciador.getYtInfluenciador());
            stmt.setString(7, oInfluenciador.getFaceInfluenciador());
            stmt.setString(8, oInfluenciador.getCpfInfluenciador());
            stmt.setString(9, oInfluenciador.getEmailInfluenciador());
            stmt.setString(10, oInfluenciador.getSenhaInfluenciador());
            stmt.setString(11, oInfluenciador.getCepInfluenciador());
            stmt.setString(12, oInfluenciador.getRuaInfluenciador());
            stmt.setString(13, oInfluenciador.getNumInfluenciador());
            stmt.setString(14, oInfluenciador.getBairroInfluenciador());
            stmt.setString(15, oInfluenciador.getCidadeInfluenciador());
            stmt.setString(16, oInfluenciador.getEstadoInfluenciador());
            stmt.setString(17, oInfluenciador.getFotoInfluenciador());
            stmt.setString(18, oInfluenciador.getDescricaoInfluenciador());
            stmt.setInt(19, oInfluenciador.getIdInfluenciador());

            stmt.executeUpdate();
            return true;

        } catch (Exception ex) {
            System.out.println("Erro alterarInfluenciadorDAOImpl \n Erro:" + ex.getMessage());
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
    public Influenciador logarInfluenciador(String email, String senha) {
        PreparedStatement stmt = null;
        Influenciador oInfluenciador = null;
        ResultSet rs = null;

        String sql = "select * from Influenciador where emailInfluenciador = ? and senhaInfluenciador = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();

            if (rs.next()) {
                oInfluenciador = new Influenciador();
                oInfluenciador.setIdInfluenciador(rs.getInt("idInfluenciador"));
                oInfluenciador.setEmailInfluenciador(rs.getString("emailInfluenciador"));
                oInfluenciador.setSenhaInfluenciador(rs.getString("senhaInfluenciador"));
                oInfluenciador.setNomeInfluenciador(rs.getString("nomeInfluenciador"));
                oInfluenciador.setFotoInfluenciador(rs.getString("fotoInfluenciador"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao LogarInfluencidaorDAOImpl " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexão " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return oInfluenciador;
    }
}

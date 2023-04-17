/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.dao;

import br.com.projetolegacy.model.Campanha;
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
public class CampanhaDAOImpl implements GenericDAO {

    Connection conn;

    public CampanhaDAOImpl() throws Exception {
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
        Campanha oCampanha = (Campanha) object;

        String sql = "Insert into campanha (nomecampanha, descricaocampanha, idinfluenciador)"
                + "values(?,?,?)";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, oCampanha.getNomeCampanha());
            stmt.setString(2, oCampanha.getDescricaoCampanha());
            stmt.setInt(3, oCampanha.getInfluenciador().getIdInfluenciador());

            stmt.execute();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao cadastrar Campanha ERRO: " + ex.getMessage());
            ex.printStackTrace();
            return false;
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, null);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar Conexão");
                ex.printStackTrace();
            }
        }
    }

    @Override
    public List<Object> listar() {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        List<Object> resultado = new ArrayList();
        Campanha oCampanha = null;
        Influenciador oInfluenciador = null;

        String sql = "SELECT c.idCampanha, c.nomeCampanha, c.descricaoCampanha, "
                + "i.idInfluenciador, i.nomeInfluenciador "
                + "from campanha c, influenciador i "
                + "where c.idInfluenciador = i.idInfluenciador";

        try {
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                oCampanha = new Campanha();
                oCampanha.setIdCampanha(rs.getInt("idCampanha"));
                oCampanha.setNomeCampanha(rs.getString("nomeCampanha"));
                oCampanha.setDescricaoCampanha(rs.getString("descricaoCampanha"));

                oInfluenciador = new Influenciador();
                oInfluenciador.setIdInfluenciador(rs.getInt("idInfluenciador"));
                oInfluenciador.setNomeInfluenciador(rs.getString("nomeInfluenciador"));

                oCampanha.setInfluenciador(oInfluenciador);

                resultado.add(oInfluenciador);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listarCampanha  " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do listar CampanhaErro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return resultado;
    }

    public List<Object> listarCampanhaInfluenciador(Integer idInfluenciador) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        List<Object> resultado = new ArrayList();
        Campanha oCampanha = null;
        Influenciador oInfluenciador = null;

        String sql = "SELECT c.idCampanha, c.nomeCampanha, c.descricaoCampanha, "
                + "i.idInfluenciador, i.nomeInfluenciador "
                + "from campanha c, influenciador i "
                + "where c.idInfluenciador = i.idInfluenciador "
                + "and c.idInfluenciador = ?";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idInfluenciador);
            rs = stmt.executeQuery();
            while (rs.next()) {
                oCampanha = new Campanha();
                oCampanha.setIdCampanha(rs.getInt("idCampanha"));
                oCampanha.setNomeCampanha(rs.getString("nomeCampanha"));
                oCampanha.setDescricaoCampanha(rs.getString("descricaoCampanha"));

                oInfluenciador = new Influenciador();
                oInfluenciador.setIdInfluenciador(rs.getInt("idInfluenciador"));
                oInfluenciador.setNomeInfluenciador(rs.getString("nomeInfluenciador"));

                oCampanha.setInfluenciador(oInfluenciador);

                resultado.add(oCampanha);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listarCampanha  " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do listar CampanhaErro: " + ex.getMessage());
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
        Campanha oCampanha = null;
        Influenciador oInfluenciador = null;

        String sql = "SELECT c.idCampanha, c.nomeCampanha, c.descricaoCampanha, "
                + "i.idInfluenciador, i.nomeInfluenciador "
                + "from Campanha c, Influenciador i "
                + "where c.idInfluenciador = i.idInfluenciador "
                + "and c.idCampanha = ?";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idObject);
            rs = stmt.executeQuery();
            if (rs.next()) {

                oCampanha = new Campanha();
                oCampanha.setIdCampanha(rs.getInt("idCampanha"));
                oCampanha.setNomeCampanha(rs.getString("nomeCampanha"));
                oCampanha.setDescricaoCampanha(rs.getString("descricaoCampanha"));

                oInfluenciador = new Influenciador();
                oInfluenciador.setIdInfluenciador(rs.getInt("idInfluenciador"));
                oInfluenciador.setNomeInfluenciador(rs.getString("nomeInfluenciador"));

                oCampanha.setInfluenciador(oInfluenciador);

            }
        } catch (SQLException ex) {
            System.out.println("Erro ao CarregarCampanha " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);

            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do carregar Campanha Erro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return oCampanha;

    }

    @Override
    public Boolean alterar(Object object) {

        PreparedStatement stmt = null;
        Campanha oCampanha = (Campanha) object;
        String sql = "UPDATE Campanha SET "
                + "nomecampanha=?, "
                + "descricaocampanha=? "
                + "WHERE idCampanha = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, oCampanha.getNomeCampanha());
            stmt.setString(2, oCampanha.getDescricaoCampanha());          
            stmt.setInt(3, oCampanha.getIdCampanha());

            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro alterarCampanhaDAOImpl \n Erro:" + ex.getMessage());
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

}

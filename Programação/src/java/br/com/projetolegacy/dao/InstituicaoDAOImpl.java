/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.dao;

import br.com.projetolegacy.model.Adm;
import br.com.projetolegacy.model.Instituicao;
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
public class InstituicaoDAOImpl implements GenericDAO {

    Connection conn;

    public InstituicaoDAOImpl() throws Exception {
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
        Instituicao oInstituicao = (Instituicao) object;

        String sql = "Insert into Instituicao "
                + "(statusInstituicao, "
                + "nomeInstituicao, "
                + "fotoInstituicao, "
                + "telInstituicao, "
                + "cnpjInstituicao, "
                + "senhaInstituicao, "
                + "cepInstituicao, "
                + "ruaInstituicao, "
                + "bairroInstituicao, "
                + "cidadeInstituicao, "
                + "estadoInstituicao, "
                + "numInstituicao, "
                + "idAdm)"
                + "values(?,?,?,?,?,?,?,?,?,?,?,?,?);";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "A");
            stmt.setString(2, oInstituicao.getNomeInstituicao());
            stmt.setString(3, oInstituicao.getFotoInstituicao());
            stmt.setString(4, oInstituicao.getTelInstituicao());
            stmt.setString(5, oInstituicao.getCnpjInstituicao());
            stmt.setString(6, oInstituicao.getSenhaInstituicao());
            stmt.setString(7, oInstituicao.getCepInstituicao());
            stmt.setString(8, oInstituicao.getRuaInstituicao());
            stmt.setString(9, oInstituicao.getBairroInstituicao());
            stmt.setString(10, oInstituicao.getCidadeInstituicao());
            stmt.setString(11, oInstituicao.getEstadoInstituicao());
            stmt.setString(12, oInstituicao.getNumInstituicao());

            //Chave Estrangeira
            stmt.setInt(13, oInstituicao.getAdm().getIdAdm());

            stmt.execute();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao cadastrar Instituicao ERRO: " + ex.getMessage());
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

    public Boolean preCadastrar(Object object) {

        PreparedStatement stmt = null;
        Instituicao oInstituicao = (Instituicao) object;

        String sql = "Insert into Instituicao "
                + "(statusInstituicao, "
                + "nomeInstituicao, "
                + "fotoInstituicao, "
                + "telInstituicao, "
                + "cnpjInstituicao, "
                + "senhaInstituicao, "
                + "cepInstituicao, "
                + "ruaInstituicao, "
                + "bairroInstituicao, "
                + "cidadeInstituicao, "
                + "estadoInstituicao, "
                + "numInstituicao)"
                + "values(?,?,?,?,?,?,?,?,?,?,?,?);";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "P");
            stmt.setString(2, oInstituicao.getNomeInstituicao());
            stmt.setString(3, oInstituicao.getFotoInstituicao());
            stmt.setString(4, oInstituicao.getTelInstituicao());
            stmt.setString(5, oInstituicao.getCnpjInstituicao());
            stmt.setString(6, oInstituicao.getSenhaInstituicao());
            stmt.setString(7, oInstituicao.getCepInstituicao());
            stmt.setString(8, oInstituicao.getRuaInstituicao());
            stmt.setString(9, oInstituicao.getBairroInstituicao());
            stmt.setString(10, oInstituicao.getCidadeInstituicao());
            stmt.setString(11, oInstituicao.getEstadoInstituicao());
            stmt.setString(12, oInstituicao.getNumInstituicao());

            stmt.execute();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao cadastrar Instituicao ERRO: " + ex.getMessage());
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
        Instituicao oInstituicao = null;
        Adm oAdm = null;

        String sql = "SELECT i.idInstituicao, i.statusInstituicao, i.nomeInstituicao, "
                + "i.fotoInstituicao, i.telInstituicao,  i.cnpjInstituicao, i.senhaInstituicao, i.cepInstituicao, "
                + "i.ruaInstituicao, i.bairroInstituicao, i.cidadeInstituicao, i.estadoInstituicao, "
                + "i.numInstituicao, a.idAdm, a.nomeAdm "
                + "from Instituicao i, Adm a "
                + "where a.idAdm = i.idAdm "
                + "and i.statusInstituicao = 'A'";

        try {
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                oInstituicao = new Instituicao();
                oInstituicao.setIdInstituicao(rs.getInt("idInstituicao"));
                oInstituicao.setStatusInstituicao(rs.getString("statusInstituicao"));
                oInstituicao.setNomeInstituicao(rs.getString("nomeInstituicao"));
                oInstituicao.setFotoInstituicao(rs.getString("fotoInstituicao"));
                oInstituicao.setTelInstituicao(rs.getString("telInstituicao"));
                oInstituicao.setCnpjInstituicao(rs.getString("cnpjInstituicao"));
                oInstituicao.setSenhaInstituicao(rs.getString("senhaInstituicao"));
                oInstituicao.setCepInstituicao(rs.getString("cepInstituicao"));
                oInstituicao.setRuaInstituicao(rs.getString("ruaInstituicao"));
                oInstituicao.setBairroInstituicao(rs.getString("bairroInstituicao"));
                oInstituicao.setCidadeInstituicao(rs.getString("cidadeInstituicao"));
                oInstituicao.setEstadoInstituicao(rs.getString("estadoInstituicao"));
                oInstituicao.setNumInstituicao(rs.getString("numInstituicao"));

                resultado.add(oInstituicao);
            }
        } catch (SQLException ex) {
            System.out.println("Errooooo ao listar Instituicao !!!  " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);

            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do listar InstituicaoErro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return resultado;
    }

    public List<Object> preCadastrolistar() {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        List<Object> resultado = new ArrayList();
        Instituicao oInstituicao = null;
        Adm oAdm = null;

        String sql = "SELECT i.idInstituicao, i.statusInstituicao, i.nomeInstituicao, "
                + "i.fotoInstituicao, i.telInstituicao,  i.cnpjInstituicao, i.senhaInstituicao, i.cepInstituicao, "
                + "i.ruaInstituicao, i.bairroInstituicao, i.cidadeInstituicao, i.estadoInstituicao, "
                + "i.numInstituicao "
                + "from Instituicao i "
                + "where i.statusInstituicao = 'P'; ";

        try {
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                oInstituicao = new Instituicao();
                oInstituicao.setIdInstituicao(rs.getInt("idInstituicao"));
                oInstituicao.setStatusInstituicao(rs.getString("statusInstituicao"));
                oInstituicao.setNomeInstituicao(rs.getString("nomeInstituicao"));
                oInstituicao.setFotoInstituicao(rs.getString("fotoInstituicao"));
                oInstituicao.setTelInstituicao(rs.getString("telInstituicao"));
                oInstituicao.setCnpjInstituicao(rs.getString("cnpjInstituicao"));
                oInstituicao.setSenhaInstituicao(rs.getString("senhaInstituicao"));
                oInstituicao.setCepInstituicao(rs.getString("cepInstituicao"));
                oInstituicao.setRuaInstituicao(rs.getString("ruaInstituicao"));
                oInstituicao.setBairroInstituicao(rs.getString("bairroInstituicao"));
                oInstituicao.setCidadeInstituicao(rs.getString("cidadeInstituicao"));
                oInstituicao.setEstadoInstituicao(rs.getString("estadoInstituicao"));
                oInstituicao.setNumInstituicao(rs.getString("numInstituicao"));

                //Atribui o adm a instituicao
                resultado.add(oInstituicao);
            }
        } catch (SQLException ex) {
            System.out.println("Errooooo ao listar Instituicao !!!  " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);

            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do listar InstituicaoErro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return resultado;
    }

    public List<Object> listarInstituicaoCampanha(Integer idCampanha) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        List<Object> resultado = new ArrayList();
        Instituicao oInstituicao = null;
        Adm oAdm = null;

        String sql = "SELECT i.idInstituicao, i.statusInstituicao, i.nomeInstituicao, "
                + "i.fotoInstituicao, i.telInstituicao,  i.cnpjInstituicao, i.senhaInstituicao, i.cepInstituicao, "
                + "i.ruaInstituicao, i.bairroInstituicao, i.cidadeInstituicao, i.estadoInstituicao, "
                + "i.numInstituicao, a.idAdm, a.nomeAdm "
                + "from Instituicao i, Adm a, doacao d, campanha c "
                + "where a.idAdm = i.idAdm "
                + "and c.idCampanha = d.idCampanha "
                + "and i.idInstituicao = d.idInstituicao "
                + "and c.idCampanha = ?";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCampanha);
            rs = stmt.executeQuery();
            while (rs.next()) {
                oInstituicao = new Instituicao();
                oInstituicao.setIdInstituicao(rs.getInt("idInstituicao"));
                oInstituicao.setStatusInstituicao(rs.getString("statusInstituicao"));
                oInstituicao.setNomeInstituicao(rs.getString("nomeInstituicao"));
                oInstituicao.setFotoInstituicao(rs.getString("fotoInstituicao"));
                oInstituicao.setTelInstituicao(rs.getString("telInstituicao"));
                oInstituicao.setCnpjInstituicao(rs.getString("cnpjInstituicao"));
                oInstituicao.setSenhaInstituicao(rs.getString("senhaInstituicao"));
                oInstituicao.setCepInstituicao(rs.getString("cepInstituicao"));
                oInstituicao.setRuaInstituicao(rs.getString("ruaInstituicao"));
                oInstituicao.setBairroInstituicao(rs.getString("bairroInstituicao"));
                oInstituicao.setCidadeInstituicao(rs.getString("cidadeInstituicao"));
                oInstituicao.setEstadoInstituicao(rs.getString("estadoInstituicao"));
                oInstituicao.setNumInstituicao(rs.getString("numInstituicao"));

                //Instanciar o ADM
                oAdm = new Adm();
                oAdm.setIdAdm(rs.getInt("idAdm"));
                oAdm.setNomeAdm(rs.getString("nomeAdm"));

                //Atribui o adm a instituicao
                oInstituicao.setAdm(oAdm);

                resultado.add(oInstituicao);
            }
        } catch (SQLException ex) {
            System.out.println("Errooooo ao listar Instituicao !!!  " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);

            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do listar InstituicaoErro: " + ex.getMessage());
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
        Instituicao oInstituicao = null;
        Adm oAdm = null;

        String sql = "SELECT i.idInstituicao, i.statusInstituicao, i.nomeInstituicao, "
                + "i.fotoInstituicao, i.telInstituicao ,i.cnpjInstituicao, i.senhaInstituicao, i.cepInstituicao, "
                + "i.ruaInstituicao, i.bairroInstituicao, i.cidadeInstituicao, i.estadoInstituicao, "
                + "i.numInstituicao, a.idAdm, a.nomeAdm "
                + "from Instituicao i, Adm a "
                + "where a.idAdm = i.idAdm "
                + "and i.idInstituicao = ?";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idObject);
            rs = stmt.executeQuery();
            if (rs.next()) {

                oInstituicao = new Instituicao();
                oInstituicao.setIdInstituicao(rs.getInt("idInstituicao"));
                oInstituicao.setStatusInstituicao(rs.getString("statusInstituicao"));
                oInstituicao.setNomeInstituicao(rs.getString("nomeInstituicao"));
                oInstituicao.setFotoInstituicao(rs.getString("fotoInstituicao"));
                oInstituicao.setTelInstituicao(rs.getString("telInstituicao"));
                oInstituicao.setCnpjInstituicao(rs.getString("cnpjInstituicao"));
                oInstituicao.setSenhaInstituicao(rs.getString("senhaInstituicao"));
                oInstituicao.setCepInstituicao(rs.getString("cepInstituicao"));
                oInstituicao.setRuaInstituicao(rs.getString("ruaInstituicao"));
                oInstituicao.setBairroInstituicao(rs.getString("bairroInstituicao"));
                oInstituicao.setCidadeInstituicao(rs.getString("cidadeInstituicao"));
                oInstituicao.setEstadoInstituicao(rs.getString("estadoInstituicao"));
                oInstituicao.setNumInstituicao(rs.getString("numInstituicao"));

                //Instanciar o ADM
                oAdm = new Adm();
                oAdm.setIdAdm(rs.getInt("idAdm"));
                oAdm.setNomeAdm(rs.getString("nomeAdm"));

                //Atribui o adm a instituicao
                oInstituicao.setAdm(oAdm);
            }
        } catch (SQLException ex) {
            System.out.println("Errooooo ao CarregarInstituicao !!!  " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);

            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do carregar ProdutoErro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return oInstituicao;
    }

    @Override
    public Boolean alterar(Object object) {
        PreparedStatement stmt = null;
        Instituicao oInstituicao = (Instituicao) object;
        String sql = "UPDATE Instituicao SET "
                + "statusInstituicao=?, "
                + "nomeInstituicao=?, "
                + "fotoInstituicao=?, "
                + "telInstituicao=?, "
                + "cnpjInstituicao=?, "
                + "senhaInstituicao=?, "
                + "cepInstituicao=?, "
                + "ruaInstituicao=?, "
                + "bairroInstituicao=?, "
                + "cidadeInstituicao=?, "
                + "estadoInstituicao=?, "
                + "numInstituicao=?, "
                + "idAdm=? "
                + "WHERE idInstituicao = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, oInstituicao.getStatusInstituicao());
            stmt.setString(2, oInstituicao.getNomeInstituicao());
            stmt.setString(3, oInstituicao.getFotoInstituicao());
            stmt.setString(4, oInstituicao.getTelInstituicao());
            stmt.setString(5, oInstituicao.getCnpjInstituicao());
            stmt.setString(6, oInstituicao.getSenhaInstituicao());
            stmt.setString(7, oInstituicao.getCepInstituicao());
            stmt.setString(8, oInstituicao.getRuaInstituicao());
            stmt.setString(9, oInstituicao.getBairroInstituicao());
            stmt.setString(10, oInstituicao.getCidadeInstituicao());
            stmt.setString(11, oInstituicao.getEstadoInstituicao());
            stmt.setString(12, oInstituicao.getNumInstituicao());

            //Chave Estrangeira
            stmt.setInt(13, oInstituicao.getAdm().getIdAdm());

            stmt.setInt(14, oInstituicao.getIdInstituicao());

            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro alterarInstituicaoDAOImpl \n Erro:" + ex.getMessage());
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

    public Boolean aprovarInstituicao(Object object) {
        PreparedStatement stmt = null;
        Instituicao oInstituicao = (Instituicao) object;
        String sql = "UPDATE Instituicao SET "
                + "statusInstituicao=?, "
                + "idAdm=? "
                + "WHERE idInstituicao = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "A");

            //Chave Estrangeira
            stmt.setInt(2, oInstituicao.getAdm().getIdAdm());

            stmt.setInt(3, oInstituicao.getIdInstituicao());

            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro alterarInstituicaoDAOImpl \n Erro:" + ex.getMessage());
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

    public Instituicao logarInstituicao(String cnpj, String senha) {
        PreparedStatement stmt = null;
        Instituicao oInstituicao = null;
        ResultSet rs = null;

        String sql = "select * from Instituicao where cnpjInstituicao = ? and senhaInstituicao = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cnpj);
            stmt.setString(2, senha);

            rs = stmt.executeQuery();

            if (rs.next()) {
                oInstituicao = new Instituicao();
                oInstituicao.setIdInstituicao(rs.getInt("idInstituicao"));
                oInstituicao.setCnpjInstituicao(rs.getString("cnpjInstituicao"));
                oInstituicao.setSenhaInstituicao(rs.getString("senhaInstituicao"));
                oInstituicao.setNomeInstituicao(rs.getString("nomeInstituicao"));
                oInstituicao.setStatusInstituicao(rs.getString("statusInstituicao"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro ao LogarInstituicaoDAOImpl " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexão " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return oInstituicao;
    }

}

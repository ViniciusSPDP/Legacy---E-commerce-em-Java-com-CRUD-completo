/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projetolegacy.dao;

import br.com.projetolegacy.model.Campanha;
import br.com.projetolegacy.model.Doacao;
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
 * @author Vinicius
 */
public class DoacaoDAOImpl implements GenericDAO {

    Connection conn;

    public DoacaoDAOImpl() throws Exception {
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
        Doacao oDoacao = (Doacao) object;

        String sql = "Insert into Doacao "
                + "(porcentagemDoacao, "
                + "idInstituicao, "
                + "idCampanha) "
                + "values(?,?,?);";

        try {
            stmt = conn.prepareStatement(sql);

            stmt.setDouble(1, oDoacao.getPorcentagemDoacao());
            //Chave estrangeira
            stmt.setInt(2, oDoacao.getInstituicao().getIdInstituicao());
            stmt.setInt(3, oDoacao.getCampanha().getIdCampanha());

            stmt.execute();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao cadastrar Doacao ERRO: " + ex.getMessage());
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<Object> listarDoacaoCampanha(Integer idCampanha) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        List<Object> resultado = new ArrayList();
        Instituicao oInstituicao = null;
        Campanha oCampanha = null;
        Doacao oDoacao = null;

        String sql = "SELECT i.idInstituicao, c.idCampanha, i.nomeInstituicao, i.fotoInstituicao, "
                + "d.porcentagemDoacao, d.totaldoadoDoacao "
                + "from Doacao d, Instituicao i, Campanha c "
                + "where d.idInstituicao = i.idInstituicao "
                + "and d.idCampanha = c.idCampanha "
                + "and d.idCampanha=?";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCampanha);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oDoacao = new Doacao();

                oInstituicao = new Instituicao();
                oInstituicao.setIdInstituicao(rs.getInt("idInstituicao"));
                oInstituicao.setNomeInstituicao(rs.getString("nomeInstituicao"));
                oInstituicao.setFotoInstituicao(rs.getString("fotoInstituicao"));

                oCampanha = new Campanha();
                oCampanha.setIdCampanha(rs.getInt("idCampanha"));

                oDoacao.setPorcentagemDoacao(rs.getDouble("porcentagemDoacao"));
                oDoacao.setTotaldoadoDoacao(rs.getDouble("totaldoadoDoacao"));

                oDoacao.setCampanha(oCampanha);
                oDoacao.setInstituicao(oInstituicao);
                resultado.add(oDoacao);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listarDoacao  " + ex.getMessage());
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
    public void excluir(int idObject
    ) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object carregar(int idObject
    ) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Boolean alterar(Object object
    ) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.dao;

import br.com.projetolegacy.model.Campanha;
import br.com.projetolegacy.model.Carrinho;
import br.com.projetolegacy.model.Doacao;
import br.com.projetolegacy.model.Influenciador;
import br.com.projetolegacy.model.Instituicao;
import br.com.projetolegacy.model.Produto;
import br.com.projetolegacy.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Aluno
 */
public class ProdutoDAOImpl implements GenericDAO {

    Connection conn;

    public ProdutoDAOImpl() throws Exception {
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
        Produto oProduto = (Produto) object;

        String sql = "Insert into produto "
                + "(nomeproduto, "
                + "descricaoProduto, "
                + "fotoProduto, "
                + "fotoProduto1, "
                + "fotoProduto2, "
                + "tempousoProduto, "
                + "precoProduto, "
                + "statusProduto, "
                + "idCampanha) "
                + "values(?,?,?,?,?,?,?,?,?)";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, oProduto.getNomeProduto());
            stmt.setString(2, oProduto.getDescricaoProduto());
            stmt.setString(3, oProduto.getFotoProduto());
            stmt.setString(4, oProduto.getFotoProduto1());
            stmt.setString(5, oProduto.getFotoProduto2());
            stmt.setString(6, oProduto.getTempousoProduto());
            stmt.setDouble(7, oProduto.getPrecoProduto());
            stmt.setString(8, "A");

            //Chave estrangeira
            stmt.setInt(9, oProduto.getCampanha().getIdCampanha());

            stmt.execute();
            return true;

        } catch (Exception ex) {
            System.out.println("Erro ao cadastrar Produto ERRO: " + ex.getMessage());
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
        Produto oProduto = null;
        Campanha oCampanha = null;

        String sql = "SELECT  p.idProduto, p.nomeProduto, p.descricaoProduto, "
                + "p.precoProduto, p.tempousoProduto, p.fotoProduto, "
                + "p.fotoProduto1, p.fotoProduto2, c.idCampanha, c.nomeCampanha "
                + "FROM Produto p, Campanha c "
                + "WHERE p.idCampanha = c.idCampanha "
                + "AND p.statusProduto = 'A' "
                + "order by p.idProduto desc "
                + "limit 4;";

        try {
            stmt = conn.prepareStatement(sql);
            // stmt.setInt(1, idCampanha);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oProduto = new Produto();
                oProduto.setIdProduto(rs.getInt("idProduto"));
                oProduto.setNomeProduto(rs.getString("nomeProduto"));
                oProduto.setDescricaoProduto(rs.getString("descricaoProduto"));
                oProduto.setPrecoProduto(rs.getDouble("precoProduto"));
                oProduto.setTempousoProduto(rs.getString("tempousoProduto"));
                oProduto.setFotoProduto(rs.getString("fotoProduto"));
                oProduto.setFotoProduto1(rs.getString("fotoProduto1"));
                oProduto.setFotoProduto2(rs.getString("fotoProduto2"));

                oCampanha = new Campanha();
                oCampanha.setIdCampanha(rs.getInt("idCampanha"));
                oCampanha.setNomeCampanha(rs.getString("nomeCampanha"));

                oProduto.setCampanha(oCampanha);
                resultado.add(oProduto);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listarProduto  " + ex.getMessage());
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

    public List<Object> listarProdutoPerfil(Integer idInfluenciador) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        List<Object> resultado = new ArrayList();
        Produto oProduto = null;
        Campanha oCampanha = null;
        Influenciador oInfluenciador = null;

        String sql = "SELECT p.idProduto, p.nomeProduto, p.descricaoProduto, "
                + "p.precoProduto, p.tempousoProduto, p.fotoProduto, "
                + "p.fotoProduto1, p.fotoProduto2, c.idCampanha, c.nomeCampanha, i.idInfluenciador "
                + "FROM Produto p, Campanha c, Influenciador i "
                + "WHERE p.idCampanha = c.idCampanha "
                + "AND c.idInfluenciador = i.idInfluenciador "
                + "AND p.statusProduto = 'A' "
                + "AND c.idInfluenciador =?";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idInfluenciador);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oProduto = new Produto();
                oProduto.setIdProduto(rs.getInt("idProduto"));
                oProduto.setNomeProduto(rs.getString("nomeProduto"));
                oProduto.setDescricaoProduto(rs.getString("descricaoProduto"));
                oProduto.setPrecoProduto(rs.getDouble("precoProduto"));
                oProduto.setTempousoProduto(rs.getString("tempousoProduto"));
                oProduto.setFotoProduto(rs.getString("fotoProduto"));
                oProduto.setFotoProduto1(rs.getString("fotoProduto1"));
                oProduto.setFotoProduto2(rs.getString("fotoProduto2"));

                oCampanha = new Campanha();
                oCampanha.setIdCampanha(rs.getInt("idCampanha"));
                oCampanha.setNomeCampanha(rs.getString("nomeCampanha"));

                oProduto.setCampanha(oCampanha);
                resultado.add(oProduto);

            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listarprodutoinfluenciador  " + ex.getMessage());
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

    public List<Object> listarloja() {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        List<Object> resultado = new ArrayList();
        Produto oProduto = null;
        Campanha oCampanha = null;

        String sql = "SELECT  p.idProduto, p.nomeProduto, p.descricaoProduto, "
                + "p.precoProduto, p.tempousoProduto, p.fotoProduto, "
                + "p.fotoProduto1, p.fotoProduto2, c.idCampanha, c.nomeCampanha "
                + "FROM Produto p, Campanha c "
                + "WHERE p.idCampanha = c.idCampanha "
                + "AND p.statusProduto = 'A';";

        try {
            stmt = conn.prepareStatement(sql);
            // stmt.setInt(1, idCampanha);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oProduto = new Produto();
                oProduto.setIdProduto(rs.getInt("idProduto"));
                oProduto.setNomeProduto(rs.getString("nomeProduto"));
                oProduto.setDescricaoProduto(rs.getString("descricaoProduto"));
                oProduto.setPrecoProduto(rs.getDouble("precoProduto"));
                oProduto.setTempousoProduto(rs.getString("tempousoProduto"));
                oProduto.setFotoProduto(rs.getString("fotoProduto"));
                oProduto.setFotoProduto1(rs.getString("fotoProduto1"));
                oProduto.setFotoProduto2(rs.getString("fotoProduto2"));

                oCampanha = new Campanha();
                oCampanha.setIdCampanha(rs.getInt("idCampanha"));
                oCampanha.setNomeCampanha(rs.getString("nomeCampanha"));

                oProduto.setCampanha(oCampanha);
                resultado.add(oProduto);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listarProduto  " + ex.getMessage());
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

    public List<Object> listarProdutoCampanha(Integer idCampanha) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        List<Object> resultado = new ArrayList();
        Produto oProduto = null;
        Campanha oCampanha = null;

        String sql = "SELECT p.idProduto, p.nomeProduto, p.descricaoProduto, "
                + "p.precoProduto, p.tempousoProduto, p.fotoProduto, "
                + "p.fotoProduto1, p.fotoProduto2, c.idCampanha, c.nomeCampanha "
                + "FROM Produto p, Campanha c "
                + "WHERE p.idCampanha = c.idCampanha "
                + "AND c.idCampanha = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCampanha);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oProduto = new Produto();
                oProduto.setIdProduto(rs.getInt("idProduto"));
                oProduto.setNomeProduto(rs.getString("nomeProduto"));
                oProduto.setDescricaoProduto(rs.getString("descricaoProduto"));
                oProduto.setPrecoProduto(rs.getDouble("precoProduto"));
                oProduto.setTempousoProduto(rs.getString("tempousoProduto"));
                oProduto.setFotoProduto(rs.getString("fotoProduto"));
                oProduto.setFotoProduto1(rs.getString("fotoProduto1"));
                oProduto.setFotoProduto2(rs.getString("fotoProduto2"));

                oCampanha = new Campanha();
                oCampanha.setIdCampanha(rs.getInt("idCampanha"));
                oCampanha.setNomeCampanha(rs.getString("nomeCampanha"));

                oProduto.setCampanha(oCampanha);
                resultado.add(oProduto);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listarProdutoCampanha  " + ex.getMessage());
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

    public List<Object> listarProdutoCarrinho(Integer idCarrinho) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        List<Object> resultado = new ArrayList();
        Produto oProduto = null;
        Carrinho oCarrinho = null;
        Campanha oCampanha = null;

        String sql = "SELECT p.idProduto, p.nomeProduto, "
                + "p.precoProduto, p.tempousoProduto, p.fotoProduto, "
                + "c.idCampanha, c.nomeCampanha, ca.idCarrinho "
                + "FROM Produto p, Campanha c, Carrinho ca "
                + "WHERE p.idCampanha = c.idCampanha "
                + "and p.idCarrinho = ca.idCarrinho "
                + "AND ca.idCarrinho = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCarrinho);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oProduto = new Produto();
                oProduto.setIdProduto(rs.getInt("idProduto"));
                oProduto.setNomeProduto(rs.getString("nomeProduto"));
                oProduto.setPrecoProduto(rs.getDouble("precoProduto"));
                oProduto.setTempousoProduto(rs.getString("tempousoProduto"));
                oProduto.setFotoProduto(rs.getString("fotoProduto"));

                oCampanha = new Campanha();
                oCampanha.setIdCampanha(rs.getInt("idCampanha"));
                oCampanha.setNomeCampanha(rs.getString("nomeCampanha"));

                oCarrinho = new Carrinho();
                oCarrinho.setIdCarrinho(rs.getInt("idCarrinho"));

                oProduto.setCampanha(oCampanha);
                oProduto.setCarrinho(oCarrinho);
                resultado.add(oProduto);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listarProdutoCarrinho  " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do listarProdutoCarrinhoErro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return resultado;
    }

    public List<Object> listarTotalCampanhaCarrinho(Integer idCarrinho) {
        ResultSet rs = null;
        ResultSet rs2 = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        List<Object> resultado = new ArrayList();
        Doacao oDoacao = null;
        Instituicao oInstituicao = null;
        Campanha oCampanha = null;

        String sql = "select SUM(p.precoProduto) totalcampanha, p.idCampanha "
                + "from produto p,  Carrinho c "
                + "where p.idcarrinho = c.idcarrinho "
                + "AND c.idCarrinho = ? "
                + "group by p.idCampanha; ";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCarrinho);
            rs = stmt.executeQuery();

            while (rs.next()) {

                String sql2 = "select porcentagemdoacao, nomecampanha, nomeinstituicao, totaldoadoDoacao \n"
                        + "from doacao d, instituicao i, campanha c\n"
                        + "where d.idinstituicao = i.idinstituicao\n"
                        + "and d.idcampanha = c.idcampanha\n"
                        + "and d.idcampanha = ?";

                stmt2 = conn.prepareStatement(sql2);
                stmt2.setInt(1, rs.getInt("idcampanha"));
                rs2 = stmt2.executeQuery();

                while (rs2.next()) {
                    oDoacao = new Doacao();

                    oDoacao.setPorcentagemDoacao(rs2.getDouble("porcentagemdoacao"));
                    oInstituicao = new Instituicao();
                    oInstituicao.setNomeInstituicao(rs2.getString("nomeinstituicao"));
                    oDoacao.setInstituicao(oInstituicao);

                    oCampanha = new Campanha();
                    oCampanha.setNomeCampanha(rs2.getString("nomecampanha"));
                    oDoacao.setCampanha(oCampanha);

                    oDoacao.setTotaldoadoDoacao(oDoacao.getPorcentagemDoacao() * rs.getDouble("totalcampanha"));

                    resultado.add(oDoacao);
                }

            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listarProdutoCarrinho  " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do listarProdutoCarrinhoErro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return resultado;
    }

    @Override
    public void excluir(int idObject
    ) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Object carregar(int idObject
    ) {

        ResultSet rs = null;
        PreparedStatement stmt = null;
        Produto oProduto = null;
        Campanha oCampanha = null;

        String sql = "SELECT p.idProduto, p.nomeProduto, p.descricaoProduto, "
                + "p.precoProduto, p.tempousoProduto, p.fotoProduto, "
                + "p.fotoProduto1, p.fotoProduto2, c.idCampanha, c.nomeCampanha "
                + "FROM Produto p, Campanha c "
                + "WHERE p.idCampanha = c.idCampanha "
                + "AND p.idProduto = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idObject);
            rs = stmt.executeQuery();
            while (rs.next()) {
                oProduto = new Produto();
                oProduto.setIdProduto(rs.getInt("idProduto"));
                oProduto.setNomeProduto(rs.getString("nomeProduto"));
                oProduto.setDescricaoProduto(rs.getString("descricaoProduto"));
                oProduto.setPrecoProduto(rs.getDouble("precoProduto"));
                oProduto.setTempousoProduto(rs.getString("tempousoProduto"));
                oProduto.setFotoProduto(rs.getString("fotoProduto"));
                oProduto.setFotoProduto1(rs.getString("fotoProduto1"));
                oProduto.setFotoProduto2(rs.getString("fotoProduto2"));

                oCampanha = new Campanha();
                oCampanha.setIdCampanha(rs.getInt("idCampanha"));
                oCampanha.setNomeCampanha(rs.getString("nomeCampanha"));

                oProduto.setCampanha(oCampanha);
            }

        } catch (SQLException ex) {
            System.out.println("Errooooo ao CarregarProduto !!!  " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);

            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do carregar ProdutoErro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return oProduto;
    }

    @Override
    public Boolean alterar(Object object
    ) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Boolean alterarProdutoCarrinho(Object object) {
        PreparedStatement stmt = null;
        Produto oProduto = (Produto) object;

        String sql = "UPDATE Produto SET "
                + "idCarrinho=?, "
                + "statusProduto='C', "
                + "dataProduto=? "
                + "WHERE idProduto = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, oProduto.getCarrinho().getIdCarrinho());
            Date data1 = new Date();
            SimpleDateFormat formatador = new SimpleDateFormat("yyyy-mm-dd");
            formatador.format(data1);

            stmt.setDate(2, new java.sql.Date(data1.getTime()));
            stmt.setInt(3, oProduto.getIdProduto());

            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao associar o produto ao carrinho \n Erro:" + ex.getMessage());
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

    public Boolean alterarStatusProdutoCarrinho(Object object) {
        PreparedStatement stmt = null;
        Produto oProduto = (Produto) object;

        String sql = "UPDATE Produto SET "
                + "statusProduto='F' "
                + "WHERE idCarrinho = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, oProduto.getCarrinho().getIdCarrinho());
            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao associar o produto ao carrinho \n Erro:" + ex.getMessage());
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

    public Boolean removerProdutoCarrinho(Object object) {
        PreparedStatement stmt = null;
        Produto oProduto = (Produto) object;

        String sql = "UPDATE Produto SET "
                + "idCarrinho=null, "
                + "statusProduto='A', "
                + "dataProduto=? "
                + "WHERE idProduto = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            Date data1 = new Date();
            SimpleDateFormat formatador = new SimpleDateFormat("yyyy-mm-dd");
            formatador.format(data1);

            stmt.setDate(1, new java.sql.Date(data1.getTime()));
            stmt.setInt(2, oProduto.getIdProduto());

            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao Remover o produto ao carrinho \n Erro:" + ex.getMessage());
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

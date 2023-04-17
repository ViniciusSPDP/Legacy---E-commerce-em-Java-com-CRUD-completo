/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.dao;

import br.com.projetolegacy.model.Carrinho;
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
public class CarrinhoDAOImpl implements GenericDAO {

    Connection conn;

    public CarrinhoDAOImpl() throws Exception {
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
        Carrinho oCarrinho = (Carrinho) object;

        String sql = "insert into Carrinho "
                + "(statusCarrinho, "
                + "datacriacaoCarrinho, "
                + "idInfluenciador) "
                + "values(?, ?, ?);";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "A");

            Date data1 = new Date();
            SimpleDateFormat formatador = new SimpleDateFormat("yyyy-mm-dd");
            formatador.format(data1);

            stmt.setDate(2, new java.sql.Date(data1.getTime()));

            stmt.setInt(3, oCarrinho.getoInfluenciador().getIdInfluenciador());

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Erro ao cadastrar Carrinho !! \n EROO: " + ex.getMessage());
            ex.printStackTrace();
            return false;
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, null);
            } catch (Exception ex) {
                System.out.println("Erro ao Fechar ConexãoErro: "
                        + ex.getMessage());
                ex.printStackTrace();
            }
        }

    }

    @Override
    public List<Object> listar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Object> contadorCarrinho(Integer idCarrinho) {

        ResultSet rs = null;
        PreparedStatement stmt = null;
        List<Object> resultado = new ArrayList();
        Produto oProduto = null;
        Carrinho oCarrinho = null;

        String sql = "SELECT COUNT(*) quantidade, totaldoacaoCarrinho, "
                + "FROM Produto p, Carrinho c "
                + "Where p.idCarrinho = c.idCarrinho "
                + "and c.idCarrinho = ?; ";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCarrinho);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oCarrinho = new Carrinho();
                oCarrinho.setIdCarrinho(rs.getInt("idCarrinho"));
                //oDoacao.setTotaldoadoDoacao(oDoacao.getPorcentagemDoacao() * rs.getDouble("totalcampanha"));

                oCarrinho.setTotaldoacaoCarrinho(rs.getDouble("quantidade"));
                
            }

        } catch (SQLException ex) {
            System.out.println("Erro ao listarContadordoCarrinho  " + ex.getMessage());
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
        Carrinho oCarrinho = null;

        String sql = "select * from carrinho, influenciador "
                + "where carrinho.idInfluenciador = influenciador.idInfluenciador "
                + "and carrinho.statusCarrinho = 'A' "
                + "and influenciador.idInfluenciador = ?; ";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idObject);
            rs = stmt.executeQuery();

            if (rs.next()) {
                oCarrinho = new Carrinho();
                oCarrinho.setIdCarrinho(rs.getInt("idCarrinho"));
                oCarrinho.setStatusCarrinho(rs.getString("statusCarrinho"));
            }
        } catch (SQLException ex) {
            System.out.println("ERRO ao CarregarCarrinho " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, rs);

            } catch (Exception ex) {
                System.out.println("Erro ao fechar conexaão do carregar CarrinhoErro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return oCarrinho;
    }

    @Override
    public Boolean alterar(Object object
    ) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Boolean finalizarCarrinho(Object object) {
        PreparedStatement stmt = null;
        Carrinho oCarrinho = (Carrinho) object;

        String sql = "UPDATE Carrinho SET "
                + "statusCarrinho=?, "
                + "datafinalizacaoCarrinho=?, "
                + "valototalCarrinho=? "
                + "WHERE idCarrinho = ?;";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "F");

            Date data1 = new Date();
            SimpleDateFormat formatador = new SimpleDateFormat("yyyy-mm-dd");
            formatador.format(data1);

            stmt.setDate(2, new java.sql.Date(data1.getTime()));

            stmt.setDouble(3, oCarrinho.getValortotalCarrinho());

            stmt.setInt(4, oCarrinho.getIdCarrinho());

            stmt.executeUpdate();

            try {
                ProdutoDAOImpl dao = new ProdutoDAOImpl();
                dao.alterarStatusProdutoCarrinho(oCarrinho.getIdCarrinho());

            } catch (Exception ex) {
                System.out.println("Erro ao finalizar carrinho na sessao");

            }

            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao Finalizar o carrinho \n Erro:" + ex.getMessage());
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

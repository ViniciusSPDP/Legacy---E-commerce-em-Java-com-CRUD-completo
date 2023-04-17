/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Aluno
 */
public class ConnectionFactory {

    //Metodo de conexão 
    //Metododeacesso tipoderetorno nome
    public static Connection conexao() throws Exception {
        //caminho do BD
        String url = "jdbc:postgresql://localhost:5432/bd_legacy";
        String usuario = "postgres";
        String senha = "postdba";

        //Conectar
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(url, usuario, senha);
        } catch (Exception ex) {
            throw new Exception("Erro ao conectar " + ex.getMessage());
        }
    }

    //Fechar Conexão
    public static void fechar(Connection conn, Statement stmt, ResultSet rs) throws Exception {
        try {
            if (conn != null) {
                conn.close();
                //Fecha Conexão
            }

            if (stmt != null) {
                stmt.close();
                //Fecha SQL
            }

            if (rs != null) {
                rs.close();
                //Fecha os dados do ResultSet
            }
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
    }
}

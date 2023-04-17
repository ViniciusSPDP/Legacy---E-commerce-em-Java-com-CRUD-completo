/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package br.com.projetolegacy.dao;

import java.util.List;

/**
 *
 * @author Aluno
 */
public interface GenericDAO {
    
    public Boolean cadastrar(Object object);
    public List<Object> listar();
    public void excluir(int idObject);
    public Object carregar(int idObject);
    public Boolean alterar(Object object);
    
}

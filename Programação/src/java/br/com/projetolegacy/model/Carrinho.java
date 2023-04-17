/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.model;

import java.sql.Date;

/**
 *
 * @author Aluno
 */
public class Carrinho {
    
    private Integer idCarrinho;
    private String statusCarrinho;
    private Date datacriacaoCarrinho;
    private Date datafinalizacaoCarrinho;
    private Double valortotalCarrinho;
    private Double totaldoacaoCarrinho;
    private Influenciador oInfluenciador;

    public Carrinho() {
    }

    public Carrinho(Integer idCarrinho) {
        this.idCarrinho = idCarrinho;
    }

    public Carrinho(Integer idCarrinho, String statusCarrinho, Date datacriacaoCarrinho, Date datafinalizacaoCarrinho, Double valortotalCarrinho, Double totaldoacaoCarrinho, Influenciador oInfluenciador) {
        this.idCarrinho = idCarrinho;
        this.statusCarrinho = statusCarrinho;
        this.datacriacaoCarrinho = datacriacaoCarrinho;
        this.datafinalizacaoCarrinho = datafinalizacaoCarrinho;
        this.valortotalCarrinho = valortotalCarrinho;
        this.totaldoacaoCarrinho = totaldoacaoCarrinho;
        this.oInfluenciador = oInfluenciador;
    }

    public Integer getIdCarrinho() {
        return idCarrinho;
    }

    public void setIdCarrinho(Integer idCarrinho) {
        this.idCarrinho = idCarrinho;
    }

    public String getStatusCarrinho() {
        return statusCarrinho;
    }

    public void setStatusCarrinho(String statusCarrinho) {
        this.statusCarrinho = statusCarrinho;
    }

    public Date getDatacriacaoCarrinho() {
        return datacriacaoCarrinho;
    }

    public void setDatacriacaoCarrinho(Date datacriacaoCarrinho) {
        this.datacriacaoCarrinho = datacriacaoCarrinho;
    }

    public Date getDatafinalizacaoCarrinho() {
        return datafinalizacaoCarrinho;
    }

    public void setDatafinalizacaoCarrinho(Date datafinalizacaoCarrinho) {
        this.datafinalizacaoCarrinho = datafinalizacaoCarrinho;
    }

    public Double getValortotalCarrinho() {
        return valortotalCarrinho;
    }

    public void setValortotalCarrinho(Double valortotalCarrinho) {
        this.valortotalCarrinho = valortotalCarrinho;
    }

    public Double getTotaldoacaoCarrinho() {
        return totaldoacaoCarrinho;
    }

    public void setTotaldoacaoCarrinho(Double totaldoacaoCarrinho) {
        this.totaldoacaoCarrinho = totaldoacaoCarrinho;
    }

    public Influenciador getoInfluenciador() {
        return oInfluenciador;
    }

    public void setoInfluenciador(Influenciador oInfluenciador) {
        this.oInfluenciador = oInfluenciador;
    }
    
   
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.model;

import java.util.Date;


/**
 *
 * @author Aluno
 */
public class Produto {
    
    private Integer idProduto;
    private String nomeProduto;
    private String descricaoProduto;
    private String fotoProduto;
    private String fotoProduto1;
    private String fotoProduto2;
    private Double precoProduto;
    private String tempousoProduto;
    private Date dataProduto;
    private String statusProduto;
    private Carrinho carrinho;
    private Campanha campanha;
    

    public Produto() {
    }

    public Produto(Integer idProduto, String nomeProduto, String descricaoProduto, String fotoProduto, String fotoProduto1, String fotoProduto2, Double precoProduto, String tempousoProduto, Date dataProduto, String statusProduto, Carrinho carrinho, Campanha campanha) {
        this.idProduto = idProduto;
        this.nomeProduto = nomeProduto;
        this.descricaoProduto = descricaoProduto;
        this.fotoProduto = fotoProduto;
        this.fotoProduto1 = fotoProduto1;
        this.fotoProduto2 = fotoProduto2;
        this.precoProduto = precoProduto;
        this.tempousoProduto = tempousoProduto;
        this.dataProduto = dataProduto;
        this.statusProduto = statusProduto;
        this.carrinho = carrinho;
        this.campanha = campanha;
    }

    public Integer getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(Integer idProduto) {
        this.idProduto = idProduto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getDescricaoProduto() {
        return descricaoProduto;
    }

    public void setDescricaoProduto(String descricaoProduto) {
        this.descricaoProduto = descricaoProduto;
    }

    public String getFotoProduto() {
        return fotoProduto;
    }

    public void setFotoProduto(String fotoProduto) {
        this.fotoProduto = fotoProduto;
    }

    public String getFotoProduto1() {
        return fotoProduto1;
    }

    public void setFotoProduto1(String fotoProduto1) {
        this.fotoProduto1 = fotoProduto1;
    }

    public String getFotoProduto2() {
        return fotoProduto2;
    }

    public void setFotoProduto2(String fotoProduto2) {
        this.fotoProduto2 = fotoProduto2;
    }

    public Double getPrecoProduto() {
        return precoProduto;
    }

    public void setPrecoProduto(Double precoProduto) {
        this.precoProduto = precoProduto;
    }

    public String getTempousoProduto() {
        return tempousoProduto;
    }

    public void setTempousoProduto(String tempousoProduto) {
        this.tempousoProduto = tempousoProduto;
    }

    public Date getDataProduto() {
        return dataProduto;
    }

    public void setDataProduto(Date dataProduto) {
        this.dataProduto = dataProduto;
    }

    public String getStatusProduto() {
        return statusProduto;
    }

    public void setStatusProduto(String statusProduto) {
        this.statusProduto = statusProduto;
    }

    public Carrinho getCarrinho() {
        return carrinho;
    }

    public void setCarrinho(Carrinho carrinho) {
        this.carrinho = carrinho;
    }

    public Campanha getCampanha() {
        return campanha;
    }

    public void setCampanha(Campanha campanha) {
        this.campanha = campanha;
    }

  
   

    
    
    
    
    
}

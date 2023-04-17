/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projetolegacy.model;

/**
 *
 * @author Vinicius
 */
public class Doacao {
    
    private Integer idDoacao;
    private Double porcentagemDoacao;
    private Double totaldoadoDoacao;
    
    private Instituicao instituicao;
    private Campanha campanha;

    public Doacao() {
    }

    public Doacao(Integer idDoacao, Double porcentagemDoacao, Double totaldoadoDoacao, Instituicao instituicao, Campanha campanha) {
        this.idDoacao = idDoacao;
        this.porcentagemDoacao = porcentagemDoacao;
        this.totaldoadoDoacao = totaldoadoDoacao;
        this.instituicao = instituicao;
        this.campanha = campanha;
    }

    public Integer getIdDoacao() {
        return idDoacao;
    }

    public void setIdDoacao(Integer idDoacao) {
        this.idDoacao = idDoacao;
    }

    public Double getPorcentagemDoacao() {
        return porcentagemDoacao;
    }

    public void setPorcentagemDoacao(Double porcentagemDoacao) {
        this.porcentagemDoacao = porcentagemDoacao;
    }

    public Double getTotaldoadoDoacao() {
        return totaldoadoDoacao;
    }

    public void setTotaldoadoDoacao(Double totaldoadoDoacao) {
        this.totaldoadoDoacao = totaldoadoDoacao;
    }

    public Instituicao getInstituicao() {
        return instituicao;
    }

    public void setInstituicao(Instituicao instituicao) {
        this.instituicao = instituicao;
    }

    public Campanha getCampanha() {
        return campanha;
    }

    public void setCampanha(Campanha campanha) {
        this.campanha = campanha;
    }
    
    
    
    
}

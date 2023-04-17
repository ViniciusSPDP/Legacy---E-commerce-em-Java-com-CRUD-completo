/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.model;

/**
 *
 * @author Aluno
 */
public class Campanha {
    
    private Integer idCampanha;
    private String nomeCampanha;
    private String descricaoCampanha;
    private Influenciador influenciador;

    public Campanha() {
    }
    
    

    public Campanha(Integer idCampanha) {
        this.idCampanha = idCampanha;
    }
    

    public Campanha(Integer idCampanha, String nomeCampanha, String descricaoCampanha, Influenciador influenciador) {
        this.idCampanha = idCampanha;
        this.nomeCampanha = nomeCampanha;
        this.descricaoCampanha = descricaoCampanha;
        this.influenciador = influenciador;
    }

    public Integer getIdCampanha() {
        return idCampanha;
    }

    public void setIdCampanha(Integer idCampanha) {
        this.idCampanha = idCampanha;
    }

    public String getNomeCampanha() {
        return nomeCampanha;
    }

    public void setNomeCampanha(String nomeCampanha) {
        this.nomeCampanha = nomeCampanha;
    }

    public String getDescricaoCampanha() {
        return descricaoCampanha;
    }

    public void setDescricaoCampanha(String descricaoCampanha) {
        this.descricaoCampanha = descricaoCampanha;
    }

    public Influenciador getInfluenciador() {
        return influenciador;
    }

    public void setInfluenciador(Influenciador influenciador) {
        this.influenciador = influenciador;
    }
   
    
    
}

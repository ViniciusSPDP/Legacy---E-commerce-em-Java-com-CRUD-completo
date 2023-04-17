/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.model;

/**
 *
 * @author Aluno
 */
public class Adm {
    
    private Integer idAdm;
    private String nomeAdm;
    private String loginAdm;
    private String senhaAdm;

    public Adm() {
    }

    public Adm(Integer idAdm) {
        this.idAdm = idAdm;
    }

    
    
    public Adm(Integer idAdm, String nomeAdm, String loginAdm, String senhaAdm) {
        this.idAdm = idAdm;
        this.nomeAdm = nomeAdm;
        this.loginAdm = loginAdm;
        this.senhaAdm = senhaAdm;
    }

    public Integer getIdAdm() {
        return idAdm;
    }

    public void setIdAdm(Integer idAdm) {
        this.idAdm = idAdm;
    }

    public String getNomeAdm() {
        return nomeAdm;
    }

    public void setNomeAdm(String nomeAdm) {
        this.nomeAdm = nomeAdm;
    }

    public String getLoginAdm() {
        return loginAdm;
    }

    public void setLoginAdm(String loginAdm) {
        this.loginAdm = loginAdm;
    }

    public String getSenhaAdm() {
        return senhaAdm;
    }

    public void setSenhaAdm(String senhaAdm) {
        this.senhaAdm = senhaAdm;
    }
    
    
}

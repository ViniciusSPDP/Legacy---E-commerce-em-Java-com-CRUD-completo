/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.projetolegacy.model;

/**
 *
 * @author Aluno
 */
public class Instituicao {

    private Integer idInstituicao;
    private String statusInstituicao;
    private String nomeInstituicao;
    private String fotoInstituicao;
    private String telInstituicao;
    private String cnpjInstituicao;
    private String senhaInstituicao;
    private String cepInstituicao;
    private String ruaInstituicao;
    private String bairroInstituicao;
    private String cidadeInstituicao;
    private String estadoInstituicao;
    private String numInstituicao;
    
    private Adm adm;

    public Instituicao() {
    }

    public Instituicao(Integer idInstituicao) {
        this.idInstituicao = idInstituicao;
    }

    public Instituicao(Integer idInstituicao, String statusInstituicao, String nomeInstituicao, String fotoInstituicao, String telInstituicao, String cnpjInstituicao, String senhaInstituicao, String cepInstituicao, String ruaInstituicao, String bairroInstituicao, String cidadeInstituicao, String estadoInstituicao, String numInstituicao, Adm adm) {
        this.idInstituicao = idInstituicao;
        this.statusInstituicao = statusInstituicao;
        this.nomeInstituicao = nomeInstituicao;
        this.fotoInstituicao = fotoInstituicao;
        this.telInstituicao = telInstituicao;
        this.cnpjInstituicao = cnpjInstituicao;
        this.senhaInstituicao = senhaInstituicao;
        this.cepInstituicao = cepInstituicao;
        this.ruaInstituicao = ruaInstituicao;
        this.bairroInstituicao = bairroInstituicao;
        this.cidadeInstituicao = cidadeInstituicao;
        this.estadoInstituicao = estadoInstituicao;
        this.numInstituicao = numInstituicao;
        this.adm = adm;
    }

    public Integer getIdInstituicao() {
        return idInstituicao;
    }

    public void setIdInstituicao(Integer idInstituicao) {
        this.idInstituicao = idInstituicao;
    }

    public String getStatusInstituicao() {
        return statusInstituicao;
    }

    public void setStatusInstituicao(String statusInstituicao) {
        this.statusInstituicao = statusInstituicao;
    }

    public String getNomeInstituicao() {
        return nomeInstituicao;
    }

    public void setNomeInstituicao(String nomeInstituicao) {
        this.nomeInstituicao = nomeInstituicao;
    }

    public String getFotoInstituicao() {
        return fotoInstituicao;
    }

    public void setFotoInstituicao(String fotoInstituicao) {
        this.fotoInstituicao = fotoInstituicao;
    }

    public String getTelInstituicao() {
        return telInstituicao;
    }

    public void setTelInstituicao(String telInstituicao) {
        this.telInstituicao = telInstituicao;
    }

    public String getCnpjInstituicao() {
        return cnpjInstituicao;
    }

    public void setCnpjInstituicao(String cnpjInstituicao) {
        this.cnpjInstituicao = cnpjInstituicao;
    }

    public String getSenhaInstituicao() {
        return senhaInstituicao;
    }

    public void setSenhaInstituicao(String senhaInstituicao) {
        this.senhaInstituicao = senhaInstituicao;
    }

    public String getCepInstituicao() {
        return cepInstituicao;
    }

    public void setCepInstituicao(String cepInstituicao) {
        this.cepInstituicao = cepInstituicao;
    }

    public String getRuaInstituicao() {
        return ruaInstituicao;
    }

    public void setRuaInstituicao(String ruaInstituicao) {
        this.ruaInstituicao = ruaInstituicao;
    }

    public String getBairroInstituicao() {
        return bairroInstituicao;
    }

    public void setBairroInstituicao(String bairroInstituicao) {
        this.bairroInstituicao = bairroInstituicao;
    }

    public String getCidadeInstituicao() {
        return cidadeInstituicao;
    }

    public void setCidadeInstituicao(String cidadeInstituicao) {
        this.cidadeInstituicao = cidadeInstituicao;
    }

    public String getEstadoInstituicao() {
        return estadoInstituicao;
    }

    public void setEstadoInstituicao(String estadoInstituicao) {
        this.estadoInstituicao = estadoInstituicao;
    }

    public String getNumInstituicao() {
        return numInstituicao;
    }

    public void setNumInstituicao(String numInstituicao) {
        this.numInstituicao = numInstituicao;
    }

    public Adm getAdm() {
        return adm;
    }

    public void setAdm(Adm adm) {
        this.adm = adm;
    }

    
    

   
}

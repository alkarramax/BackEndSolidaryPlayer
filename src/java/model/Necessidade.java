package model;

public class Necessidade {
    
    
    private int id_necessidade;
    private String necessidade;
    private String unidade; 
    
    //MÉTODOS ESPECIAIS
    public int getId_necessidade() {
        return id_necessidade;
    }

    public void setId_necessidade(int id_necessidade) {
        this.id_necessidade = id_necessidade;
    }

    public String getNecessidade() {
        return necessidade;
    }

    public void setNecessidade(String necessidade) {
        this.necessidade = necessidade;
    }

    public String getUnidade() {
        return unidade;
    }

    public void setUnidade(String unidade) {
        this.unidade = unidade;
    }
    
}

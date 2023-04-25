/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cartões;

/**
 *
 * @author aluno
 */
public class cartaoCredito extends Cartao {
    private double faturaAtual;
    private double limite;
    private boolean ativo;
    
    public cartaoCredito(String owner, int ano, double limite){
        super(owner, ano);
        this.limite = limite;
        this.faturaAtual = 0;
        this.ativo = true;
    }
    
    public void printc(){
        System.out.println("\t|Nome:" + this.getOwner() + "\n\t|Número:" + this.getNumero() + "\n\t|Validade:" + this.getValidade()[2]);
        System.out.println("\t|Fatura atual: R$" + this.getFaturaAtual()+ "\n\t|Limite: R$"+this.getLimite());
        String x;
        if (this.isAtivo()) {
            x = "Ativo";
        }
        else{
            x = "Inativo";}
        System.out.println("\t|Cartão " +  x);
        
    }

    public double getFaturaAtual() {
        return faturaAtual;
    }

    public double getLimite() {
        return limite;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setFaturaAtual(double faturaAtual) {
        this.faturaAtual = faturaAtual;
    }

    public void setLimite(double limite) {
        this.limite = limite;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }
    
    public void pagarFatura(){
        this.faturaAtual = 0;
    }
    
    public void fazerCompra(double val){
        if(this.faturaAtual + val > this.limite){
            System.out.println("Limite insuficiente");
        }
        else{
            this.faturaAtual += val;
        }
    }
}

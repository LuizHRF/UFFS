/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cartões;

/**
 *
 * @author aluno
 */
public class cartaoTransporte extends Cartao{
    private double saldo;
    private boolean PCD;
    private double tarifaAtual;
    
    public cartaoTransporte(String owner, int ano, double saldo, boolean pcd){
        super(owner, ano);
        this.saldo = saldo;
        this.PCD = pcd;
        if(pcd == true){
            this.tarifaAtual = 0;
        }else{
            this.tarifaAtual = 4.4;
        }
    }

    public double getSaldo() {
        return saldo;
    }

    public boolean isPCD() {
        return PCD;
    }

    public double getTarifaAtual() {
        return tarifaAtual;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public void setPCD(boolean PCD) {
        this.PCD = PCD;
        if(PCD == true){
            setTarifaAtual(0);
        }else{
            setTarifaAtual(4.4);
        }   
    }

    public void setTarifaAtual(double tarifaAtual) {
        this.tarifaAtual = tarifaAtual;
    }
    
    
}

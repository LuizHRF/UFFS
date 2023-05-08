/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cartões;
import java.util.Random;

/**
 *
 * @author aluno
 */
public class Cartao {
    private String owner;
    private int validade[];
    private int numero;
    Random random = new Random();
    private Operacao[] ops;
    private int i;
    
    public Cartao(String owner, int ano){
        this.ops = new Operacao[1000];
        this.owner = owner;
        this.validade = new int[3];
        validade[2] = ano+10;
        this.numero = random.nextInt(999999999);
        this.i = 0;
    }

    public String getOwner() {
        return owner;
    }

    public int[] getValidade() {
        return validade;
    }

    public int getNumero() {
        return numero;
    }

    public void setOwner(String owner) {
        this.owner = owner;
        this.ops[i] = new Operacao("Novo titular |" + owner);
        i++;
    }

    public void setValidade(int[] validade) {
        this.validade = validade;
        this.ops[i] = new Operacao("Nova validade |", validade[2]);
        i++;
    }

    public void setNumero(int numero) {
        this.numero = numero;
        this.ops[i] = new Operacao("Novo número de cartão |", numero);
        i++;
    }

    public Operacao[] getOps() {
        return ops;
    }

    public int getI() {
        return i;
    }

    public void somaI() {
        this.i++;
    }
    
    public void printOps(){
        System.out.println("\nOperações realizadas:");
        for(int k = 0; k<this.i; k++){
            if(ops[k].getValue() == 0){
                System.out.println(ops[k].getDesc());
            }else{
                System.out.println(ops[k].getDesc() + ops[k].getValue());
            }
        }
    }

}

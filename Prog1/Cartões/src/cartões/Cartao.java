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
    
    public Cartao(String owner, int ano){
        this.owner = owner;
        this.validade = new int[3];
        validade[2] = ano+10;
        this.numero = random.nextInt(999999999);
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
    }

    public void setValidade(int[] validade) {
        this.validade = validade;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
    
    
}

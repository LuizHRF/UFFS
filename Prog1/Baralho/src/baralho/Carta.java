/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package baralho;

/**
 *
 * @author aluno
 */
public class Carta {
    private String tipo;
    private String naipe;
    private final static String[] naipes = {"copas", "espadas", "ouros", "paus"};
    private final static String[] tipos = {"Ás", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Valete", "Dama", "Rei"};
    
    public Carta(String t, String n){
        setTipo(t);
        setNaipe(n);
    }

    public String getTipo() {
        return tipo;
    }

    public String getNaipe() {
        return naipe;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setNaipe(String naipe) {
        this.naipe = naipe;
    }

    public static String[] getNaipes() throws Exception{
//        String[] s = {"copas", "espadas", "ouros", "paus"};
//        if(naipes != s){
//            System.out.println("Caiu na excessão");
//            throw new Exception("Naipes incorretos");
//        }
//        else{
//            return naipes;
//        }
    }

    public static String[] getTipos() {
        return tipos;
    }
    
    
}

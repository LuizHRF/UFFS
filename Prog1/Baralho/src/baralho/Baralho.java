/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package baralho;

/**
 *
 * @author aluno
 */
public class Baralho {
    
    private Carta[] cartas;

    public Baralho() {
        this.cartas = new Carta[52];
        for(int i=0; i<52; i++){
            cartas[i] = null;
        }
    }
    
    public static void main(String[] args) {
        
        Baralho baralho1 = new Baralho();
        Baralho.criaBaralho(baralho1);
        
        Baralho.printaBaralho(baralho1);
    }

    public Carta[] getCartas() {
        return cartas;
    }

    public void setCartas(Carta[] cartas) {
        this.cartas = cartas;
    }

    public static void criaBaralho(Baralho b){
        
        try{
            for(int i=0; i<4; i++){
                
                for(int j=0; j<13; j++){
                        b.cartas[(13*i)+j] = new Carta(Carta.getTipos()[j], Carta.getNaipes()[i]);
                        
                }
            }
        }catch(Exception e){
            
            System.out.println(e);
            for(int i=0; i<52; i++){
                b.cartas[i] = null;
            }
        }
    }
    
    public static void printaBaralho(Baralho b){
           
        try{
            for(int i = 0; i<52; i++){
                System.out.println(b.cartas[i].getTipo() + " de " + b.cartas[i].getNaipe());
            }
        }catch(java.lang.NullPointerException e){
            System.out.println("Baralho vazio ou com cartas faltando");
        }
    }
    
    public static void shuffle(Baralho b){
        
    }
}

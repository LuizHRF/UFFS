/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package carro;

/**
 *
 * @author aluno
 */
public class main {
    
    public static void main(String[] args) {
        
        Radio r = new Radio(800.1);
    
    
        for(int i =0; i<6; i++){
            r.aumentavol();
        }
    
        System.out.println(r.get());
        
        r.set(107.5);
        
        System.out.println(r.get());
        
        for(int i =0; i<11; i++){
            r.diminuivol();
        }
        
    }
}

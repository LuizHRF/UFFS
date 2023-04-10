/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package carro;

/**
 *
 * @author aluno
 */
public class Radio {
    
    private int volume;
    private double estacao;
    private boolean ligado;
    
    
    public Radio(){
    
        this.volume = 5;
        this.estacao = 0;
        this.ligado = false;
    }
    
    public Radio(double etc){
    
        this.volume = 5;
        this.estacao = etc;
        this.ligado = false;
    }
    
    public void aumentavol() {
        if (volume==10){
            System.out.println("Voluem no máximo");
        }
        else{
            this.volume+=1;
        }
    }
    
    public void diminuivol() {
        if (volume==0){
            System.out.println("Volume está no mínimo");
        }
        else{
            this.volume -=1;
        }
    }
    
    public void set(double estacao){
        this.estacao = estacao;
    }

    public double get(){
       return this.estacao;
    }
    
}



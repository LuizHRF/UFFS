/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cartões;

public class Operacao {
    private String desc;
    private double value;
    
    public Operacao(String desc, double value){
        this.desc = desc;
        this.value = value;
    }
    
    public Operacao(String desc){
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }

    public double getValue() {
        return value;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public void setValue(double value) {
        this.value = value;
    }
   
    public void print(Operacao[] o, int j){
        for(int i = 0; i<j; i++){
            System.out.println(o[i].desc + o[i].value);
    }
    }
}

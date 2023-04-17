/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pedido;

/**
 *
 * @author aluno
 */
public class produto {
        private int codigo;
        private double val;
        private String desc;
        
        public produto(int cod, double val, String desc){
            this.codigo = cod;
            this.val = val;
            this.desc = desc;
        }
        
        public produto(){
            this.codigo= 1421;
            this.val = 5.5;
            this.desc = "None";
            
        }
        
        public void setprod(int cod){
            this.codigo= cod;
        }
        
        public void setprod(double val){
            this.val = val;
        }
        
        public void setprod(String desc){
            this.desc = desc;
        }
        
        public double getval(){
            return this.val;
        }
        
}

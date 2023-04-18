
package pedido;


public class Pedido {
    private Item_pedido[] itens;
    private double valor_total;
    

    public Pedido(int n){
        this.valor_total = 0;
        this.itens = new Item_pedido[n];
    }
    
    public void adicionarItem(int n, Item_pedido i){
        this.itens[n] = i;
        this.valor_total += (i.getProduto().getval())*(i.getQnt());
    }
    
    public double getval(){
        return this.valor_total;
    }
   
    public static void main(String[] args) {
        
       Pedido p1 = new Pedido(2);
       
       produto p = new produto(61, 12.0, "None");
       produto n = new produto();
       
       Item_pedido i1 = new Item_pedido(p, 2);
       Item_pedido i2 = new Item_pedido(n, 2);
       
       p1.adicionarItem(0,i1);
       p1.adicionarItem(1, i2);
       
       double x = p1.getval();
       
       System.out.println("Preço final: R$" + x);
       
    }
    
}


package pedido;


public class Pedido {
    public Item_pedido itens[];
    public double valor_total;
    

    public Pedido(){
        this.valor_total = 0;
    }
    
    public void adicionarItem(int n, Item_pedido i){
        itens[n] = i;
        this.valor_total += i.produto.getval();
    }
    
    public double getval(){
        return this.valor_total;
    }
   
    public static void main(String[] args) {
        
       Pedido p1 = new Pedido();
       
       produto p = new produto(61, 12.0, "None");
       produto n = new produto();
       
       Item_pedido i1 = new Item_pedido(p, 2);
       Item_pedido i2 = new Item_pedido(n, 2);
       
       p1.adicionarItem(0,i1);
       p1.adicionarItem(1, i2);
       
       double x = p1.getval();
       
       System.out.println(x);
       
    }
    
}

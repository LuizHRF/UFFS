
package pedido;

public class Item_pedido{
        private produto produto;
        private int qnt;
        
        
       public Item_pedido(produto prod, int qnt){
           this.produto = prod;
           this.qnt= qnt;
       }

    public int getQnt() {
        return qnt;
    }

    public produto getProduto() {
        return produto;
    }

}

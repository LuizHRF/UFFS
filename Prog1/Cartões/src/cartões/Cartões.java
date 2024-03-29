
package cartões;


public class Cartões {
    
    public static void main(String[] args) {
        
        cartaoCredito cartao1 = new cartaoCredito("Luiz", 2023, 150);
        cartaoTransporte cartao2 = new cartaoTransporte("Luiz", 2023, 20.5, true);
        
        System.out.println("Valor tarifa: "+cartao2.getTarifaAtual());
     
        cartao1.fazerCompra(300);
        
        cartao1.setOwner("Gabi");
        
        int val[] = {1, 01, 2078};
        cartao2.setValidade(val);

        System.out.println("Fatura: "+ cartao1.getFaturaAtual());
        
        cartao1.fazerCompra(150);

        System.out.println("Fatura: "+ cartao1.getFaturaAtual());
        
        cartao2.setPCD(false);
        
        System.out.println("Valor tarifa: "+cartao2.getTarifaAtual());
        
        cartao1.printOps();
        
        cartao2.printOps();
    }
    
}

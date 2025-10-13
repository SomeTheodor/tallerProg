/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialP;

/**
 *
 * @author theol
 */
public class ParcialP {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Pan pan = new Pan("Premium", "Sebada",100);
        Ingrediente i1 = new Ingrediente("B","Jamon", 200 );
        Ingrediente i2 = new Ingrediente("A","Queso", 100 );
        Ingrediente i3 = new Ingrediente("A","Salame", 400 );
        Ingrediente i4 = new Ingrediente("B","Aceituna", 200 );
        Sandwich sandwich = new Sandwich("Completo",pan,10);
        
        sandwich.agregarIngrediente(i4);
        sandwich.agregarIngrediente(i3);
        sandwich.agregarIngrediente(i2);
        System.out.print(sandwich.toString());
    }
    
}

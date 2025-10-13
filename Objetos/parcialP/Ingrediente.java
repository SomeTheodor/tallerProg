/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialP;

/**
 *
 * @author theol
 */
public class Ingrediente extends Componente{
    private String grupo;

    public Ingrediente(String grupo, String nombre, double costo) {
        super(nombre, costo);
        this.grupo = grupo;
    }
    
    public double obtenerCosto(){
        double costo = this.getCosto();
        if(this.grupo.equalsIgnoreCase("B")){
            costo*=1.10;
        }
        return costo;
    }
    
    @Override
    public String toString() {
        return "Un ingrediente: " + super.getNombre()+ " - " + super.getCosto() + " - " + this.grupo + " ";
    }
    
    
}

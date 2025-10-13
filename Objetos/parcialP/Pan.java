/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialP;

/**
 *
 * @author theol
 */
public class Pan extends Componente{
    private String calidad;

    public Pan(String calidad, String nombre, double costo) {
        super(nombre, costo);
        this.calidad = calidad;
    }
    
    @Override
    public double obtenerCosto(){
        double costo = this.getCosto();
        if(calidad.equalsIgnoreCase("Premium")){
            costo *= 1.20;
        }
        return costo;
    }

    @Override
    public String toString() {
        return "Un Pan: " + super.getNombre() + " - " + super.getCosto() + " - " + calidad;
    }
    
}

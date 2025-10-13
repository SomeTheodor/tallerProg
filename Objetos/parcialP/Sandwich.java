/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialP;

/**
 *
 * @author theol
 */
public class Sandwich {
    private String nombre;
    private Pan pan;
    private int dimF;
    private int dimL=0;
    private Ingrediente [] ingredientes;

    public Sandwich(String nombre, Pan pan, int dimF) {
        this.nombre = nombre;
        this.pan = pan;
        this.dimF = dimF;
        this.ingredientes = new Ingrediente[dimF];
    }

    public double costoFinal(){
        double costo = this.pan.obtenerCosto();
        for(int i=0; i<dimL;i++){
            costo+= this.ingredientes[i].obtenerCosto();
        }
        return costo;
    }
    
    public void agregarIngrediente(Ingrediente ingrediente){
        this.ingredientes[dimL]= ingrediente;
        dimL++;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Pan getPan() {
        return pan;
    }

    public void setPan(Pan pan) {
        this.pan = pan;
    }

    @Override
    public String toString() {
        String msj = "Sandwich: " + nombre + ", " + pan.toString() + ", CantIngredientes: " + dimL + " - ";
        for(int i=0; i< dimL;i++){
            msj+= this.ingredientes[i].toString();
        }
        return msj + ", Costo final: " + costoFinal();
    }
    
    
    
}

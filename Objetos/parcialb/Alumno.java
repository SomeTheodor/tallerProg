/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.parcialb;

/**
 *
 * @author theol
 */
public class Alumno {
    private String nombre;
    private int legajo;
    private Examen examen;
    private int dimL=0;
    private Entrega [] entregas = new Entrega[9];

    public Alumno(String nombre, int legajo, Examen examen) {
        this.nombre = nombre;
        this.legajo = legajo;
        this.examen = examen;
        for(int i=0;i<9;i++){
            this.entregas[i] = null;
        }
    }
    
    public void agregarEntrega(int i, Entrega entrega){
        this.entregas[i-1] = entrega;
        this.dimL++;
    }
    
    public boolean estaAprobado(){
        boolean cond = false;
        int cantAprob=0;
        
        if(dimL < 3){
            cond = false;
        }else{
            for(int i=0;i<9;i++){
                if((!(this.entregas[i] == null)) && (this.entregas[i].notaFinal()>4)){
                    cantAprob++;
                }
            }
        }
        
        if((this.examen.evaluacionAprobada()) && (cantAprob > 3)){
            cond = true;
        }
        return cond;
    }
    
}

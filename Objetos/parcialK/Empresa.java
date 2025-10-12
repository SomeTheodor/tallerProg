/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.parciales.ParcialK;

/**
 *
 * @author theol
 */
public class Empresa {
    private String nombre;
    private ProgramadorLider lider;
    private int dimF;
    private int dimL =0;
    private Programador [] programadores;

    public Empresa(ProgramadorLider lider, int dimF, String nombre) {
        this.lider = lider;
        this.nombre = nombre;
        this.dimF = dimF;
        this.programadores = new Programador[dimF];
        for(int i=0; i<dimF; i++){
            this.programadores[i] = null;
        }
    }
    
    public double montoSueldoFinal(){
        double sueldo= 0;
        for(int i=0;i<dimL;i++){
            sueldo += this.programadores[i].sueldoFinal();
        }
        sueldo+= this.lider.sueldoFinal();
        return sueldo;
    }
    
    public void agregarProgramador(Programador programador){
        this.programadores[dimL] = programador;
        this.dimL++;
    }
    
    public void aumentarSueldos(double m){
        this.lider.subirSueldo(m);
        for(int i=0;i<dimL;i++){
            this.programadores[i].subirSueldo(m);
        }
    }
    
    public ProgramadorLider getLider() {
        return lider;
    }

    public void setLider(ProgramadorLider lider) {
        this.lider = lider;
    }

    public Programador[] getProgramadores() {
        return programadores;
    }

    public void setProgramadores(Programador[] programadores) {
        this.programadores = programadores;
    }

    @Override
    public String toString() {
        String mjs = "Empresa: " + nombre + ". Programador Lider: " + lider.toString() + ". ";
        for(int i=0; i<dimL;i++){
            mjs+= "Programador " + i + ": " + programadores[i].toString() + ", ";
        }
        mjs+="Monto total en sueldos a abonar por la empresa: " + montoSueldoFinal();
        return mjs;
    }
    
    
}
    

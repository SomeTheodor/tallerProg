/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.parciales.ParcialK;

/**
 *
 * @author theol
 */
public class ProgramadorLider extends Programador{
    private int antiguedad;
    private int cantProyectos;

    public ProgramadorLider(int antiguedad, int cantProyectos, String nombre, int dni, double sueldo, int cantLineas, String lenguaje) {
        super(nombre, dni, sueldo, cantLineas, lenguaje);
        this.antiguedad = antiguedad;
        this.cantProyectos = cantProyectos;
    }
    
    @Override
    public double sueldoFinal(){
        return super.sueldoFinal() + this.antiguedad*10000 + this.cantProyectos*20000;
    }
    
    
    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public int getCantProyectos() {
        return cantProyectos;
    }

    public void setCantProyectos(int cantProyectos) {
        this.cantProyectos = cantProyectos;
    }

    @Override
    public String toString() {
        return super.toString() ;
    }
    
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.parciales.ParcialK;

/**
 *
 * @author theol
 */
public class Programador {
    private String nombre;
    private int dni;
    private double sueldo;
    private int cantLineas;
    private String lenguaje;

    public Programador(String nombre, int dni, double sueldo, int cantLineas, String lenguaje) {
        this.nombre = nombre;
        this.dni = dni;
        this.sueldo = sueldo;
        this.cantLineas = cantLineas;
        this.lenguaje = lenguaje;
    }
    
    public double sueldoFinal(){
        double sueldoFinal=this.sueldo;
        if (cantLineas > 200){
            sueldoFinal += 50000;
        }
        return sueldoFinal;
    }
    
    public void subirSueldo(double m){
        this.sueldo += m;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getCantLineas() {
        return cantLineas;
    }

    public void setCantLineas(int cantLineas) {
        this.cantLineas = cantLineas;
    }

    public String getLenguaje() {
        return lenguaje;
    }

    public void setLenguaje(String lenguaje) {
        this.lenguaje = lenguaje;
    }

    @Override
    public String toString() {
        return  "Programador: " + (nombre + ", " + dni + ", " + lenguaje + ", "+  sueldoFinal());
    }
    
    
}

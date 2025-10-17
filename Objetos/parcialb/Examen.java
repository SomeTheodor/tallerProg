/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.parcialb;

/**
 *
 * @author theol
 */
public class Examen extends Evaluaciones{
    private double notaTeorica;
    private double notaPractica;

    public Examen(double notaTeorica, double notaPractica, String fecha, String docente) {
        super(fecha, docente);
        this.notaTeorica = notaTeorica;
        this.notaPractica = notaPractica;
    }
    
    public double notaFinal(){
        return this.notaTeorica * 0.4 + this.notaPractica * 0.6;
    }
}

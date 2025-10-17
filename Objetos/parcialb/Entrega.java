/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.parcialb;

/**
 *
 * @author theol
 */
public class Entrega extends Evaluaciones{
    private double notaPresentacion=0;
    private double notaContenido=0;
    private double notaOriginalidad=0;

    public Entrega(double notaPresentacion, double notaContenido, double notaOriginalidad, String fecha, String docente) {
        super(fecha, docente);
        this.notaPresentacion = notaPresentacion;
        this.notaContenido = notaContenido;
        this.notaOriginalidad = notaOriginalidad;
    }
    
    @Override
    public double notaFinal(){
        return (this.notaContenido + this.notaOriginalidad + this.notaPresentacion) / 3;
    }
    
    
}

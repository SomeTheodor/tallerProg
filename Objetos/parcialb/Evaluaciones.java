/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.parcialb;

/**
 *
 * @author theol
 */
public abstract class Evaluaciones {
    private String fecha;
    private String docente;

    public Evaluaciones(String fecha, String docente) {
        this.fecha = fecha;
        this.docente = docente;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDocente() {
        return docente;
    }

    public void setDocente(String docente) {
        this.docente = docente;
    }
    
    public abstract double notaFinal();
    
    public boolean evaluacionAprobada(){
        return notaFinal() > 4;
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.parcialb;

/**
 *
 * @author theol
 */
public class ParcialB {

    public static void main(String[] args) {
        Examen examen = new Examen(1,2,"MAIA","12334");
        Entrega e1 = new Entrega(10,20,30,"MAIA","12334");
        Entrega e2 = new Entrega(20,30,40,"MAIA","12334");
        Entrega e3 = new Entrega(5,60,70,"MAIA","12334");
        Entrega e4 = new Entrega(8,9,10,"MAIA","12334");
        Entrega e5 = new Entrega(6,8,4,"MAIA","12334");
        
        Alumno alumno = new Alumno("Theo", 1234556, examen);
        
        alumno.agregarEntrega(1, e5);
        alumno.agregarEntrega(3, e3);
        alumno.agregarEntrega(2, e4);
        alumno.agregarEntrega(6, e2);
        alumno.agregarEntrega(8, e1);
        
        
        
        if(alumno.estaAprobado()){
            System.out.print("El alumno esta aprobado");
        }
        else{
            System.out.print("El alumno no esta aprobado");
        }
    }
}

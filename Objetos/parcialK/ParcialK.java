/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package com.mycompany.parciales.ParcialK;

/**
 *
 * @author theol
 */
public class ParcialK {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Programador p1 = new Programador("Roberto jr",2,200,6,"JavaScript");
        Programador p2 = new Programador("Martin jr",3,210,2,"Java");
        Programador p3 = new Programador("Negro jr",5,600,60,"C++");
        Programador p4 = new Programador("Joaquin jr",8,710,61,"C");
        Programador p5 = new Programador("Gonzalo jr",20,202,23,"SpringBoot");
        Programador p6 = new Programador("Sofia jr",64,321,4,"React");
        ProgramadorLider pL = new ProgramadorLider(5,3,"Roberto",1,101,10,"Python");
        Empresa empresa = new Empresa(pL,10, "Theodor");
        
        empresa.agregarProgramador(p1);
        empresa.agregarProgramador(p2);
        empresa.agregarProgramador(p3);
        empresa.agregarProgramador(p4);
        empresa.agregarProgramador(p5);
        empresa.agregarProgramador(p6);
        empresa.aumentarSueldos(100);
        System.out.println("Entró al main");
        System.out.print(empresa.toString());
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ParcialL;

/**
 *
 * @author theol
 */
public abstract class Sistema {
    private Carrera carrera;
    private int dimF;
    private int [][]egresados;

    public Sistema(Carrera carrera, int dimF) {
        this.carrera = carrera;
        this.dimF = dimF - this.carrera.getYear()+1;
        this.egresados = new int [this.dimF][4];
        for(int i=0; i<this.dimF; i++){
            for(int j=0;j<4;i++){
                this.egresados[i][j] = -1;
            }
        }
    }

    public void registrarEgresados(int year, int trim, int egres){
        this.egresados[year][trim-1]=egres;
    }

    public int obtenerEgresados(int year, int trim){
        return this.egresados[year][trim-1];
    }
    
    public int cantEgresadorPorXTrimestre(int egres){
        int cant = 0;
        for(int i=0; i<dimF;i++){
            for(int j=1; i<4;i++){
                if(obtenerEgresados(i,j) == egres){
                    cant++;
                }
            }
        }
        return  egres;
    }
    
    public Carrera getCarrera() {
        return carrera;
    }

    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }


    @Override
    public abstract String toString();
    
    
}

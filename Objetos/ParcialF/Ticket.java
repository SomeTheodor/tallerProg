/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ParcialF;

/**
 *
 * @author theol
 */
public class Ticket {
    private int numTicket;
    private int dni;
    private int cantLibros;
    private double monto;
    private String metodo;

    public Ticket(int numTicket, int dni, int cantLibros, double monto, String metodo) {
        this.numTicket = numTicket;
        this.dni = dni;
        this.cantLibros = cantLibros;
        this.monto = monto;
        this.metodo = metodo;
    }
    
    public int getNumTicket() {
        return numTicket;
    }

    public void setNumTicket(int numTicket) {
        this.numTicket = numTicket;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getCantLibros() {
        return cantLibros;
    }

    public void setCantLibros(int cantLibros) {
        this.cantLibros = cantLibros;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }

    @Override
    public String toString() {
        return  "["  + numTicket  + ", " + dni + ", " + cantLibros + ", " + monto + ", " + metodo +"]";
    }
    
    
}

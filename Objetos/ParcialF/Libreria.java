/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ParcialF;

/**
 *
 * @author theol
 */
public class Libreria {
    private String nombre;
    private int numVentas;
    private Caja [] cajas = new Caja[4];

    public Libreria(String nombre, int numTickets) {
        this.nombre = nombre;
        this.numVentas = 0;
        for(int i=0;i<4;i++){
            this.cajas[i] = new Caja(numTickets);
        }
    }
    
    public Ticket montoTicketGrande(){
        Ticket ticket =this.cajas[0].montoMasGrande();
        for(int i=1;i<4;i++){
            Ticket ticket2 = this.cajas[i].montoMasGrande();
            if(ticket.getMonto() < ticket2.getMonto()){
                ticket = ticket2;
            }
        }
        return ticket;
    }
    
    
    public void cerrarCajas(int x){
        for(int i=0;i<4;i++){
            if(this.cajas[i].cantLibros()< x){
                this.cajas[i].setDisponible(false);
            }
        }
    }
    
    public void cargarTicket(int caja, int dni, int cantLibros, double monto, String metodo){
        this.cajas[caja].generarTicket(this.numVentas,dni,cantLibros,monto, metodo);
        this.numVentas++;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumVentas() {
        return numVentas;
    }

    public void setNumVentas(int numVentas) {
        this.numVentas = numVentas;
    }

    @Override
    public String toString() {
        String msj = "Libreria: " + nombre;
        for(int i=0;i<4;i++){
            msj+= "Caja " + i + this.cajas[i].toString();
        }
        return msj;
    }
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ParcialF;

/**
 *
 * @author theol
 */
public class Caja {
    private boolean disponible;
    private int dimF;
    private int dimL=0;
    private Ticket [] tickests;

    public Caja(int dimF) {
        this.disponible = true;
        this.dimF = dimF;
        this.tickests = new Ticket [dimF];
    }
    
    public Ticket montoMasGrande(){
        double max=0;
        Ticket ticket = null;
        for(int i=0; i<dimL;i++){
            if(this.tickests[i].getMonto()> max){
                max = this.tickests[i].getMonto();
                ticket = this.tickests[i];
            }
        }
        return ticket;
    }
    
    public int cantLibros(){
        int cant=0;
        for(int i=0; i<dimL; i++){
            cant+= this.tickests[i].getCantLibros();
        }
        return cant;
    }
    
    public void generarTicket(int numTicket, int dni, int cantLibros,double monto,String metodo){
        this.tickests[dimL] = new Ticket(numTicket,dni,cantLibros, monto,metodo);
        this.dimL++;
    }
    
    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public Ticket[] getTickests() {
        return tickests;
    }

    public void setTickests(Ticket[] tickests) {
        this.tickests = tickests;
    }

    @Override
    public String toString() {
        String msj = "No disponible";
        if(isDisponible()){
            msj= "Disponible";
        }
        msj+="; Tickets emitidos: ";
        for(int i=0;i<dimL;i++){
            msj+= this.tickests[i].toString() ;
        }
        return msj;
    }
    
    
}

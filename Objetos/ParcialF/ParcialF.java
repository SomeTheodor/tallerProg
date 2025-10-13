/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ParcialF;

/**
 *
 * @author theol
 */
public class ParcialF {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Libreria libreria = new Libreria("Theodoros",10);
        libreria.cargarTicket(2, 1, 10, 1000, "debito");
        libreria.cargarTicket(1, 21, 12, 2000, "efectivo");
        libreria.cargarTicket(3, 3545, 10, 3100, "credito");
        libreria.cargarTicket(3, 42, 2, 1030, "debito");
        libreria.cargarTicket(0, 2, 2, 5000, "efectivo");
        
        Ticket ticketMayor = libreria.montoTicketGrande();
        libreria.cerrarCajas(11);
        System.out.print(ticketMayor.toString());
        System.out.print(libreria.toString());
    }
    
}

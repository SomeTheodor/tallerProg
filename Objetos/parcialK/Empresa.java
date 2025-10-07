package parcialk;

/**
 *
 * @author Alumno
 */
public class Empresa {
    private ProgramadorLider lider;
    private int dimF;
    private int dimL =0;
    private Programador [] programadores;

    public Empresa(ProgramadorLider lider, int dimF) {
        this.lider = lider;
        this.dimF = dimF;
        this.programadores = new Programador[dimF];
        for(int i=0; i<dimF; i++){
            this.programadores[i] = null;
        }
    }
    
    public void agregarProgramador(Programador programador){
        this.programadores[dimL] = programador;
        this.dimL++;
    }
    
    public void aumentarSueldos(double m){
        this.lider.subirSueldo(m);
        for(int i=0;i<dimL;i++){
            this.programadores[i].subirSueldo(m);
        }
    }
    
    public ProgramadorLider getLider() {
        return lider;
    }

    public void setLider(ProgramadorLider lider) {
        this.lider = lider;
    }

    public Programador[] getProgramadores() {
        return programadores;
    }

    public void setProgramadores(Programador[] programadores) {
        this.programadores = programadores;
    }

    @Override
    public String toString() {
        return "Empresa{" + "lider=" + lider + ", dimF=" + dimF + ", dimL=" + dimL + ", programadores=" + programadores + '}';
    }
    
    
}

    }
    
}

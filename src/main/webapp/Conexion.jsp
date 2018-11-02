
<%! public class Partido {
    String juegaEnCasa;
	String juegaFuera;
	boolean[] pronostico = new boolean[3];
    public String getJuegaEnCasa() {
		return this.juegaEnCasa;
    }
	public void setJuegaEnCasa( String _newVal) {
		this.juegaEnCasa = _newVal ;
    }
	public String getJuegaFuera() {
		return this.juegaFuera;
    }
	public void setJuegaFuera( String _newVal) {
		this.juegaFuera = _newVal ;
    }
	public boolean[] getPronostico() {
		return this.pronostico;
	}
    public void setPronostico(boolean[] _newVal) {
        for ( int i = 0; i < 3; i ++ ) {
		  pronostico[i] = _newVal[i];
        }  
    }
}%>
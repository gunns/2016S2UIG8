package administration.service

import administration.score.ScoreAdministration
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List

@Accessors
@Observable
class Pres {


	ScoreAdministration adminCal
	String nombre
	Boolean estaHabilitado
	Date fechaRegistro
	int cantidadCal
	int promedio
	String tipoPrestacion	//Ver si conviene que sea un String u otra manera de diferenciarlos
	
	def consultarCal(){
		List<int> cantCal adminCal.getCalificacionesPara(nombre)
		cantidadCal =cantCal.len
		promedio = cantCal.prom	
	}
}

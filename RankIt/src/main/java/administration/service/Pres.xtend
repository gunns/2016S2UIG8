package administration.service

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.Date
import administration.score.Score

@Accessors
class Pres {


	List<Score> calificaciones
	String nombre
	Boolean estaHabilitado
	Date fechaRegistro
	String tipoPrestacion	//Ver si conviene que sea un String u otra manera de diferenciarlos
}

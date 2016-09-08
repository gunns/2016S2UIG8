package administracion

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.Date

@Accessors
class Prestacion
{
	List<Calificacion> calificaciones
	String nombre
	Boolean estaHabilitado
	Date fechaRegistro
	String tipoPrestacion	//Ver si conviene que sea un String u otra manera de diferenciarlos
}
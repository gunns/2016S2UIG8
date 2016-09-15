package administracion.calificacion

import administracion.prestacion.Prestacion
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import administracion.usuario.Usuario

@Accessors
class Calificacion
{
	Prestacion evaluado
	int puntos
	Date fechaCalificacion
	Usuario user
	Boolean esOfensiva
	
	new()
	{
		puntos = 0
		fechaCalificacion = new Date()	//se inicializa con la fecha actual
	}
}

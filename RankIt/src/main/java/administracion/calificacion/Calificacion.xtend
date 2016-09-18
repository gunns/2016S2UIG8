package administracion.calificacion

import administracion.prestacion.Prestacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable
import administracion.usuario.Usuario

@Observable
@Accessors
class Calificacion
{
	Prestacion evaluado
	int puntos
	DateTime fechaCalificacion = DateTime.now
	Usuario usuario
	Boolean esOfensiva =false
	String descripcion = ""
	
	new()
	{
		puntos = 0
	}
}

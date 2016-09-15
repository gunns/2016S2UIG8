package administracion.usuario

import administracion.calificacion.Calificacion
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

class Usuario
{
	String nombre
	Date fechaRegistro
	Boolean estaActivo
	List<Calificacion> calificaciones
	String contraseña
}

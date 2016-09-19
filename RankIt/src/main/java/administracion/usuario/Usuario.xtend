package administracion.usuario

import administracion.calificacion.Calificacion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Usuario
{
	String nombre
	DateTime fechaRegistro = DateTime.now
	Boolean estaActivo =true
	Boolean baneado= false
	List<Calificacion> calificaciones = newArrayList
	String contraseña 

	new(String nombre,String passw){
		this.nombre = nombre
		fechaRegistro = DateTime.now
		estaActivo=true
		baneado=false
		calificaciones= newArrayList
		contraseña=passw
	}	
}

package administration.score

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.Date
import administration.user.User

@Accessors
class Score
{
	List<Prestacion> evaluados
	int puntos
	Date fechaCalificacion
	User user
	Boolean esOfensiva
	
	new()
	{
		evaluados = newArrayList
		puntos = 0
		fechaCalificacion = new Date()	//se inicializa con la fecha actual
	}
}
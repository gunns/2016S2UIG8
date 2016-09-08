package administration.score

import administration.service.Pres
import administration.user.User
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Score
{
	Pres evaluado
	int puntos
	Date fechaCalificacion
	User user
	Boolean esOfensiva
	
	new()
	{
		puntos = 0
		fechaCalificacion = new Date()	//se inicializa con la fecha actual
	}
}
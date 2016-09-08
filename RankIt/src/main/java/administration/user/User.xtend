package administration.user

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import java.util.List
import administration.score.Score

@Accessors

class User
{
	String nombre
	Date fechaRegistro
	Boolean estaActivo
	List<Score> calificaciones
	String contraseña
}
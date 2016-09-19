package administracion.dummy

import administracion.prestacion.Prestacion
import java.util.ArrayList
import org.joda.time.DateTime
import administracion.usuario.Usuario

class DummyData {
	def crearPlaceDummy(){
		var pam = new ArrayList<Prestacion>
		pam.add(new Prestacion()=>[
			freg = DateTime.now
			nombre = "Pizzeria Los HDP"
			habilitado = true
		])
		pam.add(new Prestacion()=>[
			freg = DateTime.now.minusDays(3)
			nombre = "Pizzeria Los forros"
			habilitado = true
		])
		pam.add(new Prestacion()=>[
			freg = DateTime.now.minusMonths(2)
			nombre = "Pizzeria Los concha"
			habilitado = true
		])
		pam
	}
	
	def crearUsuarios(){
		var usuarios = new ArrayList<Usuario>
		usuarios.add(new Usuario("Gustavo","gunns"))
		usuarios.add(new Usuario("Leonardo","123"))
		usuarios.add(new Usuario("Chu","1"))
		usuarios
	}
}
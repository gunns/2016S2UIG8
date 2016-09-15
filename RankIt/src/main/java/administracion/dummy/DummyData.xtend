package administracion.dummy

import administracion.prestacion.Prestacion
import java.util.ArrayList
import org.joda.time.DateTime

class DummyData {
	def crearPlaceDummy(){
		var pam = new ArrayList<Prestacion>
		pam.add(new Prestacion()=>[
			freg = DateTime.now
			nombre = "Pizzeria Los HDP"
			habilitado = false
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
}
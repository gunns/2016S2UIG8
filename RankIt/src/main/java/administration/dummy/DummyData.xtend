package administration.dummy

import administration.place.Place
import java.util.ArrayList
import org.joda.time.DateTime

class DummyData {
	def crearPlaceDummy(){
		var pam = new ArrayList<Place>
		pam.add(new Place()=>[
			registerDate = DateTime.now
			name = "Pizzeria Los HDP"
			enabled = true
		])
		pam.add(new Place()=>[
			registerDate = DateTime.now.minusDays(3)
			name = "Pizzeria Los forros"
			enabled = true
		])
		pam.add(new Place()=>[
			registerDate = DateTime.now.minusMonths(2)
			name = "Pizzeria Los concha"
			enabled = true
		])
		pam
	}
}
package appModel

import administration.place.Place
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class PlaceAdminModel {
		List<Place> places = new ArrayList<Place>
		List<Place> services = new ArrayList<Place>
		Place selectedP
		Place selectedS
		String search
		
		def addPlace(Place p){
			this.places.add(p)
		}
		
}
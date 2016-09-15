package administration.place

import java.util.LinkedList
import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable

@Observable
class PlaceAdministration {
	
	LinkedList<Place> places
	Integer id
	
	new(){
		this.places = new LinkedList<Place>
		this.id = 0
	} 
	
	def add(DateTime freg,String name, Boolean enabled ){
		var place = new Place(freg,name,enabled,this.id)
		this.places.add(place)
		this.id =this.id + 1
		
	}
	
	def editreg(Integer id, DateTime newreg){
		var place = this.places.findFirst[it.id == id]
		place.registerDate = newreg
	}
	
	def show(String text){
		var placesToShow = this.places.filter[it.name.contains(text)]
		return placesToShow
	}
}
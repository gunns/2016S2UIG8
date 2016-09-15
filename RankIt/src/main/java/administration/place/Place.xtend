package administration.place

import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable

@Observable
class Place {
	@Accessors DateTime registerDate
	@Accessors String name
	@Accessors Boolean enabled
	Integer id
	
	new(DateTime registerDate,String name,Boolean enabled,Integer id){
	this.registerDate = registerDate
	this.name = name
	this.enabled = enabled
	this.id = id
	}
	
	new() {
	}
	
	
	def getId(){
		return this.id
		}
}

	
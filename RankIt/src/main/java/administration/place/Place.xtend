package administration.place

import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors

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
	
	def getId(){
		return this.id
		}
}

	
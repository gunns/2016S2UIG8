package administracion.prestacion

import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable

@Observable
class Prestacion {
	@Accessors DateTime freg
	@Accessors String nombre
	@Accessors Boolean habilitado
	Integer id
	
	new(DateTime freg,String nombre,Boolean habilitado,Integer id){
	this.freg = freg
	this.nombre = nombre
	this.habilitado = habilitado
	this.id = id
	}
	
	new() {
		this.nombre=""
		this.habilitado=false
	}
	
	
	def getId(){
		return this.id
		}
}

	
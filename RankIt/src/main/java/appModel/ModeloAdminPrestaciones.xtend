package appModel

import administracion.prestacion.Prestacion
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class ModeloAdminPrestaciones {
		List<Prestacion> lugares = new ArrayList<Prestacion>
		List<Prestacion> servicios = new ArrayList<Prestacion>
		Prestacion lugarSeleccionado
		Prestacion servicioSeleccionado
		String busqueda
		
		def addPlace(Prestacion p){
			this.lugares.add(p)
		}
		
}
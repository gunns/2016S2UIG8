package appModel

import administracion.prestacion.Prestacion
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Observable
@Accessors
class ModeloAdminPrestaciones {
		List<Prestacion> lugares = new ArrayList<Prestacion>
		List<Prestacion> servicios = new ArrayList<Prestacion>
		Prestacion lugarSeleccionado =new Prestacion()
		Prestacion servicioSeleccionado = new Prestacion()
		String busquedaL = ""
		String busquedaS = ""


	
	
		def agregarServicio(Prestacion p){
			this.servicios.add(p)
		}
		
		def actualizarIHD(){
			ObservableUtils.firePropertyChanged(this,"buscarL")
			ObservableUtils.firePropertyChanged(this,"habilitadosL")
			ObservableUtils.firePropertyChanged(this,"deshabilitadosL")
		}
		
		// ---------------------------------------------LUGAREES------------------------------------------------
		def agregarLugar(Prestacion p){
			this.lugares.add(p)
		}
		
		def habilitadosL(){
			var copy =this.buscarL().filter[it | it.habilitado]
			copy.size
		}
		
		def deshabilitadosL(){
			this.buscarL().size - this.habilitadosL
		}
		
		def setBusquedaL(String s){
			busquedaL = s
			actualizarIHD()
		}
		
		def buscarL(){
				this.lugares.filter[it | it.nombre.contains(busquedaL)].toList
		}
		
		def habilitarSeleccionadoL(){
			if(lugarSeleccionado.habilitado){
				lugarSeleccionado.habilitado = false
			} else {lugarSeleccionado.habilitado = true}
			actualizarIHD
			lugarSeleccionado.habilitado
		}
		
		def eliminarL(){
			if (lugares.size > 0){
				this.lugares.remove(lugarSeleccionado)
				}
				if (lugares.size >0){
				lugarSeleccionado=lugares.get(0)
				}
				else{
					new Prestacion()
				}
			
			actualizarIHD
		}
		
		// ------------------------------- FIN LUGARES -------------------------------------
}
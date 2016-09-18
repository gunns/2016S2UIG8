package appModel

import administracion.prestacion.Prestacion
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import javax.print.attribute.standard.PresentationDirection

@Observable
@Accessors
class ModeloAdminPrestaciones {
		List<Prestacion> lugares = new ArrayList<Prestacion>
		List<Prestacion> servicios = new ArrayList<Prestacion>
		Prestacion lugarSeleccionado =new Prestacion()
		Prestacion servicioSeleccionado = new Prestacion()
		String busquedaL = ""
		String busquedaS = ""
		Prestacion nuevoL = new Prestacion
		Prestacion nuevoS = new Prestacion


		//------------------------------------------SERVICIOS-----------------------------------------
	
		def agregarServicio(Prestacion p){
			this.servicios.add(p)
		}
		
		def habilitadosS(){
			var copy =this.buscarS().filter[it | it.habilitado]
			copy.size
		}
		
		def deshabilitadosS(){
			this.buscarS().size - this.habilitadosS
		}
		
		def setBusquedaS(String s){
			busquedaS = s
			actualizarIHD()
		}
		
		def buscarS(){
				this.servicios.filter[it | it.nombre.contains(busquedaS)].toList
		}
		
		def habilitarSeleccionadoS(){
			if(servicioSeleccionado.habilitado){
				servicioSeleccionado.habilitado = false
			} else {servicioSeleccionado.habilitado = true}
			actualizarIHD
			servicioSeleccionado.habilitado
		}
		
		def eliminarS(){
			if (servicios.size > 0){
				this.servicios.remove(servicioSeleccionado)
				}
				if (lugares.size >0){
				servicioSeleccionado=servicios.get(0)
				}
				else{
					new Prestacion()
				}
			
			actualizarIHD
		}

	
		def agregarS(){
			this.servicios.add(nuevoS)
			this.nuevoS = new Prestacion()
			actualizarIHD
		}
		//<< ----------------------------------------FIN SERVICIOS------------------------------------
		
		def actualizarIHD(){
			ObservableUtils.firePropertyChanged(this,"buscarL")
			ObservableUtils.firePropertyChanged(this,"habilitadosL")
			ObservableUtils.firePropertyChanged(this,"deshabilitadosL")
			ObservableUtils.firePropertyChanged(this,"buscarS")
			ObservableUtils.firePropertyChanged(this,"habilitadosS")
			ObservableUtils.firePropertyChanged(this,"deshabilitadosS")
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
		
		def agregarL(){
			this.lugares.add(nuevoL)
			this.nuevoL = new Prestacion()
			actualizarIHD
		}
		
		// ------------------------------- FIN LUGARES -------------------------------------
}
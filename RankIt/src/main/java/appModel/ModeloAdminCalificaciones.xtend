package appModel

import administracion.calificacion.Calificacion
import administracion.usuario.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class ModeloAdminCalificaciones {
	List<Calificacion> calificaciones =new ArrayList<Calificacion>
	String usuario= ""
	String evaluado= ""
	Calificacion calificacionSeleccionada = new Calificacion
	Calificacion nuevaCalificacion = new Calificacion
	Usuario admin = new Usuario()=>[
		nombre="ADMIN"
		fechaRegistro = DateTime.now
		estaActivo =true
		calificaciones = newArrayList
		contraseña="123" 
	]
	
		def agregarCalificacion(){
		this.calificaciones.add(nuevaCalificacion)
	}
	
	def actualizar(){
		ObservableUtils.firePropertyChanged(this,"buscar")
		ObservableUtils.firePropertyChanged(this,"ofensiva")
		}
		
		
	def ofensiva(){
		var copy =this.buscar().filter[it | it.esOfensiva]
		copy.size
	}
	
	def buscar(){
				this.calificaciones.filter[it | it.usuario.nombre.contains(usuario)&& it.evaluado.nombre.contains(evaluado)].toList
		}
		
		def ofensivoSeleccionado(){
			if(calificacionSeleccionada.esOfensiva){
				calificacionSeleccionada.esOfensiva = false
			} else {calificacionSeleccionada.esOfensiva = true}
			actualizar
			calificacionSeleccionada.esOfensiva
	}
	
	def agregar(){
		
			calificaciones.add(nuevaCalificacion)
			nuevaCalificacion = new Calificacion
			nuevaCalificacion.usuario = admin
			actualizar
		}
}
package appModel

import administracion.usuario.Usuario
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import administracion.dummy.DummyData

@Observable
@Accessors
class ModeloAdminUsuarios {
	
	List<Usuario> usuarios
	Usuario usuarioSeleccionado
	String buscarNombre=""
	
	def activos(){
		usuarios.filter[ u | u.estaActivo].toList
	}
	
	def inactivos(){
		usuarios.filter[ u | ! u.estaActivo].toList
	}
	
	def baneados(){
		usuarios.filter[ u | u.baneado].toList
	}
	
	
	
	def actualizarRegistro(){
		ObservableUtils.firePropertyChanged(this,"filtrar")
		ObservableUtils.firePropertyChanged(this,"activos")
		ObservableUtils.firePropertyChanged(this,"inactivos")
		ObservableUtils.firePropertyChanged(this,"baneados")
	}
	
	def setBuscarNombre(String nombre){
		buscarNombre = nombre
		actualizarRegistro
	}
	
	def filtrar(){
		usuarios.filter[ user | user.nombre.contains(buscarNombre)].toList	
	}
	
	def agregarUsuario(Usuario user){
		usuarios.add(user)
	}
}
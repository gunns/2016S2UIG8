package view

import administracion.dummy.DummyData
import appModel.ModeloMenu
import appModel.ModeloAdminCalificaciones
import appModel.ModeloAdminPrestaciones
import appModel.ModeloAdminUsuarios
import org.uqbar.arena.Application

class RankItApplication extends Application {

	override protected createMainWindow() {
		val modelo = new ModeloMenu
		modelo.adminPres = new ModeloAdminPrestaciones => [
			lugares = new DummyData().crearPlaceDummy
			lugarSeleccionado = lugares.get(0)
		]
		modelo.adminCal = new ModeloAdminCalificaciones
		modelo.adminUsuarios = new ModeloAdminUsuarios =>[
			usuarios = new DummyData().crearUsuarios
			usuarioSeleccionado = usuarios.get(0)
		]
		new VentanaMenu(this, modelo)
	}

	def static void main(String[] args) {
		new RankItApplication().start()
	}

}

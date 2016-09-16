package view

import administracion.prestacion.Prestacion
import appModel.ModeloAdminPrestaciones
import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class VentanaLugares extends SimpleWindow<ModeloAdminPrestaciones> {
	
	new(WindowOwner parent, ModeloAdminPrestaciones model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createMainTemplate(Panel mainPanel){
		
		this.title = "Rank-IT --> Adm Lugares"
		
		
		new Label(mainPanel).text = "Resumen de situación:"
		
		
		// Panel Horizontal superior >>>>>>>>
		var Panel primerPanel = new Panel(mainPanel)
		primerPanel.layout = new HorizontalLayout
		
		this.crearEtiqueta(primerPanel,"Lugares inscriptos: ")
		
		new Label (primerPanel)=>[
			bindValueToProperty="lugares.size"
			foreground = Color.BLUE
		]
		
		this.crearEtiqueta(primerPanel,"Habilitados: ")
		
		new Label (primerPanel)=>[
			bindValueToProperty="habilitados"
			foreground = Color.BLUE
		]
		
		this.crearEtiqueta(primerPanel,"Deshabilitados:")
		
		new Label (primerPanel)=>[
			bindValueToProperty="deshabilitados"	
			foreground = Color.RED
		]
		
		// << Fin Panel Horizontal superior 
		
		// Inicio del panel divisor de la tabla y los datos >>
		var Panel segundoPanel = new Panel(mainPanel)
		segundoPanel.layout = new ColumnLayout(2)
		var Panel primeraColumna = new Panel(segundoPanel)
		var Panel segundaColumna = new Panel (segundoPanel)
		//Tablero >>
		
		
		
		//<< Tablero
		this.crearTablero(segundaColumna)
		//>> Datos
		//var Panel thirdPanel = new Panel(secondPanel)
		

		//<< Datos
		
		//Panel vertical >>
		var Panel tercerPanel = new Panel(primeraColumna)
		
		
		//Panel Horizontal dentro del vertical Nombre: <NombreLugar> >>
		var Panel cuartoPanel = new Panel(tercerPanel)
		cuartoPanel.layout = new HorizontalLayout
		this.crearEtiqueta(cuartoPanel,"Nombre: ")
		new Label (cuartoPanel)=>[
			bindValueToProperty="lugarSeleccionado.nombre"
		]
		
		//var Panel fourthPanel = new Panel(thirdPanel)
		//fourthPanel.layout = new HorizontalLayout
		
		//new Label(firstPanel).text = "Nombre: "
		//anew Label(fourthPanel).text = "Sushi Pop"
	}
	
	
	
	def crearTablero(Panel param){
		new Label(param).text = ""
		
		var tabla = new Table<Prestacion>(param,Prestacion) => [
			items <=> "lugares"
			value <=> "lugarSeleccionado"
		]
		
		new Column(tabla)=>[
			title= "Fecha"
			bindContentsToProperty("freg")
		]
		
		new Column(tabla)=>[
			title= "Nombre"
			bindContentsToProperty("nombre")	
		]
		
		new Column(tabla)=>[
			title = "Habilitado"
			bindContentsToProperty("habilitado")
		]
		
	}
	
	def crearEtiqueta(Panel paramPanel, String text){
		new Label (paramPanel).text = text
	}
}
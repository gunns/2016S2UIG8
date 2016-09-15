package view

import administration.place.Place
import appModel.PlaceAdminModel
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

class PlaceWindow extends SimpleWindow<PlaceAdminModel> {
	
	new(WindowOwner parent, PlaceAdminModel model) {
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
		var Panel firstPanel = new Panel(mainPanel)
		firstPanel.layout = new HorizontalLayout
		
		this.crearEtiqueta(firstPanel,"Lugares inscriptos: ")
		
		var ins = new Label (firstPanel).text= "10 (ej)"
		ins.foreground = Color.BLUE
		
		this.crearEtiqueta(firstPanel,"Habilitados: ")
		
		var hab = new Label (firstPanel).text= "2 (ej)"
		hab.foreground = Color.BLUE
		
		this.crearEtiqueta(firstPanel,"Deshabilitados:")

		var des = new Label (firstPanel).text= "8(ej)"
		des.foreground = Color.RED
		
		// << Fin Panel Horizontal superior 
		
		// Inicio del panel divisor de la tabla y los datos >>
		var Panel secondPanel = new Panel(mainPanel)
		secondPanel.layout = new ColumnLayout(2)
		var Panel firstColumn = new Panel(secondPanel)
		var Panel secondColumn = new Panel (secondPanel)
		//Tablero >>
		
		
		
		//<< Tablero
		this.crearTablero(secondColumn)
		//>> Datos
		//var Panel thirdPanel = new Panel(secondPanel)
		

		//<< Datos
		var Panel thirdPanel = new Panel(firstColumn)
		this.crearEtiqueta(thirdPanel,"Nombre")
		
		//var Panel fourthPanel = new Panel(thirdPanel)
		//fourthPanel.layout = new HorizontalLayout
		
		//new Label(firstPanel).text = "Nombre: "
		//anew Label(fourthPanel).text = "Sushi Pop"
	}
	
	
	
	def crearTablero(Panel param){
		new Label(param).text = ""
		
		var tabla = new Table<Place>(param,Place) => [
			items <=> "places"
			value <=> "selectedP"
		]
		
		new Column(tabla)=>[
			title= "Fecha"
			bindContentsToProperty("registerDate")
		]
		
		new Column(tabla)=>[
			title= "Nombre"
			bindContentsToProperty("name")	
		]
		
		new Column(tabla)=>[
			title = "Habilitado"
			bindContentsToProperty("enabled")
		]
		
	}
	
	def crearEtiqueta(Panel paramPanel, String text){
		var lab =new Label (paramPanel).text = text
	}
}
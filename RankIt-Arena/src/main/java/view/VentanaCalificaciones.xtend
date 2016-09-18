package view

import administracion.calificacion.Calificacion
import appModel.ModeloAdminCalificaciones
import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class VentanaCalificaciones extends SimpleWindow<ModeloAdminCalificaciones> {
	
	new(WindowOwner parent, ModeloAdminCalificaciones model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createMainTemplate(Panel mainPanel){
		
		this.title = "Rank-IT --> Adm Calificaciones"
		
		
		new Label(mainPanel).text = "Resumen de situación:"
		
		
		// Panel Horizontal superior >>>>>>>>
		var Panel primerPanel = new Panel(mainPanel)
		primerPanel.layout = new HorizontalLayout
		
		this.crearEtiqueta(primerPanel,"Calificaciones Registradas: ")
		
		new Label (primerPanel)=>[
			bindValueToProperty="buscar.size"
			foreground = Color.BLUE
		]
		
		this.crearEtiqueta(primerPanel,"Ofensivos: ")
		
		new Label (primerPanel)=>[
			bindValueToProperty="ofensiva"
			foreground = Color.RED
		]
		
		// << Fin Panel Horizontal superior 
		
		var Panel lugares =new Panel(mainPanel).layout = new HorizontalLayout
		crearEtiqueta(lugares, "Calificaciones")
		
		
		// Panel de Busqueda >>
		
		var Panel panelDeBusqueda = new Panel (mainPanel)
		panelDeBusqueda.layout = new HorizontalLayout	
		crearEtiqueta(panelDeBusqueda,"Usuario")
		new TextBox(panelDeBusqueda)=>[
			bindValueToProperty= "usuario"
		]
		crearEtiqueta(panelDeBusqueda,"evaluado")
		new TextBox(panelDeBusqueda)=>[
			bindValueToProperty= "evaluado"
		]
		
		
		//<< fin Panel de Busqueda
		
		// Inicio del panel divisor de la tabla y los datos >>
		var Panel segundoPanel = new Panel(mainPanel)
		segundoPanel.layout = new ColumnLayout(2)
		var Panel primeraColumna = new Panel(segundoPanel)
		var Panel segundaColumna = new Panel (segundoPanel)
		//Tablero >>
		
		
		
		//<< Tablero
		var Panel panelDeTablero = new Panel(segundaColumna)
		
		this.crearTablero(panelDeTablero)
		
		new Button(panelDeTablero) =>[
			caption = "Nuevo"
			onClick [ | new NuevaCalificacionWindow(this, this.modelObject).open]
		]
		
		//>> Datos
		//var Panel thirdPanel = new Panel(secondPanel)
		

		//<< Datos
		
		//Panel vertical >>
		var Panel tercerPanel = new Panel(primeraColumna)
		
		crearTercerPanel(tercerPanel)
		
	}
	
	def crearTercerPanel(Panel param){
		var Panel primeroPanel = new Panel(param)
		primeroPanel.layout = new HorizontalLayout
		this.crearEtiqueta(primeroPanel, "Nombre: ")
		new Label(primeroPanel) =>[
			bindValueToProperty("calificacionSeleccionada.evaluado")
		]
		
		this.crearEtiqueta(param, "Nombre")
		new TextBox(param) =>[
			
			bindValueToProperty="calificacionSeleccionada.evaluado"	 
		]
		var Panel segundoPanel = new Panel(param)
		segundoPanel.layout = new HorizontalLayout
		crearEtiqueta(segundoPanel,"Contenido Ofensivo")
		new CheckBox(segundoPanel)=>[
			value <=> "ofensiva"
		]
		var Panel tercerPanel = new Panel(param)
		
	
		new Button(tercerPanel)=>[
			caption = "Eliminar"
			onClick [ | ]
		]
	}
	
	def crearColumna(Panel param,String text1, String property){
		var Panel primerPanel = new Panel(param)
		primerPanel.layout = new ColumnLayout(2)
		crearEtiqueta(primerPanel,text1)
		new Label(primerPanel).bindValueToProperty(property)
	}
	
	def crearTablero(Panel param){
		new Label(param).text = ""
		
		var tabla = new Table<Calificacion>(param,Calificacion) => [
			items <=> "buscar"
			value <=> "calificacionSeleccionada"
		]
		
		new Column(tabla)=>[
			title= "Evaluado"
			bindContentsToProperty("evaluado")
		]
		
		new Column(tabla)=>[
			title= "Puntos"
			bindContentsToProperty("puntos")	
		]
		
		new Column(tabla)=>[
			title= "Fecha"
			bindContentsToProperty("fechaCalificacion")	
		]
		
		new Column(tabla)=>[
			title= "User"
			bindContentsToProperty("usuario")	
		]
		new Column(tabla)=>[
			title = "Es Ofensiva"
			bindContentsToProperty("esOfensiva")
		]
		
	}
	
	def crearEtiqueta(Panel paramPanel, String text){
		new Label (paramPanel).text = text
	}
}
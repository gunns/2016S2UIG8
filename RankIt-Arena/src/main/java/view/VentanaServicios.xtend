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
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox

class VentanaServicios extends SimpleWindow<ModeloAdminPrestaciones> {
	
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
		
		this.title = "Rank-IT --> Adm Servicios"
		
		
		new Label(mainPanel).text = "Resumen de situación:"
		
		
		// Panel Horizontal superior >>>>>>>>
		var Panel primerPanel = new Panel(mainPanel)
		primerPanel.layout = new HorizontalLayout
		
		this.crearEtiqueta(primerPanel,"Lugares inscriptos: ")
		
		new Label (primerPanel)=>[
			bindValueToProperty="buscarS.size"
			foreground = Color.BLUE
		]
		
		this.crearEtiqueta(primerPanel,"Habilitados: ")
		
		new Label (primerPanel)=>[
			bindValueToProperty="habilitadosS"
			foreground = Color.BLUE
		]
		
		this.crearEtiqueta(primerPanel,"Deshabilitados:")
		
		new Label (primerPanel)=>[
			bindValueToProperty="deshabilitadosS"	
			foreground = Color.RED
		]
		
		// << Fin Panel Horizontal superior 
		
		var Panel lugares =new Panel(mainPanel).layout = new HorizontalLayout
		crearEtiqueta(lugares, "Servicios")
		
		
		// Panel de Busqueda >>
		
		var Panel panelDeBusqueda = new Panel (mainPanel)
		panelDeBusqueda.layout = new HorizontalLayout	
		crearEtiqueta(panelDeBusqueda,"Buscar por nombre de servicio")
		new TextBox(panelDeBusqueda)=>[
			bindValueToProperty= "busquedaS"
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
			onClick [ | new NuevoServicioWindow(this, this.modelObject).open]
		]
		
		//>> Datos
		//var Panel thirdPanel = new Panel(secondPanel)
		

		//<< Datos
		
		//Panel vertical >>
		var Panel tercerPanel = new Panel(primeraColumna)
		
		
		//Panel Horizontal dentro del vertical Nombre: <NombreLugar> >>
		/*var Panel cuartoPanel = new Panel(tercerPanel)
		cuartoPanel.layout = new HorizontalLayout
		this.crearEtiqueta(cuartoPanel,"Nombre: ")
		new Label (cuartoPanel)=>[
			bindValueToProperty="lugarSeleccionado.nombre"
		]*/
		crearTercerPanel(tercerPanel)
		
	}
	
	def crearTercerPanel(Panel param){
		var Panel primeroPanel = new Panel(param)
		primeroPanel.layout = new HorizontalLayout
		this.crearEtiqueta(primeroPanel, "Nombre: ")
		new Label(primeroPanel) =>[
			bindValueToProperty("servicioSeleccionado.nombre")
		]
		
		this.crearEtiqueta(param, "Nombre")
		new TextBox(param) =>[
			
			bindValueToProperty="servicioSeleccionado.nombre"	 
		]
		var Panel segundoPanel = new Panel(param)
		segundoPanel.layout = new HorizontalLayout
		crearEtiqueta(segundoPanel,"Habilitado")
		new CheckBox(segundoPanel)=>[
			value <=> "habilitarSeleccionadoS"
		]
		var Panel tercerPanel = new Panel(param)
		
		//crearColumna(param,"Rating Promedio","")
		new Button(tercerPanel)=>[
			caption = "Revisar Publicaciones"
			onClick [ | ]
		]
		new Button(tercerPanel)=>[
			caption = "Eliminar"
			onClick [ | modelObject.eliminarS]
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
		
		var tabla = new Table<Prestacion>(param,Prestacion) => [
			items <=> "buscarS"
			value <=> "servicioSeleccionado"
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
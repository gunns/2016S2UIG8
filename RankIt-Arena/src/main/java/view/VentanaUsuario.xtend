package view

import org.uqbar.arena.windows.SimpleWindow
import appModel.ModeloAdminUsuarios
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import javax.xml.ws.Holder
import org.uqbar.arena.widgets.TextBox
import administracion.usuario.Usuario
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import com.ibm.icu.impl.CalendarAstronomer.Horizon
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.CheckBox

class VentanaUsuario extends SimpleWindow<ModeloAdminUsuarios>{
	
	new(WindowOwner parent, ModeloAdminUsuarios model) {
		super(parent, model)
	}
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createMainTemplate(Panel mainPanel){
		this.title = "Rank-IT --> Adm Usuarios"
		
		new Label(mainPanel).text = "Resumen de situacion: "
		
		crearUsuarioRegistros(mainPanel,"","")
		crearPanelBusquedaUsuario(mainPanel)
		
		var Panel panel = new Panel(mainPanel)
		panel.layout = new ColumnLayout(2)
		
		crearTablero(panel)
		crearPanelDatos(panel)
	}
	
	def crearPanelDatos(Panel panel){
		var Panel panelDatos = new Panel(panel)
		crearEtiquetas(panelDatos,"Nombre: ","usuarioSeleccionado.nombre")
		crearEtiquetas(panelDatos,"Fecha de Registro","usuarioSeleccionado.fechaRegistro")
		crearCheckBox(panelDatos,"Activos","usuarioSeleccionado.estaActivo")
		crearCheckBox(panelDatos,"Baneado","usuarioSeleccionado.baneado")
		
		new Button(panelDatos)=>[
			caption="Revisar Publicaciones"
			onClick[|]
		]
		new Button(panelDatos)=>[
			caption="Blanquear clave"
			onClick[|]
		]
		new Button(panelDatos)=>[
			caption="Eliminar"
			onClick[|]
		]
	}
	
	def crearCheckBox(Panel panel, String t, String property){
		var Panel nuevoPanel = new Panel(panel)
		nuevoPanel.layout = new HorizontalLayout
		new Label(nuevoPanel).text = t
		new CheckBox(nuevoPanel)=>[
			value <=> property
		]
	}
	
	def crearEtiquetas(Panel panel, String t, String property){
		var nuevoPanel = new Panel(panel)
		nuevoPanel.layout = new HorizontalLayout
		new Label(nuevoPanel).text = t
		new Label(nuevoPanel).bindValueToProperty(property)
	}
	
	def crearTablero(Panel panel){
		var Panel nuevoPanel = new Panel(panel)
		var tablero = new Table<Usuario>(nuevoPanel,typeof(Usuario)) =>[
			items <=> "filtrar"
			value <=> "usuarioSeleccionado"
		]
		
		crearColumnaBusqueda(tablero,"Fecha Registro","fechaRegistro")
		crearColumnaBusqueda(tablero,"Nombre","nombre")
		crearColumnaBusqueda(tablero,"Activo","estaActivo")
		crearColumnaBusqueda(tablero,"Baneado","baneado")
		
		new Button(nuevoPanel) =>[
			caption= "Nuevo"
			onClick[| ]
		]
	}
	
	def crearColumnaBusqueda(Table table, String t, String property){
		new Column(table)=>[
			title= t
			bindContentsToProperty(property)
		]
	}
	
	def crearPanelBusquedaUsuario(Panel panel){
		new Label(panel).text = "Usuario"
		var Panel panelBusqueda = new Panel(panel)
		panelBusqueda.layout =  new HorizontalLayout
		new Label(panelBusqueda).text = "Buscar por nombre de usuario"
		new TextBox(panelBusqueda)=>[
			bindValueToProperty="buscarNombre"
		]
	}
	
	
	
	def crearUsuarioRegistros(Panel panel, String text, String property){
		
		var Panel primerPanel = new Panel(panel)
		primerPanel.layout = new HorizontalLayout
		crearRegistro(primerPanel,"Usuarios Registrados: ","usuarios.size")
		crearRegistro(primerPanel,"Activos: ","activos.size")
		crearRegistro(primerPanel,"Inactivos","inactivos.size")
		crearRegistro(primerPanel,"Baneados","baneados.size")
	}
	
	def crearRegistro(Panel panel, String text, String property){
		new Label(panel).text = text
		new Label(panel) =>[
			bindValueToProperty=property
		]
	}
}
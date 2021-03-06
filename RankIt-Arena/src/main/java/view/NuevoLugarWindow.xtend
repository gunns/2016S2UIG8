package view

import appModel.ModeloAdminPrestaciones
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button

class NuevoLugarWindow extends Dialog<ModeloAdminPrestaciones>{
	
	new(WindowOwner owner, ModeloAdminPrestaciones model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Crear nuevo Lugar"

		
		new Label(mainPanel).text = "Fecha de registro"
		
		
		crearLabelConTextbox(mainPanel, "Fecha", "nuevoL.freg")
		crearLabelConTextbox(mainPanel, "Nombre", "nuevoL.nombre")
		var Panel panelHorizontal = new Panel(mainPanel)
		panelHorizontal.layout = new HorizontalLayout
		
		new Button(mainPanel)=>[
			caption = "Cancelar"
			onClick [ |
				this.close
				]	
			]
			
		new Button(mainPanel)=>[
			caption = "Aceptar"
			onClick [ |
				this.modelObject.agregarL
				this.close
				]
			]
		
	}
	def crearLabelConTextbox(Panel param, String label, String property){
		var Panel panelHorizontal = new Panel(param)
		panelHorizontal.layout = new HorizontalLayout
		new Label(panelHorizontal).text = label
		new TextBox(panelHorizontal).value <=> property
	}
}
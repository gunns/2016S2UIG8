package view

import appModel.PlaceAdminModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label

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
		
	}
}
package view

import appModel.ModelMenu
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout

class MenuWindow extends SimpleWindow<ModelMenu>{
	
	new(WindowOwner parent, ModelMenu model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createMainTemplate(Panel mainPanel){
		this.title = "Rank-It"
		
		var titulo =new Label(mainPanel).text = "Rank-It! Modulo de administración"
		titulo.fontSize=20
		
		new Label(mainPanel).text = "Desde este modulo vas a poder gestionar los datos y opciones de la aplicación"
		
		new Label(mainPanel).text = "como sos una persona de confianza vas a tener acceso total"
		
		new Label(mainPanel).text = "siempre acordate: con un gran poder viene una gran responsabilidad"
		
		var Panel firstPanel = new Panel(mainPanel)
		firstPanel.layout = new HorizontalLayout
		new Button(firstPanel)=>[
			caption = "Adm Lugares"
			onClick [ |
				new PlaceWindow(this,this.modelObject.placeAdmin).open
				this.close
			]
		]
		new Button(firstPanel)=>[
			caption = "Adm Servicios"
			onClick [ |
				
				this.close
			]
		]
		new Button(firstPanel)=>[
			caption = "Adm Calificacion"
			onClick [ |
				this.close
			]
		]
		new Button(firstPanel)=>[
			caption = "Adm Usuarios"
			onClick [ |
				this.close
			]
		]
	}
	
	def getPlaceWindow(ModelMenu menu) {
		
	}
	
	
}
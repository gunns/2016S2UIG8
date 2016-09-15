package view

import administration.dummy.DummyData
import appModel.ModelMenu
import appModel.PlaceAdminModel
import appModel.ScoreAdminModel
import appModel.UserAdminModel
import org.uqbar.arena.Application

class RankItApplication extends Application {
		
		
	
	
	
	override protected createMainWindow() {
		val model = new ModelMenu
		model.placeAdmin = new PlaceAdminModel=>[
			places = new DummyData().crearPlaceDummy
			selectedP = places.get(0)
		]
		model.scoreAdmin = new ScoreAdminModel
		model.userAdmin = new UserAdminModel
		new MenuWindow(this,model)
	}
	
	
	
	def static void main(String[] args) {
		new RankItApplication().start()
	}
	
}
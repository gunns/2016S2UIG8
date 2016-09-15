package view

import appModel.ModelMenu
import view.MenuWindow
import org.uqbar.arena.Application

class RankItApplication extends Application {
		
		
	
	
	
	override protected createMainWindow() {
		val model = new ModelMenu
		new MenuWindow(this,model)
	}
	
	
	
	def static void main(String[] args) {
		new RankItApplication().start()
	}
	
}
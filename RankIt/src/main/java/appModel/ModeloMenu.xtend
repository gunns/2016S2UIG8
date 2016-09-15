package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class ModeloMenu {
	ModeloAdminPrestaciones adminPres
	ModeloAdminUsuarios adminUsuarios
	ModeloAdminCalificaciones adminCal			
	
}
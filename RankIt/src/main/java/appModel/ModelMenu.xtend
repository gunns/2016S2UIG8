package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class ModelMenu {
	PlaceAdminModel placeAdmin
	UserAdminModel userAdmin
	ScoreAdminModel scoreAdmin			
	
}
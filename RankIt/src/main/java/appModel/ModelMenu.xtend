package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class ModelMenu {
	ServiceAdminModel serviceAdmin
	PlaceAdminModel placeAdmin
	UserAdminModel userAdmin
	ScoreAdminModel scoreAdmin			
	
}
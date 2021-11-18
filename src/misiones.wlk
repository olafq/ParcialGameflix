class Misiones {
	method esUtil(unPirata)
	method cumpleRequisitosExtras(unBarco)
	
	method puedeSerCumplidaPorUn(unBarco){
	return unBarco.tieneSuficienteTripulacion() && self.cumpleRequisitosExtras(unBarco)
	}
	
}

object busquedaDelTesoro inherits Misiones {
	override method esUtil(unPirata){
		return unPirata.tieneAlgunoDe(["brujula" , "mapa" , "botella De GrogXD"]) && unPirata.tieneMenosDineroQue(5)
	}
	 override method cumpleRequisitosExtras(unBarco){
		unBarco.tieneTripulanteCon("Llave de Cofre")
	}
}
	
	
	

class ConvertirseEnLeyenda inherits Misiones{
	const itemNecesario 
	
	override method esUtil(unPirata){
		return unPirata.tieneAlmenosTantosItems(10)  && unPirata.tieneItemNecesario(itemNecesario)
	}
	 
	override method cumpleRequisitosExtras(unBarco){
		return true 
	}
}
object monedasDeSaqueo {
	var property cantidad
}
class Saqueo inherits Misiones {
	const victima 
	override method esUtil(unPirata){
		return unPirata.tieneMenosDineroQue(monedasDeSaqueo.cantidad()) && unPirata.animaASaquearA(victima)
	}
	override method cumpleRequisitosExtras(unBarco){
		return victima.esVulnerableA(unBarco)
	}
}

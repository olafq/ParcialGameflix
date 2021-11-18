
class Pirata {
	 var items = []
	 var nivelDeEbriedad 
	 var property dinero 
	 var piratasInvitados
	
	 method items(){
	 	return items
	 }
	 method nivelDeEbriedad(){
	 	return nivelDeEbriedad
	 }
	
	 method perdesreEnLaCiudad(unaCiudadCostera){
	 	self.quedarseEnCiudadCostera(unaCiudadCostera)
	 }
	 method quedarseEnCiudadCostera(unaCiudadCostera){
	 	unaCiudadCostera.agregarHabitante()
	 }
	 
	method esUtilParaUnaMision(unaMision){
		return unaMision.esUtil(self)
	}
	method irAlBar(){
		self.tomarTragoDeGrogXD() 
		self.gastarUnaMoneda()
	}
	method tomarTragoDeGrogXD(){
		nivelDeEbriedad += 5
	}
	method gastarUnaMoneda(){
		dinero -= 1
	}
	 method tieneAlgunoDe(unosItems){
	 	return unosItems.any({unItem => self.tiene(unItem)})
	 }
	 method tiene(unItem){
	 	return items.contains(unItem)
	 }
	 
	  method tieneMenosDineroQue(unaCantidad){
	  	return self.dinero() < unaCantidad
	  }
	  
	   method tieneAlmenosTantosItems(cantidad) {
	   	return cantidad < self.cantidadDeItems()
	   }
	   method cantidadDeItems(){
	   	return  items.size()
	   }
	   method tieneItemNecesario(itemNecesario){
	   	return self.tiene(itemNecesario)
	   }
	   method animaASaquearA(unaVictima){
	   	return unaVictima.puedeSerSaqueadapor(self)
	   }
	   method estaPasadoDeGrogXd(){
	   	return self.tieneNivelDeEbriedadMayorA(90)
	   }
	   method tieneNivelDeEbriedadMayorA(cantidad){
	   	return self.nivelDeEbriedad() > cantidad
	   }
	   method invitarPirata(unPirata,unBarco){
	   if(self.puedeInvitarA(unPirata,unBarco)){self.agregarPirataInvitado()}
	   }
	   method puedeInvitarA(unPirata,unBarco){
	   	return self.esUtilParaUnaMision(unBarco.misionActual())
	   }
	   method agregarPirataInvitado(){
	   	piratasInvitados += 1
	   }
	   method piratasQueInvito(){
	   	return piratasInvitados
	   }
	  
}

class EspiaDeLaCorona inherits Pirata{
	override method estaPasadoDeGrogXd(){
		return false
	}
	
	override method animaASaquearA(unaVictima){
		return super(unaVictima) && self.tienePermisoDeCorona()
	}

	method tienePermisoDeCorona(){
		return items.contains("permiso de la corona")
	}	
	 }

class BarcoPirata {
	const capacidadDelBarco 
	var tripulantes  = #{}
	var misionActual
	method cambiarDeMision(misionNueva){
		misionActual = misionNueva
		tripulantes.removeAllSuchThat({unPirata => !unPirata.esUtilParaUnaMision(misionActual)})
	}
	method pirataMasEbrioDeLaTripulacion(){
		return tripulantes.max({unTripulante => unTripulante.nivelDeEbriedad()})
	}
	method anclarEn(unaCiudadCostera){
		tripulantes.forEach({unPirata => unPirata.irAlBar()})
		self.perderTripulante(self.pirataMasEbrioDeLaTripulacion())
		self.pirataMasEbrioDeLaTripulacion().perdesreEnLaCiudad(unaCiudadCostera)
	}
	method perderTripulante(unPirata){
		tripulantes.remove(unPirata)	
		}
	method agregarTripulante(unPirata){
		return self.puedeFormarParte(unPirata)
	}
	method puedeFormarParte(unPirata){
		return self.cantidadDeTripulantes()<capacidadDelBarco && unPirata.esUtilParaUnaMision(misionActual)
	}
	method esTemible(){
		return self.puedeCumplirMision(misionActual)
	}
	
	method puedeCumplirMision(unaMision){
		return unaMision.puedeSerCumplidaPorUn(self)
	}
	method tieneSuficienteTripulacion() {
		return self.cantidadDeTripulantes() > 0.9*capacidadDelBarco 
	}
	method tieneTripulanteCon(unItem){
		tripulantes.any({unTripulante => unTripulante.tiene(unItem)})
	}
	method puedeSerSaqueadapor(unPirata){
		return unPirata.estaPasadoDeGrogXd()
	}
	method esVulnerableA(unBarco){
		return unBarco.cantidadDeTripulantes()/2 >= self.cantidadDeTripulantes() 
	}
	method cantidadDeTripulantes(){
		return tripulantes.size()
	}
	method cantidadDeTripulantesPasados(){
		return self.listaDeTripulantesPasados().size()
	}
	method listaDeTripulantesPasados(){
	return tripulantes.filter({unPirata => unPirata.estaPasadoDeGrogXd()})
	}
	method itemsDeTripualntesPasados(){
		const tripulantesPasados = self.listaDeTripulantesPasados()
		return tripulantesPasados.map({unPirata => unPirata.items()}).asSet()
	}
	 method TieneTodaLaTripulacionPasada(){
	 return tripulantes.all({unPirata => unPirata.tieneNivelDeEbriedadMayorA(50)})  	
	   }
	  
	 method tripulanteMasRicoYpasado(){
	 	return self.listaDeTripulantesPasados().max({unPirata => unPirata.dinero()})
	 }
	 method tripulanteQueMasInvito(){
	 	return tripulantes.max({unPirata => unPirata.piratasQueInvito()})
	 }
	 method misionActual(){
	 	return misionActual
	 }
}
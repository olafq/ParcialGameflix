class CiudadCostera {
	var cantidadDeHabitantes
	method puedeSerSaqueadoPor(unPirata){
		return unPirata.tieneNivelDeEbriedadMayorA(50)
	}
	method esVulnearableA(unBarco){
		return self.tieneMenosCantidadDeHabitantesQueTripulantesDe(unBarco) || unBarco.TieneTodaLaTripulacionPasada()
	}
	
	method tieneMenosCantidadDeHabitantesQueTripulantesDe(unBarco){
		return unBarco.cantidadDeTripulantes() > self.cantidadDeHabitantes() * 0.4
	}
	
	method cantidadDeHabitantes(){
		return cantidadDeHabitantes
	}
	method agregarHabitante(){
		cantidadDeHabitantes += 1
	}
	
}

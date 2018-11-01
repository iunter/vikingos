class SubirException inherits Exception{
	
}

class Vikingo{
	var casta
	method tieneArmas()
	method puedeViajar(){
		return  casta.clasePermiteViajar(self.tieneArmas()) && self.esProductivo()
	}
	method ascender(){
		casta = casta.escalar(self)
	}
	method esProductivo()
}

class Soldado inherits Vikingo{
	var cuantosMato
	var cantArmas
	override method tieneArmas() = cantArmas > 0
	override method puedeViajar(){
		return super() && self.esProductivo()
	}
	override method esProductivo(){
		return self.tieneArmas() && (cuantosMato > 20)
	}
	override method ascender(){
		jarl.armar(self)
		super()
	}
}

class Granjero inherits Vikingo{
	var cantHijos
	var hectareasDesignadas
	override method tieneArmas() = false
	override method puedeViajar(){
		return super() && self.esProductivo()
	}
	override method esProductivo(){
		return (cantHijos / hectareasDesignadas) >= 2
	}
}

object jarl{
	method clasePermiteViajar(tieneArmas){
		return !tieneArmas
	}
	method escalar(vikingo){
		vikingo.cambiarCasta(karl)
	}
	method armar(vikingo){
		vikingo.cambiarArmas(10)
	}
}

object karl{
	method clasePermiteViajar(tieneArmas){
		return true
	}
	method escalar(vikingo){
		
	}
}

object thrall{
	method clasePermiteViajar(tieneArmas){
		return true
	}
	method escalar(vikingo){
		
	}
}

class Expedicion{
	var involucrados = []
	var lugares = []
	method valeLaPenaExpedicion(){
		return lugares.all({unLugar => unLugar.valeLaPena(self.cantVikingos())})
	}
	method cantVikingos() = involucrados.size()
}

class Capital{
	var cantDefensores
	var factorRiqueza
	method botin(cantVikingos){
		return (cantVikingos).min(cantDefensores) * factorRiqueza
	}
	method valeLaPena(cantVikingos){
		return (self.botin(cantVikingos) / cantVikingos) >= 3
	}
}

class Aldea{
	var iglesias = []

	method botin() = iglesias.sum({iglesia => iglesia.crucifijos()})
	method valeLaPena(cantVikingos){
		return (self.botin() / cantVikingos) >= 3
	}
}

class AldeaFortificada inherits Aldea{
	var cantMin
	override method valeLaPena(cantVikingos){
		return super(cantVikingos) && (cantVikingos >= cantMin)
	}
}

class Iglesia{
	var crucifijos
	method crucifijos() = crucifijos
}
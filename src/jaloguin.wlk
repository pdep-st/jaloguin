class Ninio {
	
	var actitud
	var property caramelos = 0
	const property elementosPuestos = #{}
	
	method tieneMasDe(n) = self.caramelos() > n
	
	method capacidadDeSusto() {
		return elementosPuestos.sum({
			elemento => elemento.capacidadDeSusto()
		}) * actitud
	} 
	
	method intentarAsustar(adulto) {
		self.incrementarCaramelos(adulto.caramelosPorSusto(self))
	}
	
	method comer(cantidad) {
		if (cantidad > caramelos) {
			self.error("No podes comer tantos caramelos, porque te faltan")
		}
		caramelos -= cantidad
	}
	
	method incrementarCaramelos(cantidad) {
		caramelos += cantidad
	}
	
	method actitud(_actitud) {
		if (_actitud < 1 || _actitud > 10) {
			//self.error("puntos de actitus invalido, solo puede estar entre 1 y 10")
			throw new Exception(message = "puntos de actitus invalido, solo puede estar entre 1 y 10")
		}
		actitud = _actitud
	}
}

class Elemento {
	var property capacidadDeSusto
}

object maquillaje
	inherits Elemento(capacidadDeSusto = 3) {
}

object tierno
	inherits Elemento(capacidadDeSusto = 2) {
}

object terrorifico
	inherits Elemento(capacidadDeSusto = 5) {
}

class Adulto {
	const asustadores = #{}
	
	method asustadoresConCaramelosMayorA(n) = 
		asustadores.filter({ asustador => asustador.tieneMasDe(n) })

	method tolerancia() = 10 * self.asustadoresConCaramelosMayorA(15).size()
	
	method caramelosPorSusto(asustador) {
		asustadores.add(asustador)
		if (self.podesSerAsustado(asustador)) {
			return self.cantidadDeCaramelosADarAsustado()
		} else {
			return 0
		}
	}
	
	method cantidadDeCaramelosADarAsustado() = self.tolerancia() / 2
	
	method podesSerAsustado(asustador) = self.tolerancia() <= asustador.capacidadDeSusto()
}

class Abuelo inherits Adulto {
	override method cantidadDeCaramelosADarAsustado() = super() / 2
	override method podesSerAsustado(asustador) = true
}

object adultoNecio {
	method caramelosPorSusto(asustador) = 0
}

object creadorLegion { 
	method crear(ninios) {
		if (ninios.size() < 2) {
			self.error("no podes crear una legion con " + ninios.size().toString() + " ninios")
		} 
		return new Legion(asustadores = ninios)
	}
}

class Legion {
	const asustadores
	
	method intentarAsustar(adulto) {
		self.lider().incrementarCaramelos(adulto.caramelosPorSusto(self))
	}
	
	method caramelos() = asustadores.sum({ asustador => asustador.caramelos() })
	
	method tieneMasDe(n) = self.caramelos() > n
	
	method capacidadDeSusto() = asustadores.sum({ asustador => asustador.capacidadDeSusto() })
	
	method lider() = asustadores.max({ asustador => asustador.capacidadDeSusto() })
}

class Barrio {
	const ninios = []
	
	method topConMasCaramelos(n) = ninios.sortedBy({ 
		unNinio, otroNinio => unNinio.caramelos() > otroNinio.caramelos()
	}).take(n)
	
	method elementosMasUtilizados() = 
		ninios.filter({ ninio => ninio.tieneMasDe(10) })
		.map({ ninio => ninio.elementosPuestos() } )
		.flatten()
		.asSet()
	}

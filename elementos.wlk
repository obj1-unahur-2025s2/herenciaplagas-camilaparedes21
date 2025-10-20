import plagas.*
class Elementos {
  method esBueno()
}

class Hogar inherits Elementos {
  var property nivelMugre 
  const property confort 
  override method esBueno() = nivelMugre <= confort/2
  method recibeAtaque(plaga) {
    nivelMugre +=plaga.nivelDeDaño()
  }
}

class Huerta inherits Elementos {
  var property capacidadDeProduccion
  override method esBueno()=capacidadDeProduccion>nivelFijo.nivelMinimo()
  method recibeAtaque(plaga) {
    capacidadDeProduccion -= plaga.nivelDeDaño()*0.10 + if(plaga.transmiteEnfermedades()) 10 else 0
  

  }
}
object nivelFijo {
  var property nivelMinimo = 0
}
class Mascota inherits Elementos{
  var property nivelDeSalud = 10
  override method esBueno() = nivelDeSalud>250
  method recibeAtaque(plaga) {
    nivelDeSalud-= if(plaga.transmiteEnfermedades()) plaga.nivelDeDaño() else 0
  
  }
}

class Barrios {
  const elementos ={}
  method agregarElemento(unElemento) {elementos.add(unElemento)}
  method quitarElemento(unElemento) {elementos.add(unElemento)}
  method esCopado() = self.cantidadElementosBuenos()>self.cantidadElementosMalos()
  method cantidadElementosBuenos() = elementos.count({e=>e.esBueno()})
  method cantidadElementosMalos() = elementos.count({e=>!e.esBueno()})


}

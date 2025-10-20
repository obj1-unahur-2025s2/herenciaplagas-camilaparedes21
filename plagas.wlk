class Plagas {
  var property poblacion
  method nivelDeDaño() = 0
  method transmiteEnfermedades ()= poblacion >= 10
  method atacoA(elemento){
    elemento.recibeAtaque(self)
    self.efectoPorAtaque()
  }
  method efectoPorAtaque() {
    poblacion += poblacion *0.10
  }
}

class Cucarachas inherits Plagas {
  var property pesoPromedio 
  override method nivelDeDaño() = self.poblacion()/2
  override method transmiteEnfermedades()= super() and pesoPromedio>=10
  override method efectoPorAtaque() {
    super() 
    pesoPromedio +=2
  }
}

class Pulgas inherits Plagas {
  override method nivelDeDaño()= self.poblacion()*2
  }
  


class Garrapatas inherits Plagas {
    override method efectoPorAtaque() {
      poblacion+= poblacion * 0.20
    }
  
}

class Mosquitos inherits Plagas {
  override method nivelDeDaño() = self.poblacion()
  override method transmiteEnfermedades()= super() and poblacion % 3==0
}
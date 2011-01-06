package elecciones

class Promotor {

  static def belongsTo =  PromotorListaNominal

  static constraints = {
    nombre blank: false
    telefonoMovil blank: false
  }

  String nombre
  String direccion
  String telefonoCasa
  String telefonoMovil
  String email
  String seccion

  String toString(){
    return nombre
  }

}

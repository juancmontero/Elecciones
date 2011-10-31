package elecciones

class ListaNominal {

  static constraints = {
    idLista(unique:['entidad','distrito','municipio','seccion','tomoLista'],maxSize:40)
    municipio(maxSize:10)
    seccion(maxSize:10)
    tomoLista(maxSize:20)
    edad(maxSize:4)
    sexo(maxSize:4)
    nombre(maxSize:200)
    claveIfe(maxSize:50)
  }

  static indexes = {
    //listaUnico('entidad','distrito','municipio','seccion','tomoLista','idLista')
  }
  
  Integer entidad
  Integer distrito
  String municipio
  String seccion
  String tomoLista
  String edad
  String sexo
  String nombre
  String direccion
  String claveIfe
  String idLista
  Integer anio

  
  String toString(){
    return nombre  + " " + claveIfe
  }
}

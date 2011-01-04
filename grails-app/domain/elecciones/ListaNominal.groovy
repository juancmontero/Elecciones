package elecciones

class ListaNominal {

  static constraints = {
    idLista(unique:['entidad','distrito','municipio','seccion','tomoLista'])
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
  String idLista;

  
  String toString(){
    return nombre  + " " + claveIfe
  }
}

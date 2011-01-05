package elecciones

class PromotorListaNominal {

  //static def relatesToMany = [personaRecomendada: ListaNominal]
  static def hasMany = [personaRecomendada: ListaNominal]
  
  def Promotor promotor
  //def  personaRecomendada = new HashSet()
  //def List<ListaNominal>  personaRecomendada

  static constraints = {
  }

}

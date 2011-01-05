package elecciones

class AgregaVotosController {

  def List<ListaNominal>  listaAgregados

    def index = {
      println "Accion index"
      println params

      [listaAgregados: listaAgregados]
    }

    def save = {
      println "Accion save"
      println params

      def StringBuffer erroresBf = new StringBuffer()

      listaAgregados = null

      def idsPersonas = params.get("idstosave") as String
      def tomoListax =  params.get("tomoList") as String
      def seccionx =  params.get("seccion") as String

      if(idsPersonas.length() == 0)
        erroresBf.append("Id a guardar no debe estar vacio. <br/>")
      if(tomoListax.length() == 0)
        erroresBf.append("Tomo lista no debe estar vacio. <br/>")
      if(seccionx.length() == 0)
        erroresBf.append("Seccion no debe estar vacio. <br/>")

      if (erroresBf.toString().length() > 0)
      {
           flash.error = erroresBf.toString()
           render(view: "index")
           return;
      }

      flash.error = null

      def arraydeIds = idsPersonas.split(",")

      println arraydeIds

      arraydeIds.each {indice ->

        //solo los que contengan u indice
        if(indice.length() > 0)
        {
          //def listaNominalInstance = ListaNominal.get(indice)
          def listaNominalInstance = ListaNominal.find('from ListaNominal where seccion=:seccion and tomoLista=:tomoLista and idLista=:idLista',[ seccion: seccionx,tomoLista: tomoListax, idLista: indice ])
          //Si existe entonces agregarlo a una lista
          if(listaNominalInstance)
          {
            //valido si existe la lista, si no la genero
            if(listaAgregados == null)
              listaAgregados = new ArrayList()

            def nuevosVotantes = new Votos()
            try
            {

              nuevosVotantes.fechaVoto = new Date()
              nuevosVotantes.persona = listaNominalInstance
              nuevosVotantes.save(flush: true, insert: true,failOnError: true)
              listaAgregados.add(listaNominalInstance)
            }
            catch(Exception ex)
            {
              def error = nuevosVotantes.errors.getFieldError().defaultMessage.toString()
              error = error.replace("{0}","Persona")
              error = error.replace("{2}",listaNominalInstance.idLista + " " + listaNominalInstance.toString())
              erroresBf.append(error + "<br/>")
            }
          }
        }
      }

      if (erroresBf.toString().length() > 0)
      {
           flash.error = erroresBf.toString()
      }

      render(view: "index", model: [listaAgregados: listaAgregados])
    }
}

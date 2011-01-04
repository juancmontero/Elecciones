package elecciones

import org.springframework.web.multipart.MultipartFile
import org.springframework.transaction.TransactionStatus

class UploadListaController {

    //static allowedMethods = [save: "POST"]

  
    def save = {

      def archivoUpd = params.getAt("archivoCarga") as MultipartFile
      //print(archivoUpd.contentType);
      def StringBuffer erroresBf = new StringBuffer()

      params.each {parametro -> println(parametro)}

      //TODO: validar los campos de entidad, distrito,etc... y asignarlos

      //def otherRequest = request as MultipartHttpServletRequest
      //def archivoUpd = otherRequest.getFile("archivoCarga")
      /*
      tomoList=ABA-ALV
      municipio=005
      distrito=45
      entidad=15
      seccion=0094
       */

      if (archivoUpd != null)
      {
        print(archivoUpd.size)
        //archivoUpd.properties.each { println(it)}
        //println("Archivo Original: " + archivoUpd.originalFilename)
        //println("Archivo Nuevo: " + archivoUpd.properties.get("fileItem"))
        //archivoUpd.transferTo(new File("/tmp/archivoscarga/" + archivoUpd.properties.get("originalFilename")))

        //TODO:Error aqui
        def String txt_tomoList = params.get("tomoList")
        def String txt_municipio = params.get("municipio")
        def String txt_distrito = params.get("distrito")
        def String txt_entidad = params.get("entidad")
        def String txt_seccion = params.get("seccion")

        if(txt_tomoList.count <= 0)
          erroresBf.append("Tomo lista no debe ser vacio. <br/>")
        if(txt_municipio.count <= 0)
          erroresBf.append("Municipio no debe ser vacio. <br/>")
        if(txt_distrito.count <= 0)
          erroresBf.append("Distrito no debe ser vacio. <br/>")
        if(txt_entidad.count <= 0)
          erroresBf.append("Entidad no debe ser vacio. <br/>")
        if(txt_seccion.count <= 0)
          erroresBf.append("Seccion no debe ser vacio. <br/>")
        if(archivoUpd.size <= 0)
          erroresBf.append("Debe seleccionar un archivo.")

        if (erroresBf.toString().count > 0)
        {
             flash.error = erroresBf.toString()
             return;
        }


        def lineas_archivo = archivoUpd.inputStream.readLines()
        erroresBf = new StringBuffer()

        ListaNominal.withTransaction { TransactionStatus tx ->

          /**
          * Iteracion para crear las nuevas entidades de la lista
           */
          try {
            for (def i=0 ; i< lineas_archivo.size(); i += 10)
            {
              def listaNominalInstance = new ListaNominal()
              listaNominalInstance.entidad = txt_entidad as Integer
              listaNominalInstance.distrito = txt_distrito as Integer
              listaNominalInstance.municipio = txt_municipio
              listaNominalInstance.seccion = txt_seccion
              listaNominalInstance.tomoLista = txt_tomoList
              listaNominalInstance.idLista = lineas_archivo.get(i).trim()
              listaNominalInstance.edad =  lineas_archivo.get(i+1).trim()
              listaNominalInstance.edad = listaNominalInstance.edad.substring(listaNominalInstance.edad.length()-3,listaNominalInstance.edad.length()).trim()
              listaNominalInstance.sexo = lineas_archivo.get(i+2).trim()
              listaNominalInstance.sexo = listaNominalInstance.sexo.substring(listaNominalInstance.sexo.length()-2,listaNominalInstance.sexo.length()).trim()
              listaNominalInstance.nombre = lineas_archivo.get(i+3).trim() + " "  + lineas_archivo.get(i+4).trim() + " " + lineas_archivo.get(i+5).trim()
              listaNominalInstance.direccion = lineas_archivo.get(i+6).trim() + " "  + lineas_archivo.get(i+7).trim() + " " + lineas_archivo.get(i+8).trim()
              listaNominalInstance.claveIfe = lineas_archivo.get(i+9).trim()

              println(listaNominalInstance)
             if(!listaNominalInstance.save(flush:true))
             {
                    listaNominalInstance.errors.each { erroresBf.append(it + "\n")}
             }

            }

            //def algo = erroresBf.toString().count
            //print(algo)

            if (erroresBf.toString().count > 0)
            {
                 flash.error = erroresBf.toString()
            }

            //TODO: aqui no entra
            else
            {
              flash.message = "Archivo $archivoUpd.originalFilename agregado correctamente"
              flash.error = null
              println("termino inserts")
              tx.flush()
            }
          }
          catch(Exception ex){
            ex.printStackTrace()
            tx.setRollbackOnly()
            flash.error = ex.message + " " + erroresBf.toString()
          }

        }

        println(ListaNominal.count())

      }
      else{
        flash.message = ""
        flash.error = null
      }
    }
}

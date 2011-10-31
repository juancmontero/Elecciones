<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Grails</title>
    </head>
    <body>
         <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
          <h1><g:message code="default.UploadListaController.title.label" /></h1>
          <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
          </g:if>
          <g:if test="${flash.error != null}">
            <div class="errors">
              <g:message code="${flash.error}"/>
            </div>
          </g:if>
          <g:form method="post" action="save"
            enctype="multipart/form-data">
            <div class="dialog">
              <table>
                <tbody>
                    <tr class="prop">
                      <td valign="top" class="name">
                        <label>Entidad: </label>
                      </td>
                      <td valign="top" class="value">
                        <g:textField name="entidad"/>&nbsp; (ejemplo: 15) <br/>
                      </td>
                    </tr>
                    <tr class="prop">
                     <td valign="top" class="name">
                                <label>Distrito: </label>
                     </td>
                      <td valign="top" class="value">
                       <g:textField name="distrito"/> &nbsp; (ejemplo: 45) <br/>
                    <tr class="prop">
                      <td valign="top" class="name">
                        <label>Municipio: </label>
                      </td>
                      <td valign="top" class="value">
                        <g:textField name="municipio"/> &nbsp; (ejemplo: 005)<br/>
                      </td>
                    </tr>
                    <tr class="prop">
                      <td valign="top" class="name">
                        <label>Sección: </label>
                      </td>
                      <td valign="top" class="value">
                        <g:textField name="seccion"/> &nbsp; (ejemplo: 0094)<br/>
                      </td>
                    </tr>
                    <tr class="prop">
                      <td valign="top" class="name">
                        <label>Año: </label>
                      </td>
                      <td valign="top" class="value">
                        <g:textField name="anio"/> &nbsp; (ejemplo: 1982)<br/>
                      </td>
                    </tr>
                    <tr class="prop">
                      <td valign="top" class="name">
                                <label>Tomo Lista: </label>
                      </td>
                      <td valign="top" class="value">
                        <g:textField name="tomoList"/> &nbsp; (ejemplo: ABA-ALV")<br/>
                      </td>
                    </tr>
                    <tr class="prop">
                      <td valign="top" class="name">
                        <label>Archivo csv: </label>
                      </td>
                      <td valign="top" class="value">
                        <input type="file" name="archivoCarga"/>
                      </td>
                    </tr>
                </tbody>
              </table>
            </div>
            <div class="buttons">
                          <span class="button"><g:submitButton name="guardar" class="save" value="${message(code: 'default.button.upload.label', default: 'Upload')}" /></span>
            </div>
          </g:form>
    </body>
</html>
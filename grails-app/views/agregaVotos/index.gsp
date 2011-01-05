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
          <h1><g:message code="default.AgregaVotosController.title.label" /></h1>
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
                      <td valign="top" class="name">
                        <label>Sección: </label>
                      </td>
                      <td valign="top" class="value">
                        <g:textField name="seccion"/> &nbsp; (ejemplo: 0094)
                      </td>
                    </tr>
                    <tr class="prop">
                      <td valign="top" class="name">
                                <label>Tomo Lista: </label>
                      </td>
                      <td valign="top" class="value">
                        <g:textField name="tomoList"/> &nbsp; (ejemplo: ABA-ALV)
                      </td>
                      <tr class="prop">
                      <td valign="top" class="name">
                                <label>Id a guardar: </label>
                      </td>
                      <td valign="top" class="value">
                        <g:textField name="idstosave"/> &nbsp; (ejemplo: 1,2,3,67,90,123)
                      </td>
                    </tr>
                </tbody>
              </table>
            </div>
            <div class="buttons">
              <span class="button"><g:submitButton name="guardar" class="save" value="Guardar" /></span>
            </div>
          </g:form>
          <g:if test="${listaAgregados}">
            <br/>
            <h1>Personas agregadas</h1>
            <div class="list">
                  <table>
                      <thead>
                          <tr>

                            <g:sortableColumn property="id" title="${message(code: 'listaNominal.id.label', default: 'Id')}" />

                            <g:sortableColumn property="idLista" title="${message(code: 'listaNominal.idLista.label', default: 'Id Lista')}" />

                            <g:sortableColumn property="claveIfe" title="${message(code: 'listaNominal.claveIfe.label', default: 'Clave Ife')}" />

                            <g:sortableColumn property="direccion" title="${message(code: 'listaNominal.nombre.label', default: 'Nombre')}" />

                          </tr>
                      </thead>
                      <tbody>
                      <g:each in="${listaAgregados}" status="i" var="personaAgregada">
                          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                              <td><g:link controller="listaNominal" action="show" id="${personaAgregada.id}">${fieldValue(bean: personaAgregada, field: "id")}</g:link></td>

                              <td>${fieldValue(bean: personaAgregada, field: "idLista")}</td>

                              <td>${fieldValue(bean: personaAgregada, field: "claveIfe")}</td>

                              <td>${fieldValue(bean: personaAgregada, field: "nombre")}</td>

                          </tr>
                      </g:each>
                      </tbody>
                  </table>
              </div>
            </g:if>
    </body>
</html>
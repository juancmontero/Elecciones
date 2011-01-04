

<%@ page import="elecciones.ListaNominal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'listaNominal.label', default: 'ListaNominal')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${listaNominalInstance}">
            <div class="errors">
                <g:renderErrors bean="${listaNominalInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${listaNominalInstance?.id}" />
                <g:hiddenField name="version" value="${listaNominalInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="idLista"><g:message code="listaNominal.idLista.label" default="Id Lista" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaNominalInstance, field: 'idLista', 'errors')}">
                                    <g:textField name="idLista" value="${listaNominalInstance?.idLista}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="claveIfe"><g:message code="listaNominal.claveIfe.label" default="Clave Ife" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaNominalInstance, field: 'claveIfe', 'errors')}">
                                    <g:textField name="claveIfe" value="${listaNominalInstance?.claveIfe}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="direccion"><g:message code="listaNominal.direccion.label" default="Direccion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaNominalInstance, field: 'direccion', 'errors')}">
                                    <g:textField name="direccion" value="${listaNominalInstance?.direccion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="distrito"><g:message code="listaNominal.distrito.label" default="Distrito" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaNominalInstance, field: 'distrito', 'errors')}">
                                    <g:textField name="distrito" value="${fieldValue(bean: listaNominalInstance, field: 'distrito')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edad"><g:message code="listaNominal.edad.label" default="Edad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaNominalInstance, field: 'edad', 'errors')}">
                                    <g:textField name="edad" value="${listaNominalInstance?.edad}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="entidad"><g:message code="listaNominal.entidad.label" default="Entidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaNominalInstance, field: 'entidad', 'errors')}">
                                    <g:textField name="entidad" value="${fieldValue(bean: listaNominalInstance, field: 'entidad')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="municipio"><g:message code="listaNominal.municipio.label" default="Municipio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaNominalInstance, field: 'municipio', 'errors')}">
                                    <g:textField name="municipio" value="${listaNominalInstance?.municipio}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="listaNominal.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaNominalInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${listaNominalInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="seccion"><g:message code="listaNominal.seccion.label" default="Seccion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaNominalInstance, field: 'seccion', 'errors')}">
                                    <g:textField name="seccion" value="${listaNominalInstance?.seccion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sexo"><g:message code="listaNominal.sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaNominalInstance, field: 'sexo', 'errors')}">
                                    <g:textField name="sexo" value="${listaNominalInstance?.sexo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tomoLista"><g:message code="listaNominal.tomoLista.label" default="Tomo Lista" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaNominalInstance, field: 'tomoLista', 'errors')}">
                                    <g:textField name="tomoLista" value="${listaNominalInstance?.tomoLista}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

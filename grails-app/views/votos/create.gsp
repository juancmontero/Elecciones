

<%@ page import="elecciones.Votos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'votos.label', default: 'Votos')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${votosInstance}">
            <div class="errors">
                <g:renderErrors bean="${votosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaVoto"><g:message code="votos.fechaVoto.label" default="Fecha Voto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: votosInstance, field: 'fechaVoto', 'errors')}">
                                    <g:datePicker name="fechaVoto" precision="day" value="${votosInstance?.fechaVoto}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="persona"><g:message code="votos.persona.label" default="Persona" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: votosInstance, field: 'persona', 'errors')}">
                                    <g:select name="persona.id" from="${elecciones.ListaNominal.list()}" optionKey="id" value="${votosInstance?.persona?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

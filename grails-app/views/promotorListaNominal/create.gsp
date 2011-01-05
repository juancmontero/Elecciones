

<%@ page import="elecciones.PromotorListaNominal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal')}" />
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
            <g:hasErrors bean="${promotorListaNominalInstance}">
            <div class="errors">
                <g:renderErrors bean="${promotorListaNominalInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="promotor"><g:message code="promotorListaNominal.promotor.label" default="Promotor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: promotorListaNominalInstance, field: 'promotor', 'errors')}">
                                    <g:select name="promotor.id" from="${elecciones.Promotor.list()}" optionKey="id" value="${promotorListaNominalInstance?.promotor?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personaRecomendada"><g:message code="promotorListaNominal.personaRecomendada.label" default="Persona Recomendada" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: promotorListaNominalInstance, field: 'personaRecomendada', 'errors')}">
                                    <g:select name="personaRecomendada" from="${elecciones.ListaNominal.list()}" multiple="yes" optionKey="id" size="5" value="${promotorListaNominalInstance?.personaRecomendada*.id}" />
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

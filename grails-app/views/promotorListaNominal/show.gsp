
<%@ page import="elecciones.PromotorListaNominal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="promotorListaNominal.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: promotorListaNominalInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="promotorListaNominal.personaRecomendada.label" default="Persona Recomendada" /></td>
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${promotorListaNominalInstance.personaRecomendada}" var="p">
                                    <li><g:link controller="listaNominal" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="promotorListaNominal.promotor.label" default="Promotor" /></td>
                            
                            <td valign="top" class="value"><g:link controller="promotor" action="show" id="${promotorListaNominalInstance?.promotor?.id}">${promotorListaNominalInstance?.promotor?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${promotorListaNominalInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

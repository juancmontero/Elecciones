
<%@ page import="elecciones.ListaNominal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'listaNominal.label', default: 'ListaNominal')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'listaNominal.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="idLista" title="${message(code: 'listaNominal.idLista.label', default: 'Id Lista')}" />
                        
                            <g:sortableColumn property="claveIfe" title="${message(code: 'listaNominal.claveIfe.label', default: 'Clave Ife')}" />
                        
                            <g:sortableColumn property="direccion" title="${message(code: 'listaNominal.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="distrito" title="${message(code: 'listaNominal.seccion.label', default: 'Secci&oacute;n')}" />
                        
                            <!--g:sortableColumn property="edad" title="${message(code: 'listaNominal.edad.label', default: 'Edad')}" /-->
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${listaNominalInstanceList}" status="i" var="listaNominalInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${listaNominalInstance.id}">${fieldValue(bean: listaNominalInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: listaNominalInstance, field: "idLista")}</td>
                        
                            <td>${fieldValue(bean: listaNominalInstance, field: "claveIfe")}</td>
                        
                            <td>${fieldValue(bean: listaNominalInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: listaNominalInstance, field: "seccion")}</td>
                        
                            <!--td>${fieldValue(bean: listaNominalInstance, field: "edad")}</td..>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${listaNominalInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

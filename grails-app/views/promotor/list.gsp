
<%@ page import="elecciones.Promotor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'promotor.label', default: 'Promotor')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'promotor.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'promotor.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="telefonoMovil" title="${message(code: 'promotor.telefonoMovil.label', default: 'Telefono Movil')}" />
                        
                            <g:sortableColumn property="direccion" title="${message(code: 'promotor.direccion.label', default: 'Direccion')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'promotor.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="municipio" title="${message(code: 'promotor.municipio.label', default: 'Municipio')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${promotorInstanceList}" status="i" var="promotorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${promotorInstance.id}">${fieldValue(bean: promotorInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: promotorInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: promotorInstance, field: "telefonoMovil")}</td>
                        
                            <td>${fieldValue(bean: promotorInstance, field: "direccion")}</td>
                        
                            <td>${fieldValue(bean: promotorInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: promotorInstance, field: "municipio")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${promotorInstanceTotal}" />
            </div>
        </div>
    </body>
</html>


<%@ page import="elecciones.Votos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'votos.label', default: 'Votos')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'votos.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="fechaVoto" title="${message(code: 'votos.fechaVoto.label', default: 'Fecha Voto')}" />

                            <th><g:message code="votos.persona.label" default="Id Lista" /></th>
                        
                            <th><g:message code="votos.persona.label" default="Persona" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${votosInstanceList}" status="i" var="votosInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${votosInstance.id}">${fieldValue(bean: votosInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${votosInstance.fechaVoto}" /></td>

                            <td>${fieldValue(bean: votosInstance, field: "persona.idLista")}</td>
                        
                            <td>${fieldValue(bean: votosInstance, field: "persona")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${votosInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

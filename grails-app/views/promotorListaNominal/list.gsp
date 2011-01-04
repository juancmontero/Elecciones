
<%@ page import="elecciones.PromotorListaNominal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'promotorListaNominal.id.label', default: 'Id')}" />
                        
                            <th><g:message code="promotorListaNominal.promotor.label" default="Promotor" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${promotorListaNominalInstanceList}" status="i" var="promotorListaNominalInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${promotorListaNominalInstance.id}">${fieldValue(bean: promotorListaNominalInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: promotorListaNominalInstance, field: "promotor")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${promotorListaNominalInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

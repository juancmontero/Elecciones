
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
                    <g:each in="${promotorListaNominalInstanceList}" status="i" var="promotorListaNominalInstance">
                        <ul>
                        
                            <li><g:link action="show" id="${promotorListaNominalInstance.id}">${fieldValue(bean: promotorListaNominalInstance, field: "id")}</g:link>
                              &nbsp; - &nbsp;
                              ${fieldValue(bean: promotorListaNominalInstance, field: "promotor")}
                <table>
                    <thead>
                        <tr>
                        
                                        <g:sortableColumn property="id" title="${message(code: 'promotorListaNominal.personaRecomendada.label', default: 'Clave IFE')}" />
                        
                                        <th><g:message code="promotorListaNominal.personaRecomendada.label" default="Persona Recomendada" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                                  <g:each in="${promotorListaNominalInstance.personaRecomendada}" status="j" var="personaRecomendadaInstance">
                                    <tr class="${(j % 2) == 0 ? 'odd' : 'even'}">

                                      <td><g:link controller="listaNominal" action="show" id="${personaRecomendadaInstance.id}">${fieldValue(bean: personaRecomendadaInstance, field: "claveIfe")}</g:link></td>

                                      <td>${fieldValue(bean: personaRecomendadaInstance, field: "nombre")}</td>

                                    </tr>
                                  </g:each>
                                 </tbody>
                              </table>

                            </li>
                        
                        </ul>
                    </g:each>

            </div>
            <!--div class="paginateButtons">
                <g:paginate total="${promotorListaNominalInstanceTotal}" />
            </div-->
        </div>
    </body>
</html>

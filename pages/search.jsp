<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:variable name="head">
        <title>${i18n.translate("Kinetic Data")} ${text.escape(i18n.translate(kapp.name))}</title>
    </bundle:variable>
    <div class="container input-field">
        <div class="page-header">
            <h1>${i18n.translate("Search Results")}</h1>
            <form action="${bundle.kappLocation}" method="GET" role="form">
                <div class="input-group">
                    <input type="hidden" value="search" name="page">
                    <input id="search" value="${param['q']}" autocomplete="off" type="text" class="form-control" name="q">
                    <span class="input-group-btn">
                        <button id="search-button" class="btn btn-default" type="button">
                            <i id="search-icon" class="fa fa-search"></i>
                        </button>
                    </span>
                </div><!-- /input-group -->
            </form>  
        </div>
                
        <c:if test="${text.isNotBlank(param['q'])}">
            <c:set scope="request" var="formsMatchSearch" value="${SearchHelper.filter(kapp.forms,param['q'])}"/>
                <div class="search-results" data-results-total="${fn:length(formsMatchSearch)}">
                <c:choose>
                    <c:when test="${empty formsMatchSearch}">
                        <%--Use text escape to sanitize the output and prevent XXS attacks--%>
                        <p>${i18n.translate('We were unable to find any match to your <b>SEARCH_TERM</b> query.')
                                 .replace("SEARCH_TERM", text.escape(param['q']))}</p>
                        <c:if test="${not empty kapp.getForm(kapp.getAttributeValue('FeedBack Form'))}">
                            <c:set var="feedbackURL" value="${bundle.kappLocation}/${kapp.getAttributeValue('FeedBack Form')}?formSlug=SearchExecution&q=${param['q']}" />
                            <p>${i18n.translate('Please submit <a href="FEEDBACK_URL">Feedback</a> so we can improve.')
                                     .replace("FEEDBACK_URL", feedbackURL)}</p>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <ul class="list-unstyled">
                            <c:forEach var="form" items="${formsMatchSearch}">
                                <c:if test="${text.equals(form.type.name, 'Service') || text.equals(form.type.name, 'Template')}">
                                    <li>
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <h3><a href="${bundle.kappLocation}/${form.slug}">${text.escape(i18n.translate(form,form.name))}</a></h3>
                                            </div>
                                            <div class="panel-body">${text.escape(i18n.translate(form,form.description))}</div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>
    </div>
</bundle:layout>


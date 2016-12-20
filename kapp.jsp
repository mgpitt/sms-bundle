<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%@include file="bundle/router.jspf" %>
<c:set var="includeHeaderTall" value="${true}" scope="request"/>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(i18n.translate(kapp.name))}</title>
        <script src="${i18n.scriptPath('shared')}"></script>
        <script src="${i18n.scriptPath('bundle')}"></script>
    </bundle:variable>
    <!-- search -->
    <div class="container m-y-4 input-field">
        <h1 class="p-b-1 text-center">${i18n.translate('How can we help you today?')}</h1>
        <form class="input-field--responsive" action="${bundle.kappLocation}" method="GET" role="form">
            <div class="input-group">
                <input type="hidden" value="search" name="page">
                <input id="search" autocomplete="off" type="text" class="form-control" name="q">
                <span class="input-group-btn">
                    <button id="search-button" class="btn m-a-0" type="button">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
            </div><!-- /input-group -->
        </form>
    </div>
    <!-- Teal category nav -->
    <div class="nav nav__categories m-b-4">
        <div class="container">
            <div class="row text-center">
              <ul>
                <c:forEach end="5" var="bundleCategory" items="${CategoryHelper.getCategories(kapp)}">
                    <c:set var="formsStatusActive" value="${FormHelper.getFormsByStatus(bundleCategory.category,'Active')}"/>
                    <c:if test="${fn:toLowerCase(bundleCategory.getAttribute('Hidden').value) ne 'true' && not empty formsStatusActive }">
                        <li class="nav__box col-centered">
                            <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${bundleCategory.slug}">
                                    <span class="fa-stack center-block icon--size">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa ${bundleCategory.getAttributeValue("Icon")} fa-stack-1x fa-inverse"></i>
                                    </span>
                                    <span class="truncate nav__text font-light">${text.escape(i18n.translate(bundleCategory.name))}</span>
                            </a>
                        </li>
                    </c:if>
                </c:forEach>
                <li class="nav__box col-centered">
                    <a href="${bundle.spaceLocation}/${kapp.slug}?page=categories">
                        <span class="fa-stack center-block icon--size">
                            <i class="fa fa-circle fa-stack-2x"></i>
                            <i class="fa fa-ellipsis-h fa-stack-1x fa-inverse"></i>
                        </span>
                        <span class="truncate nav__text font-light">${i18n.translate('View All')}</span>
                    </a>
                </li>
              </ul>
            </div>
        </div>
    </div>
    <!-- Approval and Requests panel display
    If{not empty list} is used  to not display table if the list is empty-->
    <div class="container m-b-4">
        <div class="row">
            <div class="col-sm-7 leftside">
                <c:set scope="request" var="submissionsListApproval" value="${SubmissionHelper.retrieveRecentSubmissions('Approval', 3)}"/>
                <c:if test="${not empty submissionsListApproval}">
                    <div class="panel panel-default ">
                        <div class="panel-heading background-tertiary">
                            <div class="panel-title">
                                <h4 class="white">${i18n.translate('YOUR APPROVALS')}</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:set scope="request" var="page" value="approvals"/>
                            <c:set scope="request" var="submissionsList" value="${submissionsListApproval}"/>
                            <c:import url="${bundle.path}/partials/submissionsTable.jsp" charEncoding="UTF-8"/>
                        </div>
                    </div>
                </c:if>
                <c:set scope="request" var="submissionsListDraft" value="${SubmissionHelper.retrieveRecentSubmissions('Service', 'Draft', 3)}"/>
                <c:if test="${not empty submissionsListDraft}">
                    <div class="panel panel-default">
                        <div class="panel-heading background-tertiary">
                            <div class="panel-title"><h4 class="white">${i18n.translate('YOUR REQUESTS - DRAFT')}</h4></div>
                        </div>
                        <div class="panel-body">
                            <c:set scope="request" var="page" value="requests"/>
                            <c:set scope="request" var="submissionsList" value="${submissionsListDraft}"/>
                            <c:import url="${bundle.path}/partials/submissionsTable.jsp" charEncoding="UTF-8"/>
                        </div>
                    </div>
                </c:if>
                <div class="panel panel-default">
                    <div class="panel-heading background-tertiary">
                        <div class="panel-title"><h4 class="white">${i18n.translate('YOUR REQUESTS - SUBMITTED')}</h4></div>
                    </div>
                    <div class="panel-body">
                        <c:set scope="request" var="submissionsListSubmitted" value="${SubmissionHelper.retrieveRecentSubmissions('Service', 'Submitted', 3)}"/>
                        <c:choose>
                            <c:when test="${not empty submissionsListSubmitted}">
                                <c:set scope="request" var="page" value="requests"/>
                                <c:set scope="request" var="submissionsList" value="${submissionsListSubmitted}"/>
                                <c:import url="${bundle.path}/partials/submissionsTable.jsp" charEncoding="UTF-8"/>
                            </c:when>
                            <c:otherwise>
                                <p class="text-center m-b-1 m-t-1">${i18n.translate('There are no Requests to display.')}</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <!-- Kinetic Twitter feed -->
                <div class=" hidden-xs">
                    <a class="twitter-timeline" href="https://twitter.com/KineticData" data-widget-id="569678005275226112" data-chrome="nofooter">${i18n.translate('Tweets by @KineticData')}</a>
                </div>
            </div>
        </div>
    </div>
</bundle:layout>

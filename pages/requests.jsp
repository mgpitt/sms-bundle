<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<c:set var="includeSearch" value="${true}" scope="request"/>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:variable name="head">
        <title>${i18n.translate("Kinetic Data")} ${text.escape(i18n.translate(kapp.name))}</title>
    </bundle:variable>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/submissions.js" />
    </bundle:scriptpack>
    <div class="container requests">
        <c:catch var="submissionException">
            <c:set scope="request" var="submissionsList" value="${SubmissionHelper.retrieveRecentSubmissions('Service')}"/>
        </c:catch>
        <c:choose>
            <c:when test="${submissionException != null}">
                <p>${i18n.translate("There was a problem retrieving the submissions.")}</p>
            </c:when>
            <c:otherwise>
                <div class="page-header">
                    <h1 style="display: inline-block">
                    <span class="icon--size--small fa-stack center-block">
                        <i class="fa fa-circle fa-stack-2x"></i>
                        <i class="fa fa-plus fa-stack-1x fa-inverse"></i>
                    </span>
                    ${i18n.translate("My Submissions")}
                    </h1>
                    <span class="pull-right">
                        <h4 class="gray" style="display: inline-block">${i18n.translate("FILTER BY:")}</h4>
                        <input id="filter" type="text" class="form-control" style="width:100%"/>
                    </span>
                </div>
                <%-- Get a full list of all submissions by type 'Service' --%>
                <div class="list">
                  <c:choose>
                    <c:when test="${not empty submissionsList}">
                      <ul class="list-unstyled">
                        <c:forEach items="${submissionsList}" var="submission">
                            <li data-filter>
                                <div class="panel panel-default">
                                    <div class="panel-heading  background-tertiary">
                                    </div>
                                    <div class="panel-body text-center">
                                        <div class="col-sm-2">
                                            <span class="pull-left">
                                                <span class="fa-stack fa-2x center-block icon--size">
                                                    <i class="fa fa-circle fa-stack-2x"></i>
                                                    <i class="fa ${submission.form.getAttributeValue("Icon")} fa-stack-1x fa-inverse"></i>
                                                </span>
                                            </span>
                                        </div>
                                        <div class="col-sm-8">
                                            <span class="pull-left text-left panel__valign-text">
                                                <h3>${text.escape(i18n.translate(submission.form,submission.form.name))}</h3>
                                                <div class="font-bold gray" >${i18n.translate(submission.coreState)} : 
                                                    <c:choose>
                                                        <c:when test="${submission.coreState == 'Closed'}">
                                                            <span data-toggle="tooltip" title="Kinetic Data" data-moment-ago>${submission.closedAt}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span data-toggle="tooltip" title="Kinetic Data" data-moment-ago>${submission.createdAt}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <p class="gray-dark"><strong>${i18n.translate(submission.form,submission.label)}</strong></p>
                                            </span>
                                        </div>
                                        <div class="col-sm-2">
                                            <span class="pull-right text-left panel__valign-buttons">
                                                <c:choose>
                                                    <c:when test="${submission.coreState == 'Draft'}">
                                                        <a href="${bundle.spaceLocation}/submissions/${submission.id}">
                                                            <button class="btn btn-primary">${i18n.translate("Complete")}
                                                            <i class="icon-control-feedback fa fa-chevron-right"></i>
                                                            </button>
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="${bundle.kappLocation}?page=submission&id=${submission.id}">
                                                            <button class="btn btn-primary">${i18n.translate("Details")}
                                                            <i class="icon-control-feedback fa fa-chevron-right"></i>
                                                            </button>
                                                        </a>
                                                        <a href="${bundle.kappLocation}/${submission.form.slug}">
                                                            <button class="btn btn-primary">${i18n.translate("Reorder")}
                                                            <i class="icon-control-feedback fa fa-chevron-right"></i>
                                                            </button>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                      </ul>
                    </c:when>
                    <c:otherwise>
                      <div class="text-center well">
                        <h4><em>${i18n.translate("Looks like you have no submissions to display.")}</em></h4>
                      </div>
                    </c:otherwise>
                  </c:choose>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</bundle:layout>

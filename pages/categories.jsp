<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<c:set var="includeSearch" value="${true}" scope="request"/>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:variable name="head">
        <title>${i18n.translate("Kinetic Data")} ${text.escape(i18n.translate(kapp.name))}</title>
    </bundle:variable>
    <div class="container">
        <div class="page-header">
            <h1>
              <span class="icon--size--small fa-stack center-block">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa fa-ellipsis-h fa-stack-1x fa-inverse"></i>
              </span>
              ${i18n.translate("All Categories")}
            </h1>
        </div>
        <div class="row grid">
            <c:forEach var="bundleCategory" items="${CategoryHelper.getCategories(kapp)}">
                <c:set var="formsStatusActive" value="${FormHelper.getFormsByStatus(bundleCategory.category,'Active')}"/>
                <c:if test="${fn:toLowerCase(bundleCategory.getAttribute('Hidden').value) ne 'true' && not empty formsStatusActive }">
                    <div class="col-sm-3">
                        <div class="panel panel-default">
                            <div class="panel-heading  background-tertiary p-t-1">
                            </div>
                            <div class="panel-body text-center">
                                <span class="fa-stack center-block icon--size">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa ${bundleCategory.getAttributeValue("Icon")} fa-stack-1x fa-inverse"></i>
                                </span>
                                <h3 class="font-light max-min-height truncate">${i18n.translate(bundleCategory.name)}</h3>
                                <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${bundleCategory.slug}">
                                    <button class="btn btn-primary">${i18n.translate("Find a Form")}
                                      <i class="icon-control-feedback fa fa-chevron-right"></i>
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</bundle:layout>

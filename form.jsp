<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<bundle:layout page="layouts/form.jsp">
    <bundle:variable name="head">
        <title>${i18n.translate(form,form.name)}</title>
    </bundle:variable>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/service.js" />
    </bundle:scriptpack>
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <c:import url="${bundle.path}/partials/breadCrumbNav.jsp" charEncoding="UTF-8"/>
     <section class="page container">
        <%--This if will remove the wrapper from embedded forms--%>
        <c:if test="${!param['embedded']}">
            <c:choose>
                <c:when test="${param.review != null}">
                    <h2>${i18n.translate(form,form.name)}</h2><hr>
                </c:when>
                <c:otherwise>
                    <%--This wraps forms using form.jsp, without the embedded URL parameter, with an option to do requested for.
                        KDSearch is used and a bridge to your user data set (ex LDAP) must be configured.
                        A text element of "name" must be added to the form.--%>
                    <header class="page-header">
                        <h2>${i18n.translate(form,form.name)}
                            <%--The code below is to display who the request is being requested for.  
                                At this time there isn't a good technique to get a list of available "request for" people.--%>
<!--                            <small> for:
                                <span id="reqForUser">Me</span>
                                <button type="button" class="btn btn-default btn-xs pull-right" data-toggle="modal" data-target="#personSearchModal" data-personField="ReqForUserID">Change User</button>
                            </small>-->
                        </h2>
                    </header>
                </c:otherwise>
            </c:choose>
        </c:if>
        <app:bodyContent/>
        <script src="${i18n.scriptPath('shared')}"></script>
        <script src="${i18n.scriptPath('bundle')}"></script>
        <script src="${i18n.scriptPath(form)}"></script>
    </section>
</bundle:layout>
<%-- Person Search Div --%>
<div class="modal" tabindex="-1" role="dialog" id="personSearchModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" id="closeModal" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Find a User</h4>
            </div>
            <div class="modal-body">
                <div id="searchInput">
                    <div class="form-group">
                        <label for="first-name" class="control-label">Enter the name of the user you are looking for:</label>
                        <input type="text" class="form-control" id="name">
                    </div>
                </div>
            </div>
            <div id="personTableDiv">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

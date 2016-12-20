<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<c:set var="includeSearch" value="${true}" scope="request"/>
<bundle:layout page="../layouts/layout.jsp">
    <c:catch var="submissionException">
        <c:set var="submission" value="${Submissions.retrieve(param.id)}" scope="session"/>
    </c:catch>
    <bundle:variable name="head">
        <title>${i18n.translate(submission.form,submission.form.name)}</title>
    </bundle:variable>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/submission.js" />
    </bundle:scriptpack>
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <section class="page">
        <div class="container">
            <div class='row'>
                <c:choose>
                    <c:when test="${submissionException != null}">
                        ${i18n.translate("A submission Id is required on the URL.")}
                    </c:when>
                    <c:otherwise>
                        <%--The head variable must be inside of the otherwise to catch the exception that occurs when the page is reached without an id prameter--%>
                        <bundle:variable name="head">
                            <title>${text.escape(i18n.translate(submission.form,submission.form.name))}</title>
                        </bundle:variable>
                        <div class='col-xs-12'>
                            <div id="left-column" class="submission-meta col-md-5 p-y-3">
                                <c:import url="${bundle.path}/partials/submissionDetails.jsp" charEncoding="UTF-8"/>
                            </div>
                            <div id="right-column" class="right-details col-md-7 p-y-3">
                                <c:import url="${bundle.path}/partials/tasks.jsp" charEncoding="UTF-8"/>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>
</bundle:layout>


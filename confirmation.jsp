<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<c:set var="includeSearch" value="${true}" scope="request"/>
<bundle:layout page="layouts/form.jsp">
    <bundle:variable name="head">
        <title>${text.escape(form.name)}</title>
    </bundle:variable>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/submission.js" />
    </bundle:scriptpack>
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <section class="page">
        <div class="container">
            <div class='row'>
                <div class='col-xs-12'>
                    <%--  If no confirmation page is defined for the form,
                        use the default text below, otherwise use the page content.
                        An empty 'current page' means there is no page defined.
                    --%>
                    <c:choose>
                        <c:when test='${empty submission.currentPage}'>
                            <div id="left-column" class="submission-meta col-md-5 p-y-3">
                            <c:import url="${bundle.path}/partials/submissionDetails.jsp" charEncoding="UTF-8"/>

                            <h4>${i18n.translate('Thank you for your submission.')}</h4>
                            <%-- If the kapp has an attribute called "feedBack Form" and that form exists we will leave a message and link, to the form, for the user to give feedback--%>
                            <c:if test="${not empty kapp.getForm(kapp.getAttributeValue('FeedBack Form'))}">
                                <c:set var="feedbackURL" value="${bundle.kappLocation}/${kapp.getAttributeValue('FeedBack Form')}?formSlug=${form.slug}&submissionId=${submission.id}" />
                                <p>${i18n.translate('With <a href="FEEDBACK_URL">Feedback</a> we are able to continuously improve.')
                                     .replace("FEEDBACK_URL", feedbackURL)}</p>
                            </c:if>
                            </div>
                            <c:set var="submission" value="${submission.id}" scope="page"/>
                            <div id="right-column" class="right-details col-md-7 p-y-3">
                                <c:import url="${bundle.path}/partials/tasks.jsp" charEncoding="UTF-8"/>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <app:bodyContent/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </section>
</bundle:layout>

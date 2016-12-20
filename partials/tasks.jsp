<%@include file="../bundle/initialization.jspf" %>
<%--We use JavaScript to load task.jsp into the page every 3 seconds.
    This is done with a jquery .load() where a id=UUID of submission is passed in.
    We first check to see if there is an id on the URL and them we look up the submission by the id.--%>
<c:if test="${!empty param['id']}">
    <c:set var="submission" value="${Submissions.retrieve(param['id'])}" scope="page"/>
</c:if>
<c:if test="${kapp.hasAttribute('Task Server Url') && kapp.hasAttribute('Task Source Name')}">
    <c:catch var="runsException">
        <c:set var="runs" value="${TaskRuns.find(submission)}"/>
    </c:catch>
</c:if>
<c:choose>
    <c:when test="${runsException != null}">
        <p>${i18n.translate('There was a problem retrieving post processing task information for this submission.')}</p>
        <hr>
        ${text.escape(taskRunException.message)}
    </c:when>
    <c:when test="${empty runs}">
        <div class="text-center">
            <img src="${bundle.location}/images/empty-state@2x.png" alt="There are no tasks to display for this Submission"  width="262" height="151">
            <h4 style="color:#999;">${i18n.translate('There are no tasks to display for this Submission')}</h4>
        </div>
    </c:when>
    <c:otherwise>
        <ul>
            <c:forEach var="run" items="${runs}">
                <c:forEach var="task" items="${run.tasks}">
                    <li class="panel panel-default arrow_box task-nodes">
                        <div class="panel-body">
                            <h4>${i18n.translate(task.name)}</h4>
                            <h4><span data-toggle="tooltip" title="Kinetic Data" data-moment-ago>${task.createdAt}</span></h4>
                            <c:forEach var="entry" items="${task.messages}">
                                <p class="font-bold gray">${text.escape(i18n.translate(entry.message))}</p>
                            </c:forEach>
                        </div>
                    </li>
                </c:forEach>
            </c:forEach>
        </ul>
    </c:otherwise>
</c:choose>

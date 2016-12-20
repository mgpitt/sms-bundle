<%@include file="../bundle/initialization.jspf" %>
    <table class="table m-a-0">
        <thead>
            <tr>
                <td class="font-bold p-t-0 gray">${i18n.translate('SUMMARY')}</td>
                <td class="font-bold p-t-0 text-right gray hidden-xs">${i18n.translate('STATUS')}</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="submission" items="${submissionsList}">
                <tr>
                    <td class="font-bold p-b-0">${i18n.translate(submission.form,submission.form.name)}</td>
                    <td class="font-bold text-right gray hidden-xs" rowspan="2">${i18n.translate(submission.coreState)}</td>
                </tr>
                 <c:choose>
                    <c:when test="${submission.coreState == 'Draft'}">
                        <tr>
                            <td class="font-bold p-t-0"><a href="${bundle.spaceLocation}/submissions/${submission.id}">${i18n.translate(submission.getLabel())} - <span data-toggle="tooltip" title="Kinetic Data" data-moment-ago>${submission.createdAt}</span></a></td>
                        </tr>
                    </c:when>
                    <c:when test="${submission.form.type.name == 'Approval' and submission.coreState == 'Submitted'}">
                        <tr>
                            <td class="font-bold p-t-0"><a href="${bundle.spaceLocation}/submissions/${submission.id}?review">${i18n.translate(submission.getLabel())} - <span data-toggle="tooltip" title="Kinetic Data" data-moment-ago>${submission.submittedAt}</span></a></td>
                        </tr>
                    </c:when>        
                    <c:otherwise>
                        <tr>
                            <td class="font-bold p-t-0"><a href="${bundle.kappLocation}?page=submission&id=${submission.id}">${i18n.translate(submission.getLabel())} - <span data-toggle="tooltip" title="Kinetic Data" data-moment-ago>${submission.submittedAt}</span></a></td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <td class="font-bold" colspan="2"><center><a href="${bundle.spaceLocation}/${kapp.slug}?page=${page}">${i18n.translate('VIEW MORE')}</a></center></td>
        </tr>
        </tfoot>
    </table>
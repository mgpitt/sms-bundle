<%@include file="../bundle/initialization.jspf" %>
<span class="fa-stack fa-2x center-block icon--size--small">
    <i class="fa fa-circle fa-stack-2x"></i>
    <i class="fa ${submission.form.getAttributeValue("Icon")} fa-stack-1x fa-inverse"></i>
</span>
    <h1 class="truncate"><span data-toggle="tooltip" title="${submission.form.name}">${i18n.translate(submission.form,submission.form.name)}</span></h1>
    <dl>
      <dt>${i18n.translate('Request Label:')}</dt>
      <dd>${i18n.translate(submission.label)}</dd>
      <dt>${i18n.translate('Request Date:')}</dt>
      <dd><span data-toggle="tooltip" title="Kinetic Data" data-moment-ago>${time.format(submission.submittedAt)}</span></h4>
          <dt>${i18n.translate('Status:')}</dt>
      <c:if test="${submission.form.getField('Status') == null}">
          <dd>${i18n.translate(submission.coreState)}</dd>
      </c:if>
      <c:if test="${submission.form.getField('Status') != null}">
          <dd>${i18n.translate(submission.getValue('Status'))}</dd>
      </c:if>
      <dt>${i18n.translate('Description:')}</dt>
      <c:if test="${not empty submission.form.description}">
          <dd>${i18n.translate(submission.form,submission.form.description)}</dd>
      </c:if>
      <c:if test="${empty submission.form.description}">
          <dd>${i18n.translate('If there is content included in the description section of the form it will display here.  To get to the description section go to the Admin Console. Select Author tab and choose the form.  Under the form name select the General tab.')}</dd>
      </c:if>
    </dl>
<a href="${bundle.spaceLocation}/submissions/${submission.id}?review">
    <button class="btn btn-primary">${i18n.translate('Review Request')}
    <i class="icon-control-feedback fa fa-chevron-right"></i>
    </button>
</a>

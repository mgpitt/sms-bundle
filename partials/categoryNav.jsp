<%@include file="../bundle/initialization.jspf" %>
<nav class="nav__secondary">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul>
                    <li>
                        <a href="${bundle.spaceLocation}/${kapp.slug}?page=requests">
                            <span class="fa-stack">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-plus fa-stack-1x fa-inverse"></i>
                            </span>
                            ${i18n.translate('My Submissions')}
                        </a>
                    </li>
                    <li>
                        <a href="${bundle.spaceLocation}/${kapp.slug}?page=approvals">
                            <span class="fa-stack">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-check fa-stack-1x fa-inverse"></i>
                            </span>
                            ${i18n.translate('My Approvals')}
                        </a>
                    </li>
                    <li>
                        <a href="${bundle.spaceLocation}/${kapp.slug}?page=categories">
                            <span class="fa-stack">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-ellipsis-h fa-stack-1x fa-inverse"></i>
                            </span>
                            ${i18n.translate('Categories')}
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>
</nav>

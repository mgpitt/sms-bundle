<%@include file="../bundle/initialization.jspf" %>
<c:set var="category" value="${CategoryHelper.getCategory(param['category'],kapp)}" scope="request"/>
<div class="nav__breadcrumb">
    <div class="container">
        <div class="row ">
          <div class="col-md-12">
            <ol class="nav__list">
                <c:forEach var="crumb" items="${category.getTrail()}">
                    <li class="truncate">
                      <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${crumb.slug}" >${i18n.translate(crumb.name)}</a>
                    </li>
                </c:forEach>
            </ol>
          </div>
        </div>
    </div>
</div>

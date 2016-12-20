<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<c:set var="includeSearch" value="${true}" scope="request"/>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <c:import url="${bundle.path}/partials/breadCrumbNav.jsp" charEncoding="UTF-8"/>
    <bundle:variable name="head">
        <title>${i18n.translate("Kinetic Data")} ${text.escape(i18n.translate(kapp.name))}</title>
    </bundle:variable>
    <div class="container">
        <div class="category__forms ">
            <div class="row">
                <c:if test="${category.hasSubcategories()}">
                    <div class="col-md-2 category__subcategory">
                        <h4>${i18n.translate("Subcategories")}</h4>
                        <ul>
                          <c:forEach var="subCategory" items="${category.getSubcategories()}">
                              <c:set var="subCategoryFormsStatusActive" value="${!subCategory.isEmpty()}"/>
                              <c:if test="${fn:toLowerCase(subcategory.getAttribute('Hidden').value) ne 'true' && subCategoryFormsStatusActive == 'true'}">
                                  <li>
                                    <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${subCategory.slug}"><p class="truncate">${i18n.translate(subCategory.name)}</p></a>
                                  </li>
                              </c:if>
                          </c:forEach>
                        </ul>

                    </div>
                </c:if>

                <c:if test="${category.hasForms()}">
                    <div class="${category.hasSubcategories() ? 'col-md-10' : 'col-md-12'} grid">
                        <h4>${i18n.translate("Forms")}</h4>
                        <c:forEach var="form" items="${FormHelper.getFormsByStatus(kapp.getCategory(param['category']),'Active')}">
                            <div class="${category.hasSubcategories() ? 'col-md-4' : 'col-md-3'}">
                                <div class="panel panel-default">
                                    <div class="panel-heading  background-tertiary p-t-1">
                                    </div>
                                    <div class="panel-body text-center">
                                        <span class="fa-stack center-block icon--size">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa ${form.getAttributeValue("Icon")} fa-stack-1x fa-inverse"></i>
                                        </span>
                                        <h3 class="font-light max-min-height truncate">${i18n.translate(form,form.name)}</h3>
                                        <a href="${bundle.spaceLocation}/${kapp.slug}/${form.slug}">
                                            <button class="btn btn-primary m-t-1">${i18n.translate("START")}
                                            <i class="icon-control-feedback fa fa-chevron-right"></i>
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

        </div>
    </div>
</bundle:layout>

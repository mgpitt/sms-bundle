<%--TODO:implement subCategoies on categories page--%>
<%@include file="../bundle/initialization.jspf" %>
<c:forEach var="subcategory" items="${currentCat.getSubcategories()}">
<c:set var="subCategoryFormsStatusActive" value="${!subcategory.isEmpty()}"/>
    <c:if test="${fn:toLowerCase(subcategory.getAttribute('Hidden').value) ne 'true' && subCategoryFormsStatusActive == 'true'}">
        <li>
            <p>${i18n.translate(subcategory.getName())}</p>
        </li>
        <c:if test="${fn:toLowerCase(subcategory.getAttribute('Hidden').value) ne 'true' && subCategoryFormsStatusActive == 'true'}">        
            <ul>
                <c:set var="currentCat" value="${subcategory}" scope="request"/>
                <jsp:include page="subCategory.jsp"/>
            </ul>
        </c:if>
    </c:if>
</c:forEach>

<%@include file="../bundle/initialization.jspf" %>
<%--We remove some to the minimum height from the header on all of the pages excepte the kapp page inorder to distinguish the home page from the res of the pages.
    We are setting a JSTL varable called includeHeaderTall on kapp.jsp.--%>
<header class="clearfix header <c:out value="${includeHeaderTall?'header-height-tall':'header-height'}"/>">
    <nav class="header__overlay">
        <div class="container">
          <div class="row">
              <div class="col-md-12">
                <!-- logo -->
                <c:if test="${kapp != null}">
                    <a href="${bundle.kappLocation}" class="pull-left ">
                        <!--If the kapp has an attribute with the name Logo Url and there is a value associated to that value then the image will display
                            If Logo Url is false then a attribute with the name Company Name is looked for if true then the string is displayed
                            If Logo Url is false and Company Name is false then the kapp mane is displayed. -->
                        <c:choose>
                            <c:when test="${kapp.hasAttribute('Logo Url') && not empty kapp.getAttributeValue('Logo Url')}">
                                <img class="header__image" src="${kapp.getAttributeValue('Logo Url')}" alt="logo">
                            </c:when>
                            <c:when test="${kapp.hasAttribute('Company Name') && not empty kapp.getAttributeValue('Company Name')}">
                                <h1 class="font-thin white line-height-70 ">${kapp.getAttributeValue("Company Name")}</h1>
                            </c:when>
                            <c:otherwise>
                                <h1 class="font-thin white line-height-70">${kapp.name}</h1>
                            </c:otherwise>
                        </c:choose>
                    </a>
                </c:if>

                <!-- categories -->
                <c:if test="${!(identity.anonymous)}">
                    <div class="dropdown pull-right border-none m-x-1">
                        <a id="categories" href="#" class="dropdown-toggle  line-height-70 p-a-0" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-bars fa-2x"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <c:forEach var="kapps" items="${space.kapps}">
                            <li>
                                <a href="/kinetic/${space.slug}/${kapps.slug}">
                                    <i class="fa ${kapps.getAttributeValue("Icon")} fa-fw fa-1x icon-black"></i>
                                    <span>${kapps.name}</span>
                                </a>
                            </li>
                            </c:forEach>
                            <c:if test="${identity.spaceAdmin}">
                                <li class="divider hidden-xs"></li>
                                <li class="hidden-xs"><a href="${bundle.spaceLocation}/app/#/${kapp.slug}/activity/overview">
                                    <i class="fa fa-dashboard fa-fw"></i> Management Console</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </c:if>
                <!--The logic of the profile display:
                    1. If user is on login page don't display anything (this is done by setting the variable omitLogin to false on the login.jsp.)
                    2. When the user is anonymous and the kapp is null and not on the login page a "Login" link is displayed (this will direct the user to the app login.)
                    3. When the user is anonymous and not on the login page a "Login" link is displayed (this will direct the user to the bundle login if configured in management console.)
                    4. Otherwise the user will see a gravatar, theirs if they have one, that has an dropdown.-->
                <div class="dropdown pull-right">
                    <c:if test="${empty omitLogin}">
                        <c:choose>
                            <c:when test="${identity.anonymous && kapp == null}">
                                <h3 class="m-y-1"><a class="white" href="${bundle.spaceLocation}/app/login" ><i class="font-medium fa fa-sign-in fa-fw"></i>Login</a></h3>
                            </c:when>
                            <c:when test="${identity.anonymous}">
                                <h3 class="m-y-1"><a class="white" href="${bundle.spaceLocation}/app/login?kapp=${kapp.slug}" ><i class="font-medium fa fa-sign-in fa-fw"></i>Login</a></h3>
                            </c:when>
                            <c:otherwise>
                                <a id="profile" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <div class="avatar line-height-70 m-x-1">
                                        <bundle:gravatar email="${identity.username}" sz="34" >
                                        </bundle:gravatar>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <p class="font-medium">${identity.username}</p>
                                    <div class="font-medium">
                                        <%-- if kapp null--%>
                                        <c:if test="${kapp == null}">
                                            <a href="${bundle.spaceLocation}?page=profile">Your Account</a>
                                        </c:if>
                                        <c:if test="${kapp != null}">
                                            <a href="${bundle.spaceLocation}/${kapp.slug}?page=profile">Your Account</a>
                                        </c:if>
                                    </div>
                                    <div class="font-medium">
                                        <c:choose>
                                            <c:when test='${kapp != null}'>
                                                <a href='${bundle.spaceLocation}/app/logout?kapp=${kapp.slug}' role='menuitem' tabindex='-1'>Logout</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href='${bundle.spaceLocation}/app/logout' role='menuitem' tabindex='-1'>Logout</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>
                <!-- Search -->
                <c:if test="${includeSearch == 'true'}">
                    <a id="nav-search-icon" href='#' class="pull-right border-none m-x-1 line-height-70">
                        <i id="mag-lens" class="fa fa-search fa-2x"></i>
                        <i id="cancel-search" class="hidden fa fa-times-circle-o fa-2x" aria-hidden="true"></i>
                    </a>
                    <div id="nav-search-field" class="nav-search-field hidden pull-right">
                        <form  action="${bundle.kappLocation}" method="GET" role="form">
                            <input type="hidden" value="search" name="page">
                            <input id="search" autocomplete="off" type="text" class="form-control" name="q">
                        </form>
                    </div>
                </c:if>
              </div>
          </div>

        </div>
    </nav>
</header>

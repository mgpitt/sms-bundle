<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<bundle:layout page="layouts/layout.jsp">
    <bundle:variable name="head">
        <title>${text.escape(i18n.translate(space.name))} ${i18n.translate('Reset Password')}</title>
    </bundle:variable>

    <c:choose>
        <c:when test="${param.confirmation == null}">
            <!-- Password reset -->
            <form action="<c:url value="/${space.slug}/app/reset-password"/>" method="POST">
            <c:if test="${param.badtoken != null}">
                <div class="alert alert-danger">
                    ${i18n.translate('Your password reset token was not valid. Please try again.')}
                </div>
            </c:if>

            <!-- CSRF Token field -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <!-- Email field -->
            <div class="form-group">
                <label for="username">
                    ${i18n.translate("Username")}
                </label>
                <input type="text" name="username" id="username" class="form-control" autofocus/>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-default">${i18n.translate("Submit")}</button>
                <a href="<c:url value="/${space.slug}/app/reset-password?confirmation"/>">${i18n.translate('I already have a reset code.')}</a>
            </div>
            </form>
        </c:when>
        <c:otherwise>
            <!-- Password reset confirmation -->
            <form action="<c:url value="/${space.slug}/app/reset-password/token"/>" method="POST">
            <h3>${i18n.translate('Password Reset')}</h3>
            <p>
                ${i18n.translate('You will receive an email with a unique code which will enable you to reset your password. Type that password into the token field and enter your new desired password.')}
            </p>

            <c:if test="${param.nomatch != null}">
                <div class="alert alert-danger">
                    ${i18n.translate('Your passwords did not match.')}
                </div>
            </c:if>

            <!-- CSRF Token field -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <!-- Token field -->
            <div class="form-group">
                <label for="token">
                    ${i18n.translate("Reset Password Token")}
                </label>
                <input type="text" name="token" id="token" class="form-control" autofocus/>
            </div>

            <!-- Password field -->
            <div class="form-group">
                <label for="password">
                    ${i18n.translate("Reset Password Password")}
                </label>
                <input type="password" name="password" id="password" class="form-control"/>
            </div>

            <!-- Password Confirmation field -->
            <div class="form-group">
                <label for="confirmPassword">
                    ${i18n.translate("Confirm Password")}
                </label>
                <input type="password" name="confirmPassword" id="confirmPassword" class="form-control"/>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-default">${i18n.translate("Submit")}</button>
                <a href="<c:url value="/${space.slug}/app/reset-password"/>">${i18n.translate("I don't have a reset code.")}</a>
            </div>
            </form>
        </c:otherwise>
    </c:choose>
</bundle:layout>

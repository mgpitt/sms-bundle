
<%@include file="../bundle/initialization.jspf" %>
<footer class="footer footer-background">
  <div class="">
    <div class="footer--top footer--top__overlay ">
        <div class="footer--top_header">
            <div class="container">
                <div class="row footer--top__content white">
                    <div class="col-md-6">
                        <h4 class="footer--top__header--description m-b-1">${i18n.translate('About us')}</h4>
                            <%--When the kapp has an attribute called Footer About and it has a value in it then display that value.
                                Otherwise display the hard coded value.--%>
                            <c:choose>
                                <c:when test="${kapp.hasAttribute('Footer About') && not empty kapp.getAttributeValue('Footer About')}">
                                    <p>${text.escape(i18n.translate(kapp.getAttributeValue('Footer About')))}</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${i18n.translate('Acme stands out as an industry leader in a competitive field.  The quality of our products has won us the trust of our customers and the admiration of our industry peers.  Acme has had numerous accolades bestowed upon us in our 150 years in the business.')} ${i18n.translate('If you think Acme can be a solution to a problem you are having please let us know.')}</h4>
                                </c:otherwise>
                            </c:choose>
                    </div>
                    <div class="col-md-3">
                        <h4 class="footer--top__header">${i18n.translate('Footer About')}</h4>
                        <ul class="list-unstyled">
                            <li><a target="_blank" href="http://getbootstrap.com/">${i18n.translate('Bootstrap')}</a><li>
                            <li><a target="_blank" href="https://jquery.com/">${i18n.translate('jQuery')}</a></li>
                            <li><a target="_blank" href="https://www.ruby-lang.org/en/">${i18n.translate('Ruby')}</a></li>
                            <li><a target="_blank" href="http://www.kineticdata.com/">${i18n.translate('Kinetic Data')}</a></li>
                            <li><a target="_blank" href="http://www.exploreminnesota.com/index.aspx">${i18n.translate('Explore Minnesota')}</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <h4 class="footer--top__header">${i18n.translate('Legal')}</h4>
                        <ul class="list-unstyled">
                            <li><a target="_blank" href="http://www.kineticdata.com/products/">${i18n.translate('Terms')}</a></li>
                            <li><a target="_blank" href="http://www.kineticdata.com/company/">${i18n.translate('Legal')}</a></li>
                            <li><a target="_blank" href="http://www.kineticdata.com/solutions/">${i18n.translate('Privacy')}</a></li>
                            <li><a target="_blank" href="http://www.kineticdata.com/">${i18n.translate('License')}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="footer--bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-xs-8 gray">
                        <span class="buildDate">${i18n.translate('Build Date:')}<span data-moment>${buildDate}</span><c:if test="${not empty kapp.getForm(kapp.getAttributeValue('FeedBack Form'))}">&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${bundle.spaceLocation}/${kapp.slug}/feedback">${i18n.translate('feedback')}</a></c:if></span>
                    </div>
                    <div class="col-md-6 col-xs-4">
                        <ul class="social-links pull-right">
                            <li>
                                <a target="_blank" href="https://twitter.com/kineticdata">
                                    <span class="fa-stack fa-fw">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a target="_blank" href="https://facebook.com/kineticdata">
                                    <span class="fa-stack fa-fw">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
  </div>


</footer>
<!-- having the script tag her is a temporary work around due to url issue so that the twitter feed will show on the kapp page-->
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
</script>

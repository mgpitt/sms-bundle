## WARNING
This bundle is only compatible with kinetic core version 1.0.5 and after.

## Overview
**Name**: Kinetic Request CE Triangle Bundle
**Repo**: https://github.com/kineticdata/request-ce-bundle-triangle

This bundle is for demonstrating a traditional catalog/self-service portal for Kinetic Request CE with a triangle theme.

It includes the default:

* Listing of Kapps (kapp.jsp)
* Form display (form.jsp)
* Login page (login.jsp)

## Assumptions
Wherever possible we use defaults to make sure the pages will render correctly regardless of any attributes, categories or other configurations you perform on your forms.

The one exception to this is "My Requests" and "My Approvals".  In order to grab only the appropriate submissions we are looking for form types of _"Service"_ for My Requests and _"Approval"_ for My Approvals.  While the form won't break if you don't include this, it also won't show your requests or your approvals.

## Personalization
This bundle easily allows for minor personalization by including optional attributes in your KAPP, Form and/or Categories.

#### KAPP Attributes
* **Icon:** We include font-awesome icons by default you can specify a icon for your kapp by including this attribute and a value. (Example fa-bank)
* **Company Name:** You can specify text to display your company name by including this attribute and a value. (Example ACME)

##### Task Related Attributes
In order to display information about the task fulfillment process when viewing the details of a submission, Kinetic Task connection information must be configured. If both of the following **KAPP Attributes** are set, then a list of tasks will be displayed with submission details. Note that these values can be overridden per form by setting form attributes with the same names.
* **Task Server Url:** The URL to Kinetic Task (Ex: "https://yourserver.com/kinetic-task").
* **Task Source Name:** The name of Kinetic Task Source that corresponds to this instance of Kinetic Request CE (Ex: "Request CE").

#### Form Attributes
* **Icon:** We include font-awesome icons by default you can specify a icon for your form by including this attribute and a value. (Example fa-bank)

#### Category Attributes
* **Icon:** We include font-awesome icons by default you can specify a icon for your category by including this attribute and a value. (Example fa-bank)

## Customization
When you customize this bundle it is a good idea to fork it on your own git server to track your customizations and merge in any code changes we make to the triangle bundle.

We also suggest you update this README with your own change summary for future bundle developers.

### Structure
This triangle bundle uses our standard directory structure.  Bundles are completely self contained so should include all libraries and markup needed.

<code><pre>
/*bundle-name*
  /*bundle*: Initialization scripts and helpers
  /*css*: Cascading style sheets. If you use Sass, output compiled css here.
  /*scss* : Extention to css.  Similar to Sass in functionality but a syntax closer to css style.
  /*images*: image files.
  /*js*: All javascript goes here.
  /*layouts*: One or more layouts wraps your views and generally includes your HTML head elements and any content that should show up on all pages.
  /*libraries*: Include CSS, JS or other libraries here including things like JQuery or bootstrap.
  /*
  /*partials*: These are view snippets that get used in the top-layer JSP views. Feel free to include sub-directories here if your set of partials gets unwieldy.
  /*confirmation.jsp*: The default confirmation page on form submits.
  /*form.jsp*: The default form JSP wrapper.
  /*kapp.jsp*: This is the catalog console page or self service portal page.  This typically lists the forms by category, my requests, my approvals and more.
  /*login.jsp*: The default login page. Can be overridden in your Space Admin Console.
  /*resetPassword.jsp*: The default reset password page. This will trigger the system to send an email to the user to reset their password. Note that the SMTP server needs to be configured to work.
  /*space.jsp*: A page that displays a list of KAPPs (often request catalogs) that you have access to within your space.
</pre></code>

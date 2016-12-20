/* Wrap all js files in iife's to isolate the javascript and remove the chance of having the global scope contaminated */
(function($){
    /*----------------------------------------------------------------------------------------------
     * COMMON INIALIZATION 
     *   This code is executed when the Javascript file is loaded
     *--------------------------------------------------------------------------------------------*/

    // Ensure the BUNDLE global object exists
    bundle = typeof bundle !== "undefined" ? bundle : {};
    // Create your namespace
    bundle.triangle = bundle.triangle || {};
    // Create a scoped alias to simplify references to your namespace
    var triangle = bundle.triangle;
   
    // UTILITY METHODS
    /**
     * We need to add function to the bundle object so they can be accessed in other js files.
     * Because we are refreashing Task runs content on the confirmations.js page we needed a way to call tooltip and momentify when the content refreshes.
     * This is why tooltip and momentify are Utility Methods.
     */
    triangle.tooltip = function(){
        //for displaying tooltip that appear when hovering over elements
        $('[data-toggle="tooltip"]').tooltip(); 
    }
    // Add user's perferred locale
    moment.locale(bundle.config.userLocale);
    triangle.momentify = function() {
        // Moment-ify any elements with the data-moment attribute
        $('[data-moment]').each(function(index, item) {
            var element = $(item);
            // To avoid getting an invalid date if momentify is run twice on the page we are storing the date in an attribute.
            if ($(element).data('date') === undefined) {
                $(element).data('date', element.text()); 
            }
            element.html(moment(element.data('date')).format('LLL'));
        });
        $('[data-moment-ago]').each(function(index, item) {
            var element = $(item);
            // To avoid getting an invalid date if momentify is run twice on the page we are storing the date in an attribute.
            if ($(element).data('date') === undefined) {
                $(element).data('date', element.text()); 
            }
            //To get the tooltip to display the time formated in moment.js we need to swap out data-original-title on the client
            element.attr('data-original-title',moment(element.data('date')).format('LLL'));
            element.html(moment(element.data('date')).fromNow());
        });
    }
    /**
     * Returns an Object with keys/values for each of the url parameters.
     * 
     * @returns {Object}
     */
    bundle.getUrlParameters = function() {
       var searchString = window.location.search.substring(1), params = searchString.split("&"), hash = {};
       for (var i = 0; i < params.length; i++) {
         var val = params[i].split("=");
         hash[unescape(val[0])] = unescape(val[1]);
       }
       return hash;
    };

    /**
     * Applies the Jquery DataTables plugin to a rendered HTML table to provide 
     * column sorting and Moment.js functionality to date/time values.
     * 
     * @param {String} tableId The id of the table element.
     * @returns {undefined}
     */
    function submissionsTable (tableId) {
        $('#'+tableId).DataTable({
            dom: '<"wrapper">t',
            columns: [ { defaultContent: ''}, null, null, null, null ],
            columnDefs: [
                { 
                    render: function ( cellData, type, row ) {
                        var span = $('<a>').attr('href', 'javascript:void(0);');
                        var iso8601date = cellData;
                        $(span).text(moment(iso8601date).fromNow())
                            .attr('title', moment(iso8601date).format('MMMM Do YYYY, h:mm:ss A'))
                            .addClass('time-ago')
                            .data('toggle', 'tooltip')
                            .data('placement', 'top');
                        var td = $('#'+tableId+' td:contains('+cellData+')');
                        td.html(span);
                        return td.html();
                    },
                    targets: 'date'
                },
                {
                    orderable: false,
                    targets: 'nosort'
                }
            ]
        });
    }
    
    // PAGE LOAD EVENTS
    $(document).ready(function(){
        //  Add submit event to the button that is in the search text input field.
        $('#search-button').on('click', function(){
           $(this).closest('form').submit();
        });
        
        $('#cancel-search').removeClass('hidden').hide();
        $('#nav-search-field').removeClass('hidden').hide();
        $('#nav-search-icon').on('click',function(){
           $('#mag-lens').toggle();
           $('#cancel-search').toggle();
           $('#nav-search-field').toggle();
           $('#nav-search-field').addClass('animated fadeIn').css('animation-duration', '1s');
           event.preventDefault();
        });
        
        bundle.triangle.tooltip();
        bundle.triangle.momentify();
    });
    
    /*----------------------------------------------------------------------------------------------
     * BUNDLE.CONFIG OVERWRITES
     *--------------------------------------------------------------------------------------------*/
    
    /**
     * Overwrite the default field constraint violation error handler to use Notifie to display the errors above the individual fields.
     */
    bundle.config = bundle.config || {};
    bundle.config.renderers = bundle.config.renderers || {};
    bundle.config.renderers.fieldConstraintViolations = function(form, fieldConstraintViolations) {
        _.each(fieldConstraintViolations, function(value, key){
            $(form.getFieldByName(key).wrapper()).notifie({
                message: value.join("<br>"),
                exitEvents: "click"
            });
        });
    }
    bundle.config.renderers.submitErrors = function(response) {
        $('[data-form]').notifie({
            message: K.translate('bundle','There was a STATUS : "TEXT" error.')  
                      .replace('STATUS', response.status)
                      .replace('TEXT', response.statusText),
            exitEvents: "click"
        });
    }
})(jQuery);
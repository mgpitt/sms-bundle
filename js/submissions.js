(function($){
    //Makes jquery :contains case-insensitive
    $.expr[":"].contains = $.expr.createPseudo(function(arg) {
        return function( elem ) {
            return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
        };
    });
    $(function(){
        /* We are filtering the list of submissions after 3 characters to give the user time before the dom begins to change.
         * After 3 characters are entered then we wait a half second from each keyup event to reduce the "flash" from the dom being updated so often.
         */
        $('#filter').on('keyup',function(){
            if(($('#filter').val().trim().length) >= 3){
                clearTimeout(timer);
                var timer = setTimeout(function(){
                    $($('[data-filter] ')).hide()
                    /* :contains selects the children of data-filter, but we want to show elements with the data-filter attributs so we 
                     * must select the parent element.
                     */
                    $($('[data-filter] :contains("'+$('#filter').val().trim()+'")').parent()).show()
                }, 500);
            }else if($('#filter').val() === ""){
                $('[data-filter] ').show()
            }
        });
    });
})(jQuery);


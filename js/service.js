(function($){
    $(function(){
        $('form .form-group input, form .form-group textarea, form .form-group select').addClass('form-control');

        $('#personSearchModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal

            $('#name').on("keyup", function(){
                if(($('#name').val().trim().length) >= 3){
                    clearTimeout(timer);
                    var timer = setTimeout(function(){
                        K('field[name]').value($('#name').val())
                        KDSearch.executeSearch(searchConfigs.requestedForConfig);
                    }, 500);
                }
                if($('#searchNotFound').length != 0){
                    $('#personTableDiv').empty()
                }
                if(($('#name').val().trim().length) < 3){
                    $('#requestedForTable_wrapper').remove()
                }
            });
        });
    });
})(jQuery);

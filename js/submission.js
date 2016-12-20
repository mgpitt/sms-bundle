(function($){
    $(function(){
        var id;
        if(bundle.getUrlParameters().page === undefined){
            var urlArray = window.location.href.split('/');
            id = urlArray[urlArray.length -1 ];
        }else{
            id = bundle.getUrlParameters().id
        }
        function updateTasks(){
            $('#right-column').load(bundle.kappLocation()+"?partial=tasks&id="+id, function(){
                setRefreashInterval();
                bundle.triangle.tooltip();
                bundle.triangle.momentify();
                matchColumnHeights();
            });
        };
        function setRefreashInterval(){
            setTimeout(updateTasks, 300000);
        };
        updateTasks();
        
        /* 
         * Using bootstrap columns with a break point at 992px so that the right side "falls" under the left side.
         * There is no need to control the height of the left and right when the two sides are stacked on top of each other.
         */
        function matchColumnHeights(){
            if($(window).width() > 992){
                //An offset is required for some odd reason
                var offset = -5;
                if($(window).width() > 1023){
                    offset = 15;
                }
                var headerFooterHeight = $('footer').height() + $('header').height() + $('nav').height()+offset;
                /* Because of the semi sticky footer a "smallest possiable left hand side of the window is required. */
                leftColumnHeight = $(window).height()-headerFooterHeight;
                $('#left-column').css('min-height',leftColumnHeight);

                /*Control the height of left and right sides for use with background.*/
                var height = Math.max($("#left-column").height(), $('#right-column').height());
                $("#left-column").height(height);
                $("#right-column").height(height);
            };
        }
        matchColumnHeights();
    });
})(jQuery);


 

(function($){
searchConfigs = {
    requestedForConfig:{
        // type: "BridgeDataTable", "BridgeList", "BridgeGetSingle", or "performSDRTable".  Determines default values to be used and behavior.
        type: "BridgeDataTable",
        //responsive: OPTIONAL Default for "BridgeDataTable" is true but can be over written.
        //responsive: false,
        bridgeConfig:{
            //The name of the model used is specified here (this is the name that was given to the Bridge Resource on the form.)
            model: "Search By Name",
            //Parameters to be passed to the bridge.  We are using Kinetic selectors to get the value from a field on the form.
            parameters: {'Notification Name': function(){ return K('field[name]').value();}},
        },
        //For console tables or tables you want to always display, even if there is just one record, this should be set to false.  
        processSingleResult: false,
        clearOnClick:false,
        //Properties in the data must match the attributes of the Bridge Model that was chosen for the Bridge Resource on the form.
        data:{
            "First Name":{
                 //This will be the title of the column or the label of the element, depending on the search type
                title:"FIRST",
            },
            "Last Name":{
                title:"Last",
                //This will be the class given to the column/cell/div as appropriate for the search type
                //A class of all will always display.
                //see https://datatables.net/extensions/responsive/classes for more details and options
                className: "all"
            },
            "Email":{
                title:"EMAIL",
            },
            "Login Id":{
                title:"LOGIN",
                //A class of none is in the subrow data (responsive data)
                //see https://datatables.net/extensions/responsive/classes for more details and options
                className: "none",
            },
            "Work Phone Number":{
                title:"PHONE",
                //For non-responsive datatables, a class of hidden will hide the column. 
                //see https://datatables.net/extensions/responsive/classes for more details and options
                className: "hidden",
            }
        },
        //Where to append the table. This element should exist on the page
        //If a string is returned it will be processed as jQuery. Otherwise
        //return the element in a function.
        appendTo: function(){return $('div#personTableDiv');},
        //ID to give the table when creating it. This should not already exist
        resultsContainerId: 'requestedForTable',
        before: function(){ //before search function can be used to disable buttons or add other custom behavior
        },
        error: function(){  //this is done if the search errors
        },
        success: function (){ //this is done when results are returned successfully
        },
        success_empty: function(){ //this is done if a successful search returns no results
            $('#requestedForTable_wrapper').remove();
            $('#personTableDiv').empty().append('<p id="searchNotFound" class="m-b-3 text-center">No one matiching that name could be found</p>');
        },
        complete: function(){ //this is done when the build of the table completes
        },
        clickCallback: function(results){ //this can be used to create behavior after a row from a table is selected
            $('#reqForUser').empty().append(results["First Name"]+ ' ' + results["Last Name"]);
            $('#closeModal').click()
        },
        createdRow: function ( row, data, index ) { //this is done when the row is being built (a pass through to datatables)
           //see https://datatables.net/reference/option/createdRow for details/options
        },
        fnFooterCallback: function ( nRow, aaData, iStart, iEnd, aiDisplay ) {
        },
        //The dom propertiy can be used to add or remove DataTable elements around the table
        //see https://datatables.net/reference/option/dom to learn more
        dom: 'Brtip',
   },
};
})(jQuery);
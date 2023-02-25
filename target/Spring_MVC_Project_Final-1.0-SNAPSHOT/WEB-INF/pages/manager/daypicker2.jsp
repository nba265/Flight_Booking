<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Select a Date Range</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <script>
    $( function() {
      var dateFormat = "yy-mm-dd",
              from = $( "#startDate" )
                      .datepicker({
                        dateFormat: 'yy-mm-dd',
                        defaultDate: "+1w",
                        changeMonth: true,
                        numberOfMonths: 1,

                      })
                      .on( "change", function() {
                        to.datepicker( "option", "minDate", getDate( this ) );
                      }),
              to = $( "#endDate" ).datepicker({
                dateFormat: 'yy-mm-dd',
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1
              })
                      .on( "change", function() {
                        from.datepicker( "option", "maxDate", getDate( this ) );
                      });

      function getDate( element ) {
        var date;
        try {
          date = $.datepicker.parseDate( dateFormat, element.value );
        } catch( error ) {
          date = null;
        }

        return date;
      }
    } );
  </script>
</head>
<body>

<label for="from">From</label>
<input type="text" id="startDate" name="from">
<label for="to">to</label>
<input type="text" id="endDate" name="to">


</body>
</html>
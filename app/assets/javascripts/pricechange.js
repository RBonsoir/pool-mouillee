$(document).ready(function(){

  // index : double price for whole day

  // => function to get params

  function getUrlParameter(sParam)
  {
      var sPageURL = window.location.search.substring(1);
      var sURLVariables = sPageURL.split('&');
      for (var i = 0; i < sURLVariables.length; i++)
      {
          var sParameterName = sURLVariables[i].split('=');
          if (sParameterName[0] == sParam)
          {
              return sParameterName[1];
          }
      }
  }

  var length = getUrlParameter("length");
  console.log(length);

  // =>  if statement to double price

   if (length == "All+Day" || length == "All+Night+Long" ){

    $( ".price-integer" ).each(function() {
      var doubleprice = parseInt( $( this ).text() ) * 2;
      $( this ).text(doubleprice);
    });
  }


    // show : set price at loading

    if ($("select").val() == "All Day" || $("select").val() == "All Night Long" ){
      var oldprice = parseInt( $("#price-int").text() );
      var doubleprice = parseInt( $("#price-int").text() ) * 2;
      $("#price-int").text(doubleprice);
    }
    else{
      var oldprice = parseInt( $("#price-int").text() );
      $("#price-int").text(oldprice);
    }

    // show : change price when dropdown select

    $( "select" ).change(function() {
    if ($("select").val() == "All Day" || $("select").val() == "All Night Long" ){
      newprice = oldprice * 2;
      $("#price-int").text(newprice);
    }
    else{
      $("#price-int").text(oldprice);
    }
    });
});

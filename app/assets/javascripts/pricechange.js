$(document).ready(function(){

    var oldprice = parseInt( $("#price-int").text() );

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

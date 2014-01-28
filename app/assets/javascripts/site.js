$(function () {
  
  // FitVids
  // $(".fitvids").fitVids();

  // Replace all of the mailto hrefs (avoid spam)
  var at = / at /;
  var dot = / dot /g;
  $('span.mailme').each(function() {
    var addr = $(this).text().replace(at,"@").replace(dot,".");
    $(this).after('<a href="mailto:'+addr+'" title="Send an email">'+ addr +'</a>')
          .hover(function(){window.status="Send a letter!";}, function(){window.status="";})
          .remove();
  });
  
  // Datepicker
  $(".datepicker").datepicker("option", {
      maxDate: "+0m +0w"
    // , dateFormat: "mm/dd/yy"
  });

  // Geocomplete
  var center = new google.maps.LatLng(41.878114,-87.629798);

  if ($(".map_canvas").length) {
    $("#submission_restaurant_name").geocomplete({
      map: ".map_canvas",
      details: "form",
      detailsAttribute: "data-geo",
      types: ["establishment"]
    });

    $("#submission_restaurant_address").geocomplete({
      types: ["geocode"]
    });

    var map =  $("#submission_restaurant_name").geocomplete("map");
    map.setCenter(center);
    map.setZoom(10);
  }
});
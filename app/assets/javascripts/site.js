$(function () {
  // Datepicker
  $(".datepicker").datepicker("option", {
      maxDate: "+0m +0w"
    // , dateFormat: "mm/dd/yy"
  });

  // Geocomplete
  var center = new google.maps.LatLng(41.878114,-87.629798);

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
});
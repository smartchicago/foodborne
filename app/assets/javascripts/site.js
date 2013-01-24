$(function () {
  // Datepicker
  $(".datepicker").datepicker("option", {
      maxDate: "+0m +0w"
    , dateFormat: "mm/dd/yy"
  });

  // Geocomplete
  var chicagoBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(41.691747,-87.54692),
    new google.maps.LatLng(41.991511,-87.806472)
  );

  $("#submission_restaurant_name").geocomplete({
    details: "form",
    detailsAttribute: "data-geo",
    types: ["establishment"],
    bounds: chicagoBounds,
    componentRestrictions: {country: "us"}
  });

  $("#submission_restaurant_address").geocomplete({
    types: ["geocode"],
    bounds: chicagoBounds,
    componentRestrictions: {country: "us"}
  });
});
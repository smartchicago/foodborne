$(function() {
    $('.ga-trackable').on('click', function(event){
    //  send to Google
    _gaq.push(['_trackEvent', 
      $(this).data('trackingCategory'), 
      $(this).data('trackingAction'), 
      $(this).data('trackingLabel')
    ]);    
  });
});
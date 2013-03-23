//= require active_admin/base

$(function () {

  var $reply = $("#tweet_reply"),
      maxLength = $reply.attr("maxlength"),
      $remaining = $(".remaining_characters span").text(maxLength);

  // Use the example tweets to populate the actual reply textbox
  $(".active_admin .example-replies").change(function () {
    var $select = $(this),
        reply = $select.val();

    $reply.val(reply).trigger("keyup");
  });

  // Calculate the remaining characters
  $reply.keyup(function () {
    $remaining.text( maxLength - $reply.val().length );
  });
});

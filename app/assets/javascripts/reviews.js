$(document).on('ready', function() {
  $(".review_form").on("ajax:beforeSend", function(evt, xhr, settings) {
    return $(this).find('textarea').addClass('uneditable-input').attr('disabled', 'disabled');
  })
});

$(document).on('ready page:load', function() {
  $(".review_form").on("ajax:beforeSend", function(evt, xhr, settings) {
    return $(this).find('textarea').addClass('uneditable-input').attr('disabled', 'disabled');
  }).on("ajax:success", function(evt, data, status, xhr) {
    $(this).find('textarea').removeClass('uneditable-input').removeAttr('disabled', 'disabled').val('');
    return $(xhr.responseText).hide().insertBefore($(this)).show('slow');
  });

  // $('.delete_review').on("click", function() {
  //   alert('test');
  // });

});
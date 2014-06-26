$(function() {
  $('#contact-person').change(function() {
    var email = $('#contact-person').val();
    var subject = '?subject=Looking to Pair!'

    $('#negotiate-button').attr('href', 'mailto:' + email + subject);
  });

  var width = $(window).width();

  if (width < 690) {
    $('option').each(function(i) {
      var str = $(this).html();

      var newstr = str.replace(/[(].+[)]/g, '');
      $(this).text(newstr);
    });
  }
});

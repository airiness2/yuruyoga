jQuery(function($) {
  $('tr[data-link]').addClass('clickable')
    .click(function(e) {
      if(!$(e.target).is('a')){
        window.location = $(e.target).closest('tr').data('link');}
  });
});


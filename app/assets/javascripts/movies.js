// $(document).ready(function() {
//   $('.new-movie-form-container #new-movie-form').on('submit', function() {
//     $('.new-movie-info-container').remove();
//     event.preventDefault();
//
//     $form = $(this);
//     var url = $form.attr('action');
//     var method = $form.attr('method');
//     var data = $form.serialize();
//
//     var request = $.ajax({
//       url: url,
//       method: method,
//       data: data
//     });
//
//     request.done(function(response){
//       $(".new-movie-form-container").append(".new-movie-info-container").html(response);
//     });
//   });
// });

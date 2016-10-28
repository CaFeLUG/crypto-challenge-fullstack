// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


var ready = function() {
  /*$("form").submit(function (e) {
    e.preventDefault();

    var clickedForm = $(this);
    var challenge_id = clickedForm.find("[name='challenge[challenge_id]']").val();
    var solution = clickedForm.find("[name='challenge[solution]']").val();
    //console.log(solution);
    if (solution == '') {
      return false;
    } else {
      alert('solution: ' + solution + ', ID: ' + challenge_id );
      //clickedForm.unbind().submit();

    }
  }); */

  $('form.solution-form').submit( function(e) {
        e.preventDefault();
        var challenge_id = $(this).find("[name='challenge[challenge_id]']").val();
        $.ajax({
            url     : $(this).attr('action'),
            type    : 'POST',
            dataType: 'json',
            data    : $(this).serialize(),
            success : function( data ) {
                        if (data.status == 'SOLVED') {
                          $('#challenge' + challenge_id).html('<span class="label label-success">Solved!</span>');
                        } else {
                          $('#challenge' + challenge_id).append('<span class="label label-danger">Wrong answer, try again</span>');
                        }
                      },
            error   : function( xhr, err ) {
                        alert('Error');
                      }
        });
  });

}

$(document).on('turbolinks:load', ready);

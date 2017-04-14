$(document).ready(function() {
  upVoteListener();
  downVoteListener();
});

var upVoteListener = function(){
  $(".upvote-form").on("submit", function(event){
    // event.preventDefault();

    // var $form = $(this);

    // var $request = $.ajax({
    //   type: "PUT",
    //   url: $form.attr("action")
    // })

    // console.log($request)

    // $request.done(function(response){
    //   console.log(response)
    });
  })
}
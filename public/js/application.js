$(document).ready(function() {
  upVoteListener();
  downVoteListener();
});

var upVoteListener = function(){
  $(".upvote-form").on("submit", function(event){
    event.preventDefault();

    var $form = $(this);
    //console.log($form.attr("action"))

    var $request = $.ajax({
      type: "PUT",
      url: $form.attr("action"),
      data: $form.serialize()
    })

    console.log($request)

    $request.done(function(response){
      $form.closest("tr").find(".val_to_change").text(response)
    });
  })
}

var downVoteListener = function(){
  $(".downvote-form").on("submit", function(event){
    event.preventDefault();

    var $form = $(this);
    //console.log($form.attr("action"))

    var $request = $.ajax({
      type: "PUT",
      url: $form.attr("action"),
      data: $form.serialize()
    })

    console.log($request)

    $request.done(function(response){
      $form.closest("tr").find(".val_to_change").text(response)
    });
  })
}
$(document).ready(function() {
  upVoteListener();
  downVoteListener();
  deleteCharListener();
});

var upVoteListener = function(){
  $(".upvote-form").on("submit", function(event){
    event.preventDefault();

    var $form = $(this);

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

    var $request = $.ajax({
      type: "PUT",
      url: $form.attr("action"),
      data: $form.serialize()
    })

    $request.done(function(response){
      $form.closest("tr").find(".val_to_change").text(response)
    });
  })
}

var deleteCharListener = function(){
  $("#delete-char-form").on("submit", function(event){
    event.preventDefault();

    var confirmDelete = confirm("Are you sure you want to delete this character?");

    if (confirmDelete === true){
      $form = $(this)
      var $request = $.ajax({
        type: "DELETE",
        url: $form.attr("action"),
      })

      $request.done(function(response){
        var url = "/users/" + response;
        top.location.href = url;
      })
    }
  })
}
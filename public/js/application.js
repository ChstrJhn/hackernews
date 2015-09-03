$(document).ready(function() {
$(".vote").click(function(event) {
  	event.preventDefault();
  	var $target = $(event.target);
    $target.val("Voting...");
    // $target.attr("disabled", "true");
    $form = $target.parent();

    $.ajax({
    	type: $form.attr('method'),
    	url: $form.attr('action'),
    	dataType: "JSON"
    }).done(function(response){
    	console.log(response);
    	console.log(response.votes);
    	$form.parent().find("span").html(response.votes);
    	$target.val("Voted");
    });
  })
});

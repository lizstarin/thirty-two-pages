$(document).ready(function(){
	
  $(".recto").on("click", function(){
    $("#dummy").css("left", "-=816");
    $("#dummy-text").css("left", "-=816")
    // console.log("clicked!");
  });

  $(".verso").on("click", function(){
    $("#dummy").css("left", "+=816");
    $("#dummy-text").css("left", "+=816")
    // console.log("clicked!");
  });

  $(".dummy-page-text").on("dblclick", function() {
    var that = this;
    $(that).addClass("is-off");
    var oldCaption = $(that).text();
    $(that).next("div").removeClass("is-off");
    $(that).next("div").val(oldCaption);
    $("textarea").focus();
  });

  $("textarea").on("blur", function() {
    var that = this;
    $(".page-update-form").addClass("is-off");
    $(".page-update-form").prev("div").removeClass("is-off");
    var newCaption = $(that).val();
    console.log(newCaption);
    console.log(that);
    var putUrl = $(that).closest("form").attr("action");
    console.log(putUrl);
		$(that).closest("form").submit( { content: newCaption} );
    // $.ajax({
    //   url: putUrl,
    //   type: "PUT",
    //   data: { content: newCaption },
    //   success: function() {
    //     console.log("I updated!");
    //     $(that).html(newCaption);
    //   }
    // });
  });
	
});




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
    var putUrl = $(that).closest("form").attr("action");
    // $(that).closest("form").submit();
    $(that).closest("div").prev("div").html(newCaption);
    $.ajax({
      url: putUrl,
      type: "PUT",
      data: { content: newCaption },
      success: function() {
        console.log("I updated!");
        // $(that).html(newCaption);
      }
    });
  });

  $(function() {
    $("input:file").change(function (){
      var fileName = $(this).val();
      $(".photo-file-name").html(fileName);
      console.log(fileName);
    });
  });

  $(function() {
    $(".draggable").draggable( {cursor: "move"} );
    $(".resizable").resizable( {cursor: "crosshair", ghost: true} );
    $(".droppable").droppable({
      // tolerance: "fit",
      hoverClass: "highlight",
      greedy: true,
      drop: function (event, ui) {
        console.log(ui);
        $(ui.draggable).addClass("is-off");
        var bigImageUrl = $(ui.draggable).find("img").attr("data-url");
        var bigImage = $("<img src='" + bigImageUrl + "'>");
        bigImage.attr("data-url", bigImageUrl);
        bigImage.addClass("stretched resizable");
        $(this).append(bigImage);
      }
    });
  });

  // // $(this).droppable("disable");
  // // bigImage.resizable({cursor: "crosshair", ghost: true});
  // $(bigImage).draggable({cursor: "move", snap: this, snapMode: "inner"});


  // $("img").on("mouseover", function () {
  //   console.log("hovering");
  //   $(this).resizable("enable");
  // });
  //
  // $("img").on("mouseoff", function () {
  //   console.log("not hovering");
  //   $(this).resizable("disable");
  // });

  // $("recto").on("dblclick", function () {
  //   $(this).addClass("cropped");
  // });
  //
  // $("recto.cropped").on("dblclick", function () {
  //   $(this).removeClass("cropped");
  // });


  // $(".sidebar-file-field").on("change", function() {
  //   var that = this;
  //   $(that).closest(".photo-attachment-container").addClass("is-off")
  // });

});




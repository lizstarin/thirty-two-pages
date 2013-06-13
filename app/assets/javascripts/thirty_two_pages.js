$(document).ready(function(){

  $(".recto").on("click", function(){
    $("#dummy").css("left", "-=800");
  });

  $(".verso").on("click", function(){
    $("#dummy").css("left", "+=800");
  });

  $(".text").on("dblclick", function() {
    var that = this;
    $(that).addClass("is-off");
    var oldCaption = $(that).text();
    $(that).next("div").removeClass("is-off");
    $(that).next("div").val(oldCaption);
    $("textarea").focus();
  });

  $("textarea").on("blur", function() {
    var that = this;
    $(".text-update-form").addClass("is-off");
    $(".text-update-form").prev("div").removeClass("is-off");
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
    $(".draggable").draggable( {cursor: "move", revert: "invalid"} );
    $(".resizable").resizable( {cursor: "crosshair", ghost: true, handles: "ne, se"} );
    $(".droppable").droppable({ hoverClass: "highlight", greedy: true });
  });

  function inView (droppableArea) {
    var dummyPos = $(droppableArea).closest("#dummy").css("left");
    var left = parseInt(dummyPos.substring(0, dummyPos.length - 2));
    var pageNum = parseInt($(droppableArea).find("p.page-num").text());
    var pagePos = left + 400 * pageNum

    if (pagePos == 400 || pagePos == 800) {
      return true;
    } else {
      return false;
    }
  };

  $(".droppable").on("drop", function (event, ui) {
    var that = this;
    if (inView(this) == true) {
      $(ui.draggable).addClass("is-off");
      var bigImageUrl = $(ui.draggable).find("img").attr("data-url");
      var bigImage = $("<img src='" + bigImageUrl + "'>");
      bigImage.attr("data-url", bigImageUrl);
      bigImage.addClass("stretched");
      $(this).append(bigImage);
      $(this).find("input").focus();
  		console.log($(this).find("input"));
      var urlToParse = $(this).closest(".page").find("form").attr("action");
      var pageNum = urlToParse.match(/\d*(?=\/caption)/)[0];
      // var re = bigImageUrl.match(/original\/.*/);
      var imageFileName = bigImageUrl.split("/").pop().split("?")[0];

      $.ajax({
        url: "/pages/" + pageNum + "/image",
        type: "PUT",
        data: { page_id: pageNum, file_file_name: imageFileName },
        success: function() {
          console.log("I updated!");
        }
      });


    } else {
      $(ui.draggable).draggable( {revert: true} );
    }
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




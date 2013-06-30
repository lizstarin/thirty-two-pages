$(document).ready(function(){

  // Dummy image manipulation

  $(function() {
    console.log("initializing");
    $(".draggable").draggable( {cursor: "move", revert: "invalid"} );
    $(".page-image.droppable").droppable( {hoverClass: "highlight", greedy: true, accept: "img.photo-thumb"} );
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
	
  $(".page-image").on("drop", "img.photo-thumb", function (event, ui) {
    if (inView(this).closest(".page-image") == true) {
      var bigImage = $('<img src=' + $(this).attr("src").replace("thumb", "original") + '>');

      $(this).addClass("is-off");

      bigImage.addClass("stretched big-image");
	    bigImage.draggable( {cursor: "move", revert: "invalid"} );

      $(this).closest(".page-image").prepend(bigImage);

      var urlToParse = $(this).closest(".page").find("form").attr("action");    // Pulls page id
      var pageNum = urlToParse.match(/\d*(?=\/caption)/)[0];                    // out of text submit form
      var imageFileName = bigImage.attr("src").split("/").pop().split("?")[0];
      updatePageImage(pageNum, imageFileName);

    } else {
      $(ui.draggable).draggable( {revert: true} );
    }
  });

  function updatePageImage (pageNum, imageFileName) {
    $.ajax({
      url: "/pages/" + pageNum + "/image",
      type: "PUT",
      data: { page_id: pageNum, file_file_name: imageFileName },
      success: function() {
        console.log("I updated!");
      }
    });
  };
	
  $("div.page-image").on("dragstart", "img", function (event, ui) {
    var urlToParse = $(this).closest(".page").find("form").attr("action");	  // Pulls page id
    var pageNum = urlToParse.match(/\d*(?=\/caption)/)[0];                    // out of text submit form
		
    var page = $(this).closest("div.page-image")
    page.removeClass("cropped");
		
    console.log("dragged out!");

    $(this).closest("div.page-image").empty();
    var smallImage = $('<img src=' + $(this).attr("src").replace("original", "thumb") + '>');
		
		smallImage.addClass("photo-thumb");
    smallImage.draggable( {cursor: "move", revert: "invalid"} );

    updatePageImage(pageNum, null);
    $(".photo-thumbs-sidebar").append(smallImage);
  });
	
  // $("div.page-image").on("dragstop", "img", function (event, ui) {
 //    var page = $(this).closest("div.page-image")
 //    page.addClass("cropped");
 //  });
 // 	
 //  $("div.page-image").on("dropout", "img", function (event, ui) {
 //    console.log("dragged out!");
 // 
 //    $(this).closest("div.page-image").empty();
 //    var smallImage = $('<img src=' + $(this).attr("src").replace("original", "thumb") + '>');
 // 
 //    $(this).addClass("is-off");
 // 		
 // 		smallImage.addClass("photo-thumb");
 //    smallImage.draggable( {cursor: "move", revert: "invalid"} );
 // 
 //    var urlToParse = $(this).closest(".page").find("form").attr("action");    // Pulls page number
 //    var pageNum = urlToParse.match(/\d*(?=\/caption)/)[0];                    // out of text submit form
 // 
 //    updatePageImage(pageNum, null);
 //    $(".photo-thumbs-sidebar").append(smallImage);
 //  });
	
  $("input:file").change(function () {
    $(this).closest("form").submit();                             // Soooooo slooooowwwwwww
  });

});




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
	
  $(".page-image").on("drop", function (event, ui) {
    if (inView(this) == true) {
      var bigImage = $('<img src=' + $(ui.draggable).attr("src").replace("thumb", "original") + '>');

      $(ui.draggable).remove();

      bigImage.addClass("stretched big-image");
	    bigImage.draggable( {cursor: "move", revert: "invalid"} );

      $(this).prepend(bigImage);
			$(this).addClass("cropped");
			
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
    var smallImage = $('<img src=' + $(this).attr("src").replace("original", "thumb") + '>');
			
		$(this).closest("div.page-image").removeClass("cropped");
		updatePageImage(pageNum, null);
    console.log("dragged out!");
		
		smallImage.addClass("photo-thumb");
    smallImage.draggable( {cursor: "move", revert: "invalid"} );

    $(".photo-thumbs-sidebar").append(smallImage);
		
		// $(this).closest("div.page-image").on("dropout", function (event, ui) {
// 			console.log("dropped out");
// 	    // var smallImage = $('<img src=' + $(this).find("img").attr("src").replace("original", "thumb") + '>');
// 
// 	    // $(this).find("img").addClass("is-off");
//   	  $(this).find("img").remove();
// 		
// 			smallImage.addClass("photo-thumb");
// 	    smallImage.draggable( {cursor: "move", revert: "invalid"} );
// 
// 	    // updatePageImage(pageNum, null);
// 	    $(".photo-thumbs-sidebar").append(smallImage);
// 		});
  });
	
  $("div.page-image").on("dragstop", "img", function (event, ui) {		
		$(this).closest("div.page-image").addClass("cropped");
		$(this).remove();
  });
	
  $("input:file").change(function () {
    $(this).closest("form").submit();                             // Soooooo slooooowwwwwww
  });

});




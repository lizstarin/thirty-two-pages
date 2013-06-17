$(document).ready(function(){

  $(".recto").on("click", function(){
    $("#dummy").css("left", "-=800");
  });

  $(".verso").on("click", function(){
    $("#dummy").css("left", "+=800");
  });

  $(".caption-text").on("dblclick", function() {
    var that = this;
    $(that).addClass("is-off");
    var oldCaption = $(that).text();
    $(that).next("div").removeClass("is-off");
    $(that).next("div").val(oldCaption);
    $(that).next("div").find("textarea").focus();
  });

  $("div.text-update-form.recto,form,textarea").on("blur", function() {
    var that = this;
    $("div.text-update-form.caption-recto").addClass("is-off");
    $("div.caption-text.caption-recto").removeClass("is-off");
    var newCaption = $(that).val();
    var putUrl = $(that).closest(".edit_caption").attr("action");
    $(that).closest("div").prev("div").html(newCaption);
    $.ajax({
      url: putUrl,
      type: "PUT",
      data: { content: newCaption },
      success: function() {
        console.log("I updated!");
      }
    });
  });

  $("div.text-update-form.verso,form,textarea").on("blur", function() {
    var that = this;
    $("div.text-update-form.caption-verso").addClass("is-off");
    $("div.caption-text.caption-verso").removeClass("is-off");
    var newCaption = $(that).val();
    var putUrl = $(that).closest(".edit_caption").attr("action");
    $(that).closest("div").prev("div").html(newCaption);
    $.ajax({
      url: putUrl,
      type: "PUT",
      data: { content: newCaption },
      success: function() {
        console.log("I updated!");
      }
    });
  });

  // $(function() {
  //   $("input:file").change(function (){
  //     var fileName = $(this).val();
  //     $(".photo-file-name").html(fileName);
  //     console.log(fileName);
  //   });
  // });

  $(function() {
    $(".draggable").draggable( {cursor: "move", revert: "invalid"} );
    $(".resizable").resizable( {cursor: "crosshair", ghost: true, handles: "ne, se"} );
    $(".page-image.droppable").droppable({ hoverClass: "highlight", greedy: true });
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

  function linkSmallToBig (smallImage) {
    var smallImageUrl = $(smallImage).find("img").attr("src");
    var bigImageUrl = $(smallImage).find("img").attr("data-url");
    var bigImage = $("<img src='" + bigImageUrl + "' data-thumb-url='" + smallImageUrl + "'>");
    return bigImage;
  };

  function linkBigToSmall (bigImage) {
    var bigImageUrl = $(bigImage).find("img").attr("src");
    var smallImageUrl = $(bigImage).find("img").attr("data-thumb-url");
    var smallImage = $("<img src='" + smallImageUrl + "' data-url='" + bigImageUrl + "'>");
    return smallImage;
  };

  function getImageFileName (image) {
    var imageFileName = image.attr("src").split("/").pop().split("?")[0];
    return imageFileName;
  };

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

  $(".image-recto,img").on("mouseenter", function (event, ui) {
    var that = this;
    console.log(that);
    setTimeout(function () {
      console.log("I am resizable!");
      $(that).triggerHandler("focus");
      $(that).focus(function() {
        console.log("focused!")
      });
      $(that).closest(".page-image.recto").removeClass("cropped");
      $(that).resizable();
    }, 1000);
  });

  $(".page-image-recto,.image-recto).on("blur", function (event, ui) {
    console.log("I am not resizable!");
    $(this).closest(".page-image").addClass("cropped");
    $(this).resizable("destroy");
  });

  $(".page-image").on("drop", function (event, ui) {
    if (inView(this) == true) {
      var bigImage = linkSmallToBig(ui.draggable);

      $(ui.draggable).addClass("is-off");

      console.log(bigImage);
      bigImage.draggable();
      bigImage.addClass("draggable stretched page-image-object");

      $(this).prepend(bigImage);
      $(this).droppable("destroy");

      var urlToParse = $(this).closest(".page").find("form").attr("action");    // Pulls page number
      var pageNum = urlToParse.match(/\d*(?=\/caption)/)[0];                    // out of text submit form
      var imageFileName = getImageFileName(bigImage);

      updatePageImage(pageNum, imageFileName);

    } else {
      $(ui.draggable).draggable( {revert: true} );
    }
  });

  $(".page-image").on("out", function (event, ui) {
    if (inView(this) == true) {
      console.log("dragged out!");
      var smallImage = linkBigToSmall(ui.draggable);

      $(ui.draggable).addClass("is-off");

      smallImage.draggable( {revert: true} );
      smallImage.addClass("draggable");

      $(this).empty();
      $(this).droppable();

      var urlToParse = $(this).closest(".page").find("form").attr("action");    // Pulls page number
      var pageNum = urlToParse.match(/\d*(?=\/caption)/)[0];                    // out of text submit form

      updatePageImage(nil, nil);
      $(".photo-thumbs-sidebar").prepend(smallImage);

    } else {
      $(ui.draggable).draggable( {revert: true} );
    }
  });

  $("input:file").change(function () {
    console.log("file selected");
    // $(this).closest("form").fileupload({
  //     singleFileUploads: false,
  //     sequentialUploads: true
  //   });
    // var imageFileName = $(this).closest("input").val();
    // var projectId = window.location.pathname.split("/").pop();
    $(this).closest("form").submit();                             // Soooooo slooooowwwwwww
    // $.ajax({
      // url: "/projects/" + projectId + "/images",
      // type: "POST",
      // data: { project_id: projectId, file_file_name: imageFileName },
      // success: function() {
        // console.log("I updated!");
      // }
    // });
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




// window.TTP = {
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
      var getPutUrl = $("form").attr("action");
      console.log(getPutUrl);
      $.ajax({
        url: getPutUrl,
        type: "PUT",
        data: { content: newCaption },
        success: function() {
          console.log("I updated!");
          $(that).html(newCaption);
        }
      });
    });



    // $(".dummy-page-text textarea").on("blur", function() {
    //   var that = this;
    //   console.log("I blurred!");
      // $("body").click(function() {
     //    var newCaption = $(that).val();
     //    $(that).submit( {"content": newCaption} );
     //  });
    // });



    // $(".dummy-page-text textarea").blur(function(){
    //     console.log("I blurred!");
    //     $.ajax({
    //       type: "POST",
    //       url: "/controller/action",
    //       data: $(this).val(),
    //       dataType: "script",
    //       callback: null
    //     });
    //   }
    //   return false;
    // });

  });
// };
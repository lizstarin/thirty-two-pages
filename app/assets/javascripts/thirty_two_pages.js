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
      console.log("I double-clicked!");
      var oldCaption = $(that).text();
      $(that).html("<textarea name='caption\\[content\\]' id='caption_content'></textarea>");
      $("#caption_content").val(oldCaption);
      $("#caption_content").focus();
    });

    // $(".dummy-page-text").on("blur", function() {
 //      var that = this;
 //      console.log("I focused!");
 //      $("body").dblclick(function() {
 //        var newCaption = $("#caption_content").val();
 //
 //      });
 //    });
  });
// };
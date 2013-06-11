// window.TTP = {
  $(document).ready(function(){
    $(".recto").on("click", function(){
      $("#dummy").css("left", "-=816");
      // console.log("clicked!");
    });

    $(".verso").on("click", function(){
      $("#dummy").css("left", "+=816");
      // console.log("clicked!");
    });
  });
// };
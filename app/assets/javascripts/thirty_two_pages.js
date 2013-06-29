$(document).ready(function(){

  // Handles dummy page turns

  $(".recto").on("click", function(){
    $("#dummy").css("left", "-=800");
  });

  $(".verso").on("click", function(){
    $("#dummy").css("left", "+=800");
  });

  // Updates dummy captions

  $(".caption-text.editable").on("dblclick", function() {
    var that = this;
    $(that).addClass("is-off");
    var oldCaption = $(that).text();
    $(that).next("div").removeClass("is-off");
    $(that).next("div").val(oldCaption);
    $(that).next("div").find("textarea").focus();
  });

  // ...right page captions

  $("div.text-update-form.caption-recto > form > textarea").on("blur", function() {
    var that = this;
    $("div.text-update-form.caption-recto").addClass("is-off");
    $("div.caption-text.caption-recto").removeClass("is-off");
    var newCaption = $(that).val();
    var putUrl = $(that).closest(".edit_caption").attr("action");
    $(that).closest("div").prev("div").html(newCaption);
    $.ajax({
      url: putUrl,
      type: "PUT",
      data: { content: newCaption }
    });
  });

  // ...left page captions (should refactor)

  $("div.text-update-form.caption-verso > form > textarea").on("blur", function() {
    var that = this;
    $("div.text-update-form.caption-verso").addClass("is-off");
    $("div.caption-text.caption-verso").removeClass("is-off");
    var newCaption = $(that).val();
    var putUrl = $(that).closest(".edit_caption").attr("action");
    $(that).closest("div").prev("div").html(newCaption);
    $.ajax({
      url: putUrl,
      type: "PUT",
      data: { content: newCaption }
    });
  });

  // Adds new post

  $("section.new-post-form > form > article.button").on("click", function() {
    var that = this;
    $(that).attr("disabled","true");
    var projectId = window.location.pathname.split("/")[4];
    var postContent = $("section.new-post-form > form > article > textarea").val();
    $.ajax({
      url: "/posts",
      type: "POST",
      data: { content: postContent, project_id: projectId },
      success: function(data) {
        console.log("posted");
        var newPost = $("<article class='post'></article>").load("/posts/refresh");
        $(".posts").prepend(newPost);
        $("section.new-post-form > form > article > textarea").val("");
        $(that).attr("disable","false");
      }
    });
  });

  // Adds new comment

  $(".posts").on("click", "span.post-add-comment > button", function () {
    var that = this;
    var commentForm = $(that).closest("div.footer").find("form.new-comment-form");
    if (commentForm.is(":hidden")) {
      commentForm.removeClass("is-off");
    } else {
      commentForm.addClass("is-off");
    }
  });

  $(".posts").on("click", "div.new-comment-button > input[type='submit']", function () {
    var that = this;
    $(that).attr("disabled", "true");
    var actionUrl = $(that).closest("div.footer").find("form.new-comment-form").attr("action");
    var newComment = $(that).closest("div.footer").find("textarea").val();
    $.ajax({
      url: actionUrl,
      type: "POST",
      data: { content: newComment },
      success: function () {
        $(that).closest("div.footer").find("form.new-comment-form").addClass("is-off");
        var newComment = $("<li class='comment'></li>").load(actionUrl + "/refresh");
        $(that).closest("div.post-main-container").find("ul.comments").append(newComment);
        $(that).attr("disabled","false");
        $(that).closest("div.footer").find("textarea").val("");
      }
    });
  });

  // Likes / unlikes

  $(".posts").on("click", "span.post-add-like input[type='submit']", function() {
    var that = this;
    $(that).attr("disabled","true");
    var actionUrl = $(that).closest("form").attr("action");
    console.log(actionUrl);
    $.ajax({
      url: actionUrl,
      type: "POST",
      success: function() {
        console.log("liked");
        console.log($(that).closest(".post"));
        $(that).closest("div.footer").find(".post-likes").load(actionUrl + "/refresh");
        $(that).closest("span").remove();
      }
    });
  });

  // Accepts / rejects friend request

  $("article.friend-request > form > div > input[type='submit']").on("click", function() {
    var that = this;
    $(that).attr("disabled","true");
    var actionUrl = $(that).closest("form").attr("action");
    var refreshUrl = actionUrl.split("friend_requests")[0] + "friend_requests/refresh";
    $.ajax({
      url: actionUrl,
      type: "PUT",
      success: function() {
        if (actionUrl.split("=")[1] == "accepted") {
          var newFriend = $("<li class='user-listing'></li>").load(refreshUrl);
          $("section.user-friends > ul.user-list").append(newFriend);
        }
        $(that).closest("article.friend-request").remove();
      }
    });
  });
	
	
});
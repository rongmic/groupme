# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.Topics =
  like : (el) ->
    $el = $(el)
    topic_id = $el.data("id")
    if $el.data('state') != "liked"
      $.ajax
        url: "/likes"
        type: "POST"
        data:
          id: topic_id
      Topics.setLiked(el)
    else
      $.ajax
        url : "/likes/#{topic_id}"
        type : "DELETE"
      Topics.setNotLiked(el)
    false


  setLiked : (el) ->
    $(el).data("state":"liked").attr("title","dislike")
    $('span', el).attr("class", "glyphicon glyphicon-heart")

  setNotLiked : (el) ->
    $(el).data("state":"").attr("title","like")
    $('span', el).attr("class", "glyphicon glyphicon-heart-empty")





$(document).ready ->

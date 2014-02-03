# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $comment_form = $('.comment-form')
  $comment_form.hide()
  $add_comment = $('.add-comment')
  $add_comment.hover(->
    $(this).css('cursor', 'pointer')
  )
  $add_comment.click(->
    $comment_form.toggle()
  )
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:load page:fetch ready", ()->
  $.material.init()
  $(".form-control").on "click", ()->
    $(".form-group").addClass("is-focused")
  $(".close-parent").on "click", ()->
    $(this).parent().slideUp()


$(document).on 'ready page:load', ->
  $(".calendar-day").on "click", ->
    date = $(this).data("date")
    location = $(this).steps("next");


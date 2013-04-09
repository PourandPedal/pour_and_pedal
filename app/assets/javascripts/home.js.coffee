$(document).ready ->
  $("#myCarousel").carousel()
  $("#myCarousel").swiperight ->
    $("#myCarousel").carousel "prev"

  $("#myCarousel").swipeleft ->
    $("#myCarousel").carousel "next"
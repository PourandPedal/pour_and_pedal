$(document).ready ->
  $("#readmore").click ->
    $("#readmoretext, #readless, #readmore").toggle 650
    false
  $("#readless").click ->
    $("#readmoretext, #readless, #readmore").toggle 500
    false
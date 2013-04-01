$(document).ready ->
  $("#readmore").click ->
    $("#readmoretext, #readless, #readmore").toggle 650
    false
  $("#readless").click ->
    $("#readmoretext, #readless, #readmore").toggle 500
    false
  $("#forgot").click ->
    $("#forgot").toggle 100
    false
  $("#forgot").click ->
    $("#forgotform, #nevermind").toggle 500
    false
  $("#nevermind").click ->
    $("#nevermind").toggle 100
    false
  $("#nevermind").click ->
    $("#forgotform, #forgot").toggle 200
    false
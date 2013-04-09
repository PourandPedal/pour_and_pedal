google.load "jquery", "1.3.1"
google.load "jqueryui", "1.7.0"
google.setOnLoadCallback ->

  # When everything has loaded, place all polaroids on a random position
  # rotate left
  # rotate right

  # Internet Explorer doesn't have the "window.innerWidth" and "window.innerHeight" properties
  # safari only
  # added in case CSS3 is standard

  # Set the Z-Index (used to display images on top while dragging)

  # boolean to check if the user is dragging

  # Show the polaroid on top when clicked on

  # Bring polaroid to the foreground
  # added in case CSS3 is standard
  # safari only

  # Make the polaroid draggable & display a shadow when dragging
  # added in case CSS3 is standard
  # safari only
  # rotate left
  # rotate right
  # added in case CSS3 is standard
  # safari only
  # added in case CSS3 is standard
  # safari only

  # Function to get random number upto m
  # http://roshanbh.com.np/2008/09/get-random-number-range-two-numbers-javascript.html
  randomXToY = (minVal, maxVal, floatVal) ->
    randVal = minVal + (Math.random() * (maxVal - minVal))
    (if typeof floatVal is "undefined" then Math.round(randVal) else randVal.toFixed(floatVal))
  $(".polaroid").each (i) ->
    tempVal = Math.round(Math.random())
    if tempVal is 1
      rotDegrees = randomXToY(330, 360)
    else
      rotDegrees = randomXToY(0, 30)
    if window.innerWidth is `undefined`
      wiw = 1000
      wih = 700
    else
      wiw = window.innerWidth
      wih = window.innerHeight
    cssObj =
      left: Math.random() * (wiw - 400)
      top: Math.random() * (wih - 400)
      "-webkit-transform": "rotate(" + rotDegrees + "deg)"
      transform: "rotate(" + rotDegrees + "deg)"

    $(this).css cssObj

  zindexnr = 1
  dragging = false
  $(".polaroid").mouseup (e) ->
    unless dragging
      zindexnr++
      cssObj =
        "z-index": zindexnr
        transform: "rotate(0deg)"
        "-webkit-transform": "rotate(0deg)"

      $(this).css cssObj

  $(".polaroid").draggable
    cursor: "move"
    start: (event, ui) ->
      dragging = true
      zindexnr++
      cssObj =
        "box-shadow": "#888 5px 10px 10px"
        "-webkit-box-shadow": "#888 5px 10px 10px"
        "margin-left": "-10px"
        "margin-top": "-10px"
        "z-index": zindexnr

      $(this).css cssObj

    stop: (event, ui) ->
      tempVal = Math.round(Math.random())
      if tempVal is 1
        rotDegrees = randomXToY(330, 360)
      else
        rotDegrees = randomXToY(0, 30)
      cssObj =
        "box-shadow": ""
        "-webkit-box-shadow": ""
        transform: "rotate(" + rotDegrees + "deg)"
        "-webkit-transform": "rotate(" + rotDegrees + "deg)"
        "margin-left": "0px"
        "margin-top": "0px"

      $(this).css cssObj
      dragging = false


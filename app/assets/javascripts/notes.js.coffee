# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#rateYo').rateYo(
    numStars: 5,
    starWidth: "50px",
    spacing: "10px",
    normalFill: '#EFEFEF',
    ratedFill: '#fff251',
    rating: gon.overall,
    fullStar: true).on 'rateyo.set', (e, data) ->
    document.getElementById('overall').value = data.rating
    return
  return


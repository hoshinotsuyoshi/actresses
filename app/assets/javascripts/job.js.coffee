# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#dummy #_actress_name').change ->
    text = $('#dummy #_actress_name').val()
    $('.ajax_trigger #_actress_name').val(text)

  $('#dummy #_release_date').change ->
    text = $('#dummy #_release_date').val()
    $('.ajax_trigger #_release_date').val(text)

  $('.ajax_trigger').on 'ajax:beforeSend', (event, data)->
    $(this).children('#notice').text("...Sending...")

  $('.ajax_trigger').on 'ajax:loading', (event, data)->
    $(this).children('#notice').text("...loading...")

  $('.ajax_trigger').on 'ajax:success', (event, data)->
    $(this).children('#notice').text(data['result'])

  $('.ajax_trigger').on 'ajax:error', (event, data)->
    alert("error")
    $(this).children('#notice').text("error!")


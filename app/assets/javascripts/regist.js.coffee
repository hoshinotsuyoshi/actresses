# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # actress_nameのchangeに反応
  $('#dummy #_actress_name').change ->
    # hidden fieldを埋める
    text = $('#dummy #_actress_name').val()
    $('.ajax_trigger #_actress_name').val(text)
    # 一致するactress_nameのボタンを青くする
    $('button.actress_button').removeClass("btn-primary")
    $('button.actress_button:contains(' + text + ')').addClass("btn-primary")

  # actress_nameのchangeに反応
  #$('button.actress_button').on 'click',(event,data)->
  $('button.actress_button').click ->
    # 空白があるのでtrim
    text = $.trim($(this).text())
    $('#dummy #_actress_name').val(text).change() #最後のchange()が無いとchangeが発火しない

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


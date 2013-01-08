###
# jquery.counting
# Simple Countdown Plugin.
#
# Examples and document at http://oame.github.com/jquery.counting
#
# Copyright(C) 2013 o_ame http://oameya.com
# version: 1.0
# require: jQuery 1.7.2+
# license: MIT License
###

jQuery ->
  $.counting = (element, options) ->
    $oneMilliSecond = 1
    $oneSecond = 1000
    $oneMinute = 1000 * 60
    $oneHour = 1000 * 60 * 60
    $oneDay = 1000 * 60 * 60 * 24

    $defaults =
      format: "%d日と%H時間%m分%s秒"
      countUntil: null
      outdated_message: "期日になりました。"

    $settings = {}

    $element = $ element
    $interval = null

    format_text = (fmt, params) ->
      fmt.replace /%(.)/g, ($0, $1) ->
        (if (params[$1] and typeof (params[$1]) isnt "object") then params[$1].toString() else JSON.stringify(params[$1]))

    startCounting = ->
      $interval = setInterval (=> updateCountDown()), $oneMilliSecond
      updateCountDown()

    stopCounting = ->
      clearInterval($interval)

    timeLeft = ->
      now = (new Date()).getTime()# - (new Date()).getTimezoneOffset() * $oneMinute
      milliSecsLeft = $settings.countUntil - now
      if milliSecsLeft < 0
        return 0

      days = parseInt(milliSecsLeft / $oneDay)
      hours = parseInt((milliSecsLeft % $oneDay) / $oneHour)
      minutes = parseInt(((milliSecsLeft % $oneDay) % $oneHour) / $oneMinute)
      seconds = parseInt((((milliSecsLeft % $oneDay) % $oneHour) % $oneMinute) / $oneSecond)
      milli_seconds = milliSecsLeft

      {
        d: days
        H: hours
        m: minutes
        s: seconds
        M: milli_seconds
      }

    updateCountDown = ->
      if tl = timeLeft()
        $settings.onCount($element) if $settings.onCount?
        $element.html format_text($settings.format, tl)
      else
        stopCounting()
        $settings.onOutdated($element) if $settings.onOutdated?
        $element.html $settings.outdated_message

    init = ->
      $settings = $.extend({}, $defaults, options)
      $settings.countUntil = Date.parse($element.html())
      $settings.outdated_message = $element.data("outdated") if $element.data("outdated")?
      $settings.format = $element.data("format") if $element.data("format")?
      startCounting()

    log = (msg) ->
      console?.log msg

    init()
    return this

  $.fn.counting = (options) ->
    return this.each ->
      if undefined == ($ this).data('counting')
        plugin = new $.counting this, options
        ($ this).data 'counting', plugin
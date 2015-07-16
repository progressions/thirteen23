# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class UserProfile
  @init: ->
    if $('.upload_image').length
      $('.upload_image').hide()
      $('.profile_image').hover(UserProfile.showProfileInstructions, UserProfile.hideProfileInstructions)
      $('.profile_image').click(UserProfile.showUploadForm)
      $('form.edit_user').submit(UserProfile.submit)

  @submit: (event) ->
    event.preventDefault()

    form = $('form.edit_user')

    $.ajax(
      type: form.attr('method')
      url: form.attr('action')
      data: new FormData(form[0])
      dataType: 'json'
      processData: false
      contentType: false
    ).done( (data) ->
      $('.profile_image').attr('src', data.profile_image_url)
      $('.profile_image').show()
      $('.upload_image').hide()
    ).fail( (xhr, status) ->
      alert('boo: ' + status)
    )

    false

  @showProfileInstructions: ->
    $('.profile_instructions').show()

  @hideProfileInstructions: ->
    $('.profile_instructions').hide()

  @showUploadForm: ->
    $('.profile_instructions').hide()
    $('.profile_image').toggle()
    $('.upload_image').toggle()

$ ->
  UserProfile.init()

ready = ->
  console.log $("#goal_label_id")

  $("#goal_label_id").select2(
    placeholder: "Choose or create a label"
    allowClear: false
    formatNoMatches: (term) ->
      "<button class=\"add_new\" data-term=\"#{term}\">Add '#{term}' as New Label</button>"
  )

  $('.select2-drop').on 'click', '.add_new', -> addLabel()

addLabel = ->
  term = $('.add_new').data('term')
  $.ajax
    url: '/labels'
    type:   'POST'
    data:   { "label": { "name" : term } }
    success: (result) =>
      $("<option value=\"#{result.id}\">#{term}</option>").appendTo('#goal_label_id');
      $('#goal_label_id').select2('val', result.id)
      $("#goal_label_id").select2('close')
    error: (error, response)=>
      console.log 'problem'
      # TODO better form failure handling


$(document).on 'ready', ready
$(document).on 'page:load', ready

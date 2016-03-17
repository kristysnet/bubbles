ready = ->
  console.log $("#goal_label_id")

  $("#goal_label_id").select2(
    placeholder: "Select a label"
    allowClear: true
    formatNoMatches: (term) ->
      "<button class=\"addNew\" data-term=\"#{term}\">Add '#{term}' as New Label</button>"
  )

  $('.select2-drop').on 'click', '.addNew', -> addLabel()

addLabel = ->
  term = $('.addNew').data('term')
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

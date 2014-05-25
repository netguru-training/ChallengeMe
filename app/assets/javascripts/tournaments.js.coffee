$ ->
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '350px'

  match_id = undefined
  $("a[href=\"#add-match-result\"]").click ->
    match_id = $(this).data("id")
    return

  $("#add-match-result").on "show", ->
    $.ajax(
      url: "/matches/ajax_get_match/"
      data:
        match_id: match_id
    ).success (data) ->
      $("#add-match-result .modal-body").html data
      return

    return




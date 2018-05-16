$ ->
  $(".new-modal").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $(".modal-body").html xhr.responseText
  )

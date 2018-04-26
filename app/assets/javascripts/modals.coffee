$ ->
  $(".new-modal").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $(".modal-title")
    $(".modal-body").html xhr.responseText
  )

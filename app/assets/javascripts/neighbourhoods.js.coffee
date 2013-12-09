jQuery ->
  $('#user_neighbourhood_name').autocomplete
    source: $('#user_neighbourhood_name').data('autocomplete-source')
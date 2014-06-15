$(document).ready(function() {
  $('#game_round').select2();
  $('#game_home_team_id').select2();
  $('#game_away_team_id').select2();
  $('#game_date').datetimepicker({
    language: 'es-ES'
  });

  $('.maki-soccer').tooltip();
  $('.label-yellow').tooltip();
  $('.label-red').tooltip();
  $('.fa-minutes').tooltip();
  $('.label-rating').tooltip();
  $('.substitute').tooltip();
});

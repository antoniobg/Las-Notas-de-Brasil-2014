$(document).ready(function() {
  $('#player_position_id').select2();
  $('#performance_record_player_id').select2();
  $(function(){
    $("#player-games-table").tablesorter(
      {
        theme: 'bootstrap',
        headerTemplate: '{content} {icon}',
        widgets : [ 'zebra', 'columns', 'uitheme' ]
        });
  });
});

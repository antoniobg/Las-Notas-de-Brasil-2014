$(function(){
  $("#teams-table").tablesorter(
    {
      theme: 'bootstrap',
      headerTemplate: '{content} {icon}',
      sortList: [[1,0]],
      widgets : [ 'zebra', 'columns', 'uitheme' ]
      });
});
$(function(){
  $("#team-table").tablesorter(
    {
      theme: 'bootstrap',
      headerTemplate: '{content} {icon}',
      widgets : [ 'zebra', 'columns', 'uitheme' ]
      });
});
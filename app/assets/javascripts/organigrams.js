$(function() {
  if($("#chart_div").length) {
    console.log("Drawing organigram...");
    google.load("visualization", "1", {packages:["orgchart"]});
    google.setOnLoadCallback(drawChart);    
    drawChart();
    console.log("Drawing done");    
  }
}
);

// https://developers.google.com/chart/interactive/docs/gallery/orgchart?csw=1#example
function drawChart() {
  google.load("visualization", "1", {packages:["orgchart"]});
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Name');
  data.addColumn('string', 'Manager');
  data.addColumn('string', 'ToolTip');

  data.addRows([
    [{v:'Mike', f:'Julian Fischer<div style="color:red; font-style:italic">CEO</div>'}, '', 'The CEO'],
    [{v:'Jim', f:'Jim<div style="color:red; font-style:italic">Vice President</div>'}, 'Mike', 'VP'],
    ['Alice', 'Mike', ''],
    ['Bob', 'Jim', 'Bob Sponge'],
    ['Carol', 'Bob', ''],
    ['Hektor', 'Carol', ''],
  ]);

  var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
  chart.draw(data, {allowHtml:true});
}
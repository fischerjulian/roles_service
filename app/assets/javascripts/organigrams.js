Organigram = {}

$(function() {
  if($("#chart_div").length) {
    console.log("Loading organigram data...");
    Organigram.Data = $.get("/organigram.json", function(data) {
      Organigram.data = data;
      console.log("Done loading organigram data...");
      console.log("Drawing organigram...");
      google.load("visualization", "1", {packages:["orgchart"]});
      google.setOnLoadCallback(drawChart);    
      drawChart();
      console.log("Drawing done");    
    });          
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

  data.addRows(Organigram.data);

  var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
  chart.draw(data, {allowHtml:true});
}
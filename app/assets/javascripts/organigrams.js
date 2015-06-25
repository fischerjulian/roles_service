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
  Organigram.DataTable = data;

  var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
  Organigram.Chart = chart;
  google.visualization.events.addListener(chart, 'select', orgUnitSelectedCallback);

  chart.draw(data, {allowHtml:true});
}

function orgUnitSelectedCallback() {
  var chart = Organigram.Chart;
  var selected = chart.getSelection()[0];
  console.log("Selected: ", selected);

  if (selected) {
    var row = selected.row;
    var dataTable = Organigram.DataTable;
    console.log("Database ID: ", dataTable.getValue(row, 0));
  }
}

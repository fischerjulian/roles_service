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

  $('#btn-open').click(function() {
    editOrgUnit();
  });
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
  google.visualization.events.addListener(chart, 'collapse', orgUnitCollapseCallback);
  chart.draw(data, { allowHtml: true, allowCollapse: true });
}

function getSelectedOrgUnit() {
  var chart = Organigram.Chart;
  var selected = chart.getSelection()[0];
  var recordId;
  console.log("Selected: ", selected);

  if (selected) {
    var row = selected.row;
    var dataTable = Organigram.DataTable;
    recordId = dataTable.getValue(row, 0)
    console.log("Database ID: ", recordId);
  }
  return recordId;
}

function orgUnitSelectedCallback() {

}

function orgUnitCollapseCallback(collapsed, row) {
  console.log("Collapse: ", collapsed, ", Row: ", row)
}

function editOrgUnit() {
  var recordId = getSelectedOrgUnit();

  if (recordId) {
    window.location.href = '/admin/org_unit/' + recordId  + '/edit';
  }
}

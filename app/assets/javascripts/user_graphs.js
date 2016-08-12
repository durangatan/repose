$(document).ready(function(){
  var startTimes = []
  $.ajax({
    method: "GET",
    url: window.location.pathname
  }).done(function(serverData){
    console.log(serverData)
    var data = serverData;

  var margin = {top: 20, right: 15, bottom: 60, left: 60}
        , width = 960 - margin.left - margin.right
        , height = 500 - margin.top - margin.bottom;

  function getDate(d) {
      var strictIsoParse = d3.utcParse("%Y-%m-%dT%H:%M:%S.%LZ");
      return new strictIsoParse(d);
  }
debugger
  var minDate = getDate("1980-12-03T00:00:00.000Z"),
      maxDate = getDate("2017-12-03T00:00:00.000Z");
      console.log(minDate)
      console.log(minDate)


    var x = d3.time.scale()
              .domain([minDate, maxDate])
              .range([ 0, width ]);

    var y = d3.scale.linear()
            .domain([0, d3.max(data, function(d) { return d[1]; })])
            .range([ height, 0 ]);

    var chart = d3.select('body')
  .append('svg:svg')
  .attr('width', width + margin.right + margin.left)
  .attr('height', height + margin.top + margin.bottom)
  .attr('class', 'chart')

    var main = chart.append('g')
  .attr('transform', 'translate(' + margin.left + ',' + margin.top + ')')
  .attr('width', width)
  .attr('height', height)
  .attr('class', 'main')

    // draw the x axis
    var xAxis = d3.svg.axis()
  .scale(x)
  .orient('bottom');

    main.append('g')
  .attr('transform', 'translate(0,' + height + ')')
  .attr('class', 'main axis date')
  .call(xAxis);

    // draw the y axis
    var yAxis = d3.svg.axis()
  .scale(y)
  .orient('left');

    main.append('g')
  .attr('transform', 'translate(0,0)')
  .attr('class', 'main axis date')
  .call(yAxis);

    var g = main.append("svg:g");

    g.selectAll("scatter-dots")
      .data(data)
      .enter().append("svg:circle")
          .attr("cx", function (d,i) { return x(getDate(d[0]));} )
          .attr("cy", function (d) { return y(d[1]); } )
          .attr("r", 8);


  })

})

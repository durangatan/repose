$(document).ready(function(){

  var startTimes = [];
  $.ajax({
    method: "GET",
    url: window.location.pathname
  }).done(function(serverData){
    data = serverData;

  var margin = {top: 20, right: 15, bottom: 60, left: 60}
        , width = 960 - margin.left - margin.right
        , height = 500 - margin.top - margin.bottom;

  function getDate(d) {
      var strictIsoParse = d3.utcParse("%Y-%m-%dT%H:%M:%S.%LZ");
      return new strictIsoParse(d);
  }

  var minDate = getDate(d3.min(data, function(d){return d[0]})),
      maxDate = getDate(d3.max(data, function(d){return d[0]}));


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

    var circles = g.selectAll("scatter-dots")
      .data(data)
      .enter().append("svg:circle")
          .attr("cx", function (d,i) { return x(getDate(d[0]));} )
          .attr("cy", function (d) { return y(d[1]); } )
          // .attr("r", 8);
          .attr("r", function(d) {
              return d[4] / 6 + 6;
          });

    circles.on('mouseover',function(data){
      coords = d3.mouse(this)
      circ = d3.select(this)
      g.append('text')
          .attr('class','hovertext')
          .attr('x',coords[0])
          .attr('y',coords[1])
          .text(data[3] + " - " + data[2].substr(0, 40) + "...")
      }).on('mouseout',function(){

        g.selectAll('.hovertext')
          .data([])
          .exit()
          .remove()
      })
  })

})

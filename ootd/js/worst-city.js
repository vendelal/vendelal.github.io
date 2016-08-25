// RESTAURANT DATA

$(document).ready(function(){
  $('#switched').hide();
    $('.onoffswitch label').click(
      function(){
        $("#switched").toggle();
    });
});

var grade = false;
var restaurants = [];
var maxLat = 0;
var minLat = 0;
var maxLon = 0;
var minLon = 0;
var width = maxLat - minLat;
var height = maxLon - minLon;
var step = 7;
var restaurantObjects = []; // use this to draw
var gridWidth = 60;
var gridHeight = 120;
var passing = [];

d3.csv('https://dl.dropboxusercontent.com/s/lrn65nlo2ymsa4u/bostonFoodFinal.csv?dl=1', 
  function(data) {

    restaurants = data

    // find the grades of each restaurant
    var grades = [];
    restaurants.forEach(function(d){
      d.grade = d.RESULT;
      if (grades.indexOf(d.grade) == -1) {
        grades.push(d.grade);
      }
    });

    // parse the location for the latitude and longitude and return the max and min
    restaurants.forEach(function(d){

      d.lat = parseFloat(d.Location.split(",")[0].slice(1));

      d.lon = d.Location.split(", ")[1];
      d.lon = parseFloat(d.lon.slice(0, d.lon.length - 1));

    });

    maxLat = d3.max(restaurants, function(d){
      return d.lat;
    });

    minLat = d3.min(restaurants, function(d){
      return d.lat;
    })

    maxLon = d3.max(restaurants, function(d){
      return d.lon;
    });

    minLon = d3.min(restaurants, function(d){
      return d.lon;
    });

    // console.log(minLat, maxLat);
    // console.log(minLon, maxLon);

    var xRange = (maxLon - minLon) / gridWidth;
    var yRange = (maxLat - minLat) / gridHeight;

    // for each row add the data point if it falls within the range of the step
    for (var row = 0; row < gridHeight; row++) {
      var yMin = maxLat - yRange * (row + 1);
      for (var col = 0; col < gridWidth; col++) {
        var xMin = minLon + xRange * (col + 1);
        
        var dot = {};

        // for each dot object, return the data points inside restaurant that are within the xRange and yRange of the current row & col
        dot.data = restaurants.filter(function(d){
          if (yMin > d.lat && d.lat >= yMin - yRange &&
              xMin > d.lon && d.lon >= xMin - xRange ) {
            return d;
          }
          return false;
        });

        dot.passing = dot.data.filter(function(d){
          return d.grade == "HE_Pass";
        }).length;

        restaurantObjects.push(dot);
      }
    }
    // if(restaurantObjects.data && restaurantObjects.data.length)
    //   console.log(restaurantObjects);
    // console.log("yo");
    // console.log(restaurantObjects[5903]);
    // console.log(restaurantObjects[5903].data[1].grade);
    // Get the passing grades to make a color scale
    restaurantObjects.forEach(function(d){
      for (var i = 0; i < d.data.length; i++) {
        if (d.data[i].grade == "HE_Pass") {
          passing.push(d.data[i].grade);
        }
        var percentPassing = 0;
        if (d.data.length > 0) {
          percentPassing = passing.length / d.data[i].length;
        }
      }
      return percentPassing;
      // console.log(percentPassing);
    });

    draw(restaurantObjects);
    
  });

// center the map and the data according to screen size
function starting_x_pos(width){
  var windowWidth = window.innerWidth
  var w = width || gridWidth
  var diff = (windowWidth - (w*step))
  var center = diff/2
  // console.log('c-step', center/10)
  // console.log("center", center, center%7, center%5, center%8.5, center%10)
  return (Math.floor(center/10)*10)-5
}
starting_x_pos()

$('#bostonSvg').attr({'x':starting_x_pos($('#bostonSvg').width())-5})
  .attr('fill', '#D9D3D2');

// render the map of boston with data on it
function draw(){

    var circles = d3.select('#dataSvg').selectAll('circle')
      .data(restaurantObjects);

    var extent = d3.extent(restaurantObjects, function(d){
      return d.data.length;
    });

    var passFailRatio = function(dots){
      var pass = 0;
      var fail = 0;
      for(var i = 0, l = dots.length; i < l; i++){
        if(dots[i].grade == "HE_Pass")
          pass = pass + 1;
        else
          fail = fail + 1;
      }
      var ratio = pass > fail;
      return ratio;
    }

    var passFailRatioExtent = d3.extent(restaurantObjects, function(d){
      return passFailRatio(d.data)
    })

    var opacityScale = d3.scale.linear()
      .domain(extent)
      .range([0.25, 1]);

    circles.enter().append('circle')
      .attr('r', 0)
      .attr('cx', function(d, i){ // i is the index of the array
        return starting_x_pos() + (10 * ((i % gridWidth) + 1));
      })
      .attr('cy', function(d, i) {
        return 65 + (10 * (Math.ceil((i + 1)/gridHeight)));
      })
      .attr('fill', function(d) {
        if (d.data.length == 0) {
          return 'none';
        }
        else if (passFailRatio(d.data)) {
          return '#2cb34b';
        }
        else {
          return '#d35959'
        }

      })
      .attr('fill-opacity', function(d){
        return opacityScale(d.data.length);
      });

    // var radiusScale = d3.scale.linear()
    //   .domain(extent)
    //   .range([1, 3.5]);

    circles.transition()
      .attr('r', 3.5)
      .delay(function(d, i) {
        return i / restaurantObjects.length * 1000;
      })
      .duration(3000);

    circles.exit().transition().duration(500)
      .attr('r', 0).remove();

    console.log(restaurants);

  }

  // d3.select('#worstToEat').on('click', function(d) {
  //   draw(restaurantObjects);
  // })
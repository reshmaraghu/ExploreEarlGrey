
var myCanvas = document.getElementById('myCanvas');
myCanvas.width = 500;
myCanvas.height = 500;
myCanvas.addEventListener("click", function(e){
  var mousePos = getMousePos(myCanvas, e);
  var label = getdataLable(mousePos);
  set_dataLabel(label);
}, false);

// Get the position of the mouse relative to the canvas
function getMousePos(canvasDom, mouseEvent) {
  var rect = canvasDom.getBoundingClientRect();
  return {
    x: mouseEvent.clientX - rect.left,
    y: mouseEvent.clientY - rect.top
  };
}

function getdataLable(mousePos) {
  if (mousePos.x > 354 && mousePos.x < 697 && mousePos.y > 223 && mousePos.y < 447) {
    return 'Shades: 32%'
  } else if (mousePos.x > 205 && mousePos.x < 443 && mousePos.y > 273 && mousePos.y < 693) {
    return 'Jackets: 37%'
  } else if (mousePos.x > 286 && mousePos.x < 397 && mousePos.y > 227 && mousePos.y < 338) {
    return 'T-shirts: 5%'
  } else if (mousePos.x > 438 && mousePos.x < 691 && mousePos.y > 460 && mousePos.y < 691) {
    return 'Trousers: 26%'
  } else {
    return ''
  }
}
var ctx = myCanvas.getContext("2d");

var myVinyls = {
    "Trousers": 10,
    "Jackets": 14,
    "T-shirts": 2,
    "Shades": 12
};

function drawLine(ctx, startX, startY, endX, endY){
    ctx.beginPath();
    ctx.moveTo(startX,startY);
    ctx.lineTo(endX,endY);
    ctx.stroke();
}

function drawArc(ctx, centerX, centerY, radius, startAngle, endAngle){
    ctx.beginPath();
    ctx.arc(centerX, centerY, radius, startAngle, endAngle);
    ctx.stroke();
}

function drawPieSlice(ctx,centerX, centerY, radius, startAngle, endAngle, color ){
    ctx.fillStyle = color;
    ctx.beginPath();
    ctx.moveTo(centerX,centerY);
    ctx.arc(centerX, centerY, radius, startAngle, endAngle);
    ctx.closePath();
    ctx.fill();
}

var Piechart = function(options){
    this.options = options;
    this.canvas = options.canvas;
    this.ctx = this.canvas.getContext("2d");
    this.colors = options.colors;

    this.draw = function(){
        var total_value = 0;
        var color_index = 0;
        for (var categ in this.options.data){
            var val = this.options.data[categ];
            total_value += val;
        }

        var start_angle = 0;
        for (categ in this.options.data){
            val = this.options.data[categ];
            var slice_angle = 2 * Math.PI * val / total_value;

            drawPieSlice(
                this.ctx,
                this.canvas.width/2,
                this.canvas.height/2,
                Math.min(this.canvas.width/2,this.canvas.height/2),
                start_angle,
                start_angle+slice_angle,
                this.colors[color_index%this.colors.length]
            );

            start_angle += slice_angle;
            color_index++;
        }
        start_angle = 0;
        for (categ in this.options.data){
            val = this.options.data[categ];
            slice_angle = 2 * Math.PI * val / total_value;
            var pieRadius = Math.min(this.canvas.width/2,this.canvas.height/2);
            var labelX = this.canvas.width/2 + (pieRadius / 2) * Math.cos(start_angle + slice_angle/2);
            var labelY = this.canvas.height/2 + (pieRadius / 2) * Math.sin(start_angle + slice_angle/2);

            if (this.options.doughnutHoleSize){
              var offset = (pieRadius * this.options.doughnutHoleSize ) / 2;
              labelX = this.canvas.width/2 + (offset + pieRadius / 2) * Math.cos(start_angle + slice_angle/2);
              labelY = this.canvas.height/2 + (offset + pieRadius / 2) * Math.sin(start_angle + slice_angle/2);
            }

            var labelText = Math.round(100 * val / total_value);
            this.ctx.fillStyle = "white";
            this.ctx.font = "bold 30px Helvetica";
            this.ctx.fillText(labelText+"%", labelX,labelY);
            start_angle += slice_angle;
        }
        if (this.options.legend){
            color_index = 0;
            var legendHTML = "";
            for (categ in this.options.data){
                legendHTML += "<div><span style='display:inline-block;width:20px;background-color:"+this.colors[color_index++]+";'>&nbsp;</span> "+categ+"</div>";
            }
            this.options.legend.innerHTML = legendHTML;
        }
    }
}

var myLegend = document.getElementById("myLegend");

var myPiechart = new Piechart(
    {
        canvas:myCanvas,
        data:myVinyls,
        colors:["#e8743b","#19a979","#ee6868","#13a4b4"],
        legend:myLegend
    }
);
myPiechart.draw();

document.getElementById("myLegend").addEventListener("click", call_native);

function call_native () {
  set_vizName("asked for vizname");
  window.webkit.messageHandlers.PageVC.postMessage("Need vizName");
}

function set_vizName (text) {
  var vizName = document.getElementById("vizName");
  vizName.innerHTML = text;
}

function set_dataLabel (text) {
  var dataLabel = document.getElementById("dataLabel");
  dataLabel.innerHTML = text;
}

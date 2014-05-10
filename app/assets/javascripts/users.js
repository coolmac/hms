// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function ()
{
    $('#user_date_of_birth').datepicker({
      dateFormat: "yy-mm-dd",
      changeMonth: true,
      changeYear: true,
      yearRange: '1900:2014',
      defaultDate: '1970-01-01'
    });
});

function draw_charts() {
            tag = document.getElementById("chart_tag").value; 
            type = document.getElementById("chart_type").value; 
			url = "/draw_chart?tag="+tag
			$("#chart").html("");
			chartData = new Array();
			axisDates = new Array();
			$.get(url, function(data, status, xhr) {
				for(i=0; i<data.length;i++){
					chartData[i] = data[i].yvalue
					axisDates[i] = "'"+data[i].xvalue+"'"
				}
				$.jqplot.config.enablePlugins = true;
				if (type == 'Bar'){
					 var plot2 = $.jqplot('chart', [chartData], {
	                title: data[0].name,
	                	seriesDefaults:{
	                     		renderer: $.jqplot.BarRenderer,
	                     		rendererOptions: {
	                        	barPadding: 1,
	                        	barMargin: 15,
	                        	barDirection: 'vertical',
	                        	barWidth: 50
	                    		}, 
	                    		pointLabels: { show: true }
	                },
	                axes: {
	                    xaxis: {                            
	                            renderer:  $.jqplot.CategoryAxisRenderer,
	                            ticks: axisDates
	                    },
	                    yaxis: {
	                        tickOptions: {
	                            formatString: ''
	                        }
	                    }
	                },
	                highlighter: {
	                    sizeAdjust: 7.5
	                },
	                cursor: {
	                    show: true
	                }
	            });
				}
				else{
					 var plot2 = $.jqplot('chart', [chartData], {
	                title: data[0].name,
	                axes: {
	                    xaxis: {                            
	                            renderer:  $.jqplot.CategoryAxisRenderer,
	                            ticks: axisDates
	                    },
	                    yaxis: {
	                        tickOptions: {
	                            formatString: ''
	                        }
	                    }
	                },
	                highlighter: {
	                    sizeAdjust: 7.5
	                },
	                cursor: {
	                    show: true
	                }
	            });
				}
	            
		    });
}
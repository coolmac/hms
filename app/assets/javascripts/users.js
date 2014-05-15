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

function charts() {
    tag = document.getElementById("chart_tag").value; 
    type = document.getElementById("chart_type").value; 
	url = "/draw_chart?tag="+tag
	$("#chart").html("");
	chartData_p24h = new Array();
	chartData_v24h = new Array();
	axisDates = new Array();
	$.get(url, function(data, status, xhr) {
		draw_charts(tag,type,data,chartData_p24h,chartData_v24h)
		$(".jqplot-yaxis-tick").css("margin-right","5px")
		$(".jqplot-xaxis-tick").css("margin-top","5px")
		if (tag == "p24h" || tag == "v24h" ){
			$(".jqplot-table-legend").hide();
		}
    });
	
}

function draw_charts(tag,type,data,chartData_p24h,chartData_v24h) {
	if(tag == "Both"){
		chart_title = "Patients Every Day / Unique Patients "
		for(i=0; i<data.length;i++){
			if (data[i].tag == 'p24h'){
				chartData_p24h[i] = data[i].yvalue
				axisDates[i] = "'"+data[i].xvalue+"'"
				chartData_v24h[i] = '0'
			}
			else if(data[i].xvalue == data[i-1].xvalue){
				chartData_v24h[i-1] = data[i].yvalue
				chartData_p24h[i] = ""
				chartData_v24h[i] = ""
			}
			else{

			}
		}
	}
	else {
		chart_title = data[0].name
		for(i=0; i<data.length;i++){
			chartData_p24h[i] = data[i].yvalue
			axisDates[i] = "'"+data[i].xvalue+"'"
		}
	}
	if(type=="Bar")
		draw_bar_chart(chartData_p24h,chartData_v24h,axisDates)
	else
		draw_line_chart(chartData_p24h,chartData_v24h,axisDates)
}

function draw_bar_chart(){
	$.jqplot.config.enablePlugins = true;
	var plot2 = $.jqplot('chart', [chartData_p24h.filter(Boolean),chartData_v24h.filter(Boolean)], {
        title: chart_title,
        seriesDefaults:{
             		renderer: $.jqplot.BarRenderer,
             		rendererOptions: {
                	barPadding: 1,
                	barMargin: 15,
                	barDirection: 'vertical',
                	barWidth: 50,
        			// varyBarColor: true
            		}, 
            		pointLabels: { show: true }
        },
        axes: {
            xaxis: {                            
                    renderer:  $.jqplot.CategoryAxisRenderer,
                    ticks: axisDates.filter(Boolean)
            },
            yaxis: {
            	min: 0,  
				// tickInterval: 10,
                tickOptions: {
                    formatString: '%d'
                }
            }
        },
        highlighter: {
            sizeAdjust: 7.5
        },
        cursor: {
            show: true
        },
        series:[
            {label:'&nbsp;p24h&nbsp;'},
            {label:'&nbsp;v24h&nbsp;'},
        ],
        legend: {
	      show: true,
	      placement: 'inside'
	    }

    });
}

function draw_line_chart(){
	$.jqplot.config.enablePlugins = true;
	var plot2 = $.jqplot('chart', [chartData_p24h.filter(Boolean),chartData_v24h.filter(Boolean)], {
        title: chart_title,
        axes: {
            xaxis: {                            
                    renderer:  $.jqplot.CategoryAxisRenderer,
                    ticks: axisDates.filter(Boolean)
            },
            yaxis: {
            	min: 0,  
				// tickInterval: 10,
                tickOptions: {
                    formatString: '%d'
                }
            }
        },
        highlighter: {
            sizeAdjust: 7.5
        },
        cursor: {
            show: true
        },
        series:[
            {label:'&nbsp;p24h&nbsp;'},
            {label:'&nbsp;v24h&nbsp;'},
        ],
        legend: {
	      show: true,
	      placement: 'inside'
	    }
	});
}
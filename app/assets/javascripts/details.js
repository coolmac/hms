// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function get_summary(){
	var data = $('form').serialize();
	url = window.location+"?&"+data
	$('#summary_content').load(url +' #summary_content', function() {

	});
}
function get_summary_pdf(){
	var data = $('form').serialize();

		alert("hai")
	url = window.location+"?&pdf=true&"+data
	$.get(url, function(data, status, xhr) {
		alert("hai")
	});
}


function show_sub_category(super_category) {
 	url = '/sub_category?&super_category='+super_category
 	if($("#"+super_category+"_cb").is(':checked')) {
		$.get(url, function(data, status, xhr) {
			$("#sub_category_div").append("<div class='"+super_category+"_sb_div' style='margin-left:10px;'></br><p><b>"+super_category.toUpperCase()+"</b></p></div>")
			for(i=0;i<data.length;i++){
				$("."+super_category+"_sb_div").append("&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='"+super_category+i+"' name='"+super_category+"_sub[]' value='"+data[i]+"' checked/>"+"<label for='"+super_category+i+"'>"+data[i]+"</label>")
			}

		});
	}
	else {
		$("."+super_category+"_sb_div").remove()
	}

 }

 function get_admit_days(){
 	url = '/sub_category?&dates=true'
 	if($("#admission_cb").is(':checked')) {
	 	$.get(url, function(data, status, xhr) {
	 		$("#sub_category_div").append("<div class='admit_sb_div' style='margin-left:10px;'></br><p><b>ADMIT DAYS</b></p></div>")
	 		for(i=0;i<data.length;i++){
	 			$(".admit_sb_div").append("&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' name='admit_days[]' value='"+data[i].id+"' checked/> Day "+(i+1))
	 		}
	 	});
	}
	else {
		$(".admit_sb_div").remove()
	}
 }

function SetSel(elem){
  elem_class =  elem.className;
  elems = document.getElementsByClassName(elem_class);
  currentState = elem.checked;
  elemsLength = elems.length;

  for(i=0; i<elemsLength; i++)
  {
       elems[i].checked = false;   
  }

  elem.checked = currentState;
}
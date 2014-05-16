// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function get_summary(){
	var data = $('form').serialize();
	url = window.location+"?&"+data
	alert(url)
	$('#summary_content').load(url +' #summary_content', function() {

	});
}


function show_sub_category(super_category) {
 	url = '/sub_category?&super_category='+super_category
 	if($("#"+super_category+"_cb").is(':checked')) {
		$.get(url, function(data, status, xhr) {
			$("#sub_category_div").append("<div class='"+super_category+"_sb_div'></br><p>"+super_category+"</p></div>")
			for(i=0;i<data.length;i++){
				$("."+super_category+"_sb_div").append("&nbsp;&nbsp;<input type='checkbox' name='"+super_category+"_sub[]' value='"+data[i]+"'/>"+data[i])
			}

		});
	}
	else {
		$("."+super_category+"_sb_div").remove()
	}

 }

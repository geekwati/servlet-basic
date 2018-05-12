$(document).on('click', '#send-email', function () {

	$.post("emailsend", {
		body: $("#body").val(),
		subject:$('#subject').val(),
		toUserId:$("#toUserName").find(":selected").attr("id")
	}, "json")
	.done(function(responseText) { 
				//console.log("status code hel="+jqxhr.status)  ;
				console.log("status code hel="+ responseText)  ;
				console.log("status code hel="+ typeof responseText)  ;
				if(JSON.parse(responseText).success=="true"){
					console.log("Success");
					
					window.location.href = 'dashboard';
					//$("#msg-list").load();
				} else { 
					console.log("Error");
					var message =`<div id='errormsg' class='col-sm-offset-3 alert alert-danger alert-dismissible'>
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					${JSON.parse(responseText).msgStatus}</div>`;
					$("#test").html(message); 
				} 
			}).fail(function(){
				myerrorfunction();
			});
		});


$(document).on('click', '.getmsg', function () {
	var type=$(this).attr('msgtype');
	if(type=="OUTBOX"){
		$("#outbox").addClass("active");
		$("#inbox").removeClass("active");
	}
	else{
		$("#inbox").addClass("active");
		$("#outbox").removeClass("active");
	}
	$("#pagination").show();	
	$.get("getmessage?box="+type,function(responseText) {   
		$("#msg-list").html(responseText); 
	}).fail(function(){
			myerrorfunction();
	   });
});


$(document).on('click', '#compose', function () {
		//var type=$(this).attr('msgtype');
		$("#compose").addClass("active");
		$("#outbox").removeClass("active");
		$("#inbox").removeClass("active");
		$("#pagination").hide();
		$.post("compose", {},function(responseText) {   
			$("#msg-list").html(responseText); 
		}).fail(function(){
			myerrorfunction();
	    });
	});


$(document).on('click', '#msgtable tr', function () {
		//var type=$(this).attr('msgtype');
		$.post("showmsg",{
			mid:$(this).attr('mid'),
			msgtype:$(this).attr('msgtype')
		},
		function(responseText) {   
			$("#msg-list").html(responseText); 
		}).fail(function(){
			myerrorfunction();	 
	    });
	});
function myerrorfunction(){
	/*MailService s=new MailService();
	session.invalidate();
	s.closeUser();*/
	window.location.href = '/EmailApp/';// or whatever
}

	
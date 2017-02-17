$(document).ready(function(){

	$.ajax({
		url: "/fill_remove_update_names_dropdown",
		type: "GET",
		dataType: "json",
		data:{allnames: ""},
		contentType: "application/json",
		cache: true,
		timeout: 5000,
		complete: function() {
		  //called when complete
		  console.log('process complete');
		},
		success: function(data) {
			if(!data.hasOwnProperty("added")) //added key contains "DB read error" as returned from app.js
			{
				var name_drop_down;
				for(var i = 0; i<data.length; i++)
				{
					
          			var name_option = '<option>' + data[i].name + '</option>';
					name_drop_down += name_option;
				}
				//Populate update
				document.getElementById("names_to_be_removed").innerHTML = name_drop_down;
				document.getElementById("name_list").innerHTML = name_drop_down;
				console.log(name_drop_down);
			}
			else
				document.getElementById("db_read_error").style.display="block";
		},
		error: function() {
		    console.log('process error');
		},
	});

	$("#view_name").click(function(e){
		e.preventDefault();
		console.log("Before $.ajax");
		$.ajax({
			url: "/view_names",
			type: "GET",
			dataType: "json",
			data:{allnames: ""},
			contentType: "application/json",
			cache: true,
			timeout: 5000,
			complete: function() {
			  //called when complete
			  console.log('process complete');
			},
			success: function(data) {
				//back end(app.js) sends back either added: DB read error or a list of names. Check for that before taking necessary action
				if(!data.hasOwnProperty("added"))
				{
					console.log("Received info from back end");
					document.getElementById("db_read_error").style.display="none";
					document.getElementById("updated_name").style.display="none";
					document.getElementById("could_not_update").style.display="none";
					document.getElementById("empty_database").style.display="none";

          			//Bootstrap for table-stripped


          			var names_table = "";
          			for(var i = 0; i < data.length; i++){
            			names_table += "<li><article><header>";
						names_table += '<h3>'+data[i].name+'</h3>';
						names_table += '<div class=\"published\" >';
						names_table += 	'Role: '+data[i].role+'<br/>';
						names_table += 	'Room: '+data[i].room + '</div></header>';
						names_table += 	'<a  class=\"image\"><img src=\"images/pic08.jpg\" /></a>';
						names_table += '</article></li>';
						
                    }
          			
          			document.getElementById("show_all_names").innerHTML = names_table;

				}
				else
					document.getElementById("db_read_error").style.display="block";
			},

			error: function() {
			  console.log('process error');
			},
		});
	});


$("#view_room").click(function(e){
		e.preventDefault();
		console.log("Before $.ajax");
		$.ajax({
			url: "/view_rooms",
			type: "GET",
			dataType: "json",
			data:{allnames: ""},
			contentType: "application/json",
			cache: true,
			timeout: 5000,
			complete: function() {
			  //called when complete
			  console.log('process complete');
			},
			success: function(data) {
				//back end(app.js) sends back either added: DB read error or a list of names. Check for that before taking necessary action
				if(!data.hasOwnProperty("added"))
				{
					console.log("Received info from back end");
					document.getElementById("db_read_error").style.display="none";
					document.getElementById("updated_name").style.display="none";
					document.getElementById("could_not_update").style.display="none";
					document.getElementById("empty_database").style.display="none";

          			//Bootstrap for table-stripped


          			var names_table = "";
   			
          			for(var i = 0; i < data.length; i++) {
          			    
              			    names_table +='<article class=\"mini-post\">';
        					names_table += "	<header>";
        					names_table += '		<h3> Room '+ data[i].roomId + " : " + data[i].roomName + '</h3>';
        					names_table += '		<div class=\"author\" onclick=\" document.getElementById(\''+ data[i].roomId + data[i].roomName +'\').style.display=\'block\'\" ><img src=\"'+ data[i].roomImage + '\" /></div>';
        					names_table += '        <div id=\"'+ data[i].roomId + data[i].roomName +'\" class=\"published\" style=\"display:none\"> ';
                            names_table += '            <div id=\"'+i+'_deviceWarning\">Device warning:'+data[i].deviceWarning+'</div><br/>';
                            names_table += '            <div id=\"'+i+'_humanWarning\">Human warning:'+data[i].humanWarning+'</div><br/>';
                            names_table += '            <div id=\"'+i+'_timeWarning\">Time warning:'+data[i].timeWarning+'</div><br/>';
                            names_table += '            <div id=\"'+i+'_breachWarning\">Breach warning:'+data[i].breachWarning+'</div><br/>';
                            names_table += '            <div id=\"'+i+'_currentPeople\">Current ocupancy:'+data[i].currentPeople+'</div><br/>';
                            names_table += '            <div id=\"'+i+'_totalTasks\">Total task:'+data[i].totalTasks+'</div><br/>';
                            names_table += '            <div id=\"'+i+'_executingTasks\">Executing tasks:'+data[i].executingTasks+'</div><br/>';
                            names_table += '            <div id=\"'+i+'_missedTasks\">Missed tasks:'+data[i].missedTasks+'</div><br/>';
                            names_table += '            <div onclick=\" document.getElementById(\''+ data[i].roomId + data[i].roomName +'\').style.display=\'none\'\" ><b>CLOSE</b></div>';
                            names_table += '		</div>';
                            names_table += "	</header>";
                            names_table +='</article>';
                            
                            
        			}
          			document.getElementById("show_all_rooms").innerHTML = names_table;
				}
				else
					document.getElementById("db_read_error").style.display="block";
			},

			error: function() {
			  console.log('process error');
			},
		});
	});



	$("#update_name_button").click(function(e){
		e.preventDefault();
		console.log("Before ajax in update_name_button form");
		console.log("Updating after choosing from drop down");
	    //In the 'data' parameter, pass selected current name and updated name to 'url', to be received by back end for further processing
		$.ajax({
				url: "/update_name",
				type: "GET",
				dataType: "json",
				data: {name_list:$("#name_list option:selected").text(), updated_new_name: $("#updated_new_name").val()},
				contentType: "application/json",
				cache: true,
				timeout: 5000,
				complete: function() {
				  //called when complete
				  console.log('process complete');
				},
				success: function(data) {
					console.log("Returned from Update.....");

					//Based on what's received from back end(app.js) end, show appropriate message.
					if(data.updated === "updated")
					{
						console.log("Front end JS updated.....");
						document.getElementById("updated_name").style.display="block";
						document.getElementById("could_not_update").style.display="none";
						document.getElementById("db_read_error").style.display="none";
						document.getElementById("empty_database").style.display="none";
					}
					else if(data.updated === "could not update")
					{
						console.log("Front end JS updated.....");
						document.getElementById("updated_name").style.display="none";
						document.getElementById("could_not_update").style.display="block";
						document.getElementById("db_read_error").style.display="none";
						document.getElementById("empty_database").style.display="none";
					}
					else if(data.updated === "DB read error")
					{
						console.log("Front end JS DB read error.....");
						document.getElementById("updated_name").style.display="none";
						document.getElementById("could_not_update").style.display="none";
						document.getElementById("db_read_error").style.display="block";
						document.getElementById("empty_database").style.display="none";
					}
					else if(data.updated === "No")
					{
						document.getElementById("updated_name").style.display="none";
						document.getElementById("could_not_update").style.display="none";
						document.getElementById("db_read_error").style.display="none";
						document.getElementById("empty_database").style.display="none";
					}
					else if(data.updated === "empty database")
					{
						document.getElementById("updated_name").style.display="none";
						document.getElementById("could_not_update").style.display="none";
						document.getElementById("db_read_error").style.display="none";
						document.getElementById("empty_database").style.display="block";
					}
					$("#updated_new_name").val("");
					$("#updated_new_name").attr("placeholder", "Enter Name");

				},
				error: function() {
				  console.log('process error');
				}
		});
	});
});
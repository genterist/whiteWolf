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
		  console.log("process complete");
		},
		success: function(data) {
			if(!data.hasOwnProperty("added")) //added key contains "DB read error" as returned from app.js
			{
				var name_drop_down;
				for(var i = 0; i<data.length; i++)
				{
					
          			var name_option = "<option>" + data[i].name + "</option>";
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
		    console.log("process error");
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
			  console.log("process complete");
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
						names_table += "<h3>"+data[i].name+"</h3>";
						names_table += "<div class=\"published\" >";
						names_table += 	"Role: "+data[i].role+"<br/>";
						names_table += 	"Room: "+data[i].room;
						names_table += 	"</div></header>";
					    names_table += "		<div class=\"image\" onclick=\" document.getElementById('"+ data[i].name +"').style.display='block'\" ><img src=\""+ data[i].image+"\" /></div>";
    					names_table += "</article>";
    					names_table += "";
    					names_table += "        <section id=\""+ data[i].name +"\" class=\"published\" style=\"display:none\"> ";
                        names_table += "            <div id=\""+i+"_task1\">Task 1:"+data[i].task1+"</div><br/>";
                        names_table += "            <div id=\""+i+"_task2\">Human warning:"+data[i].task2+"</div><br/>";
                        names_table += "            <div id=\""+i+"_task3\">Time warning:"+data[i].task3+"</div><br/>";
                        names_table += "            <div id=\""+i+"_task4\">Breach warning:"+data[i].task4+"</div><br/>";
                        names_table += "            <div id=\""+i+"_task5\">Current ocupancy:"+data[i].task5+"</div><br/>";
                        names_table += "            <div id=\""+i+"_task6\">Total task:"+data[i].task6+"</div><br/>";
                        names_table += "            <div id=\""+i+"_task7\">Executing tasks:"+data[i].task7+"</div><br/>";
                        names_table += "            <div id=\""+i+"_task8\">Missed tasks:"+data[i].task8+"</div><br/>";
                        names_table += "            <div onclick=\" document.getElementById('"+ data[i].name +"').style.display='none'\" ><b>CLOSE</b></div>";
                        names_table += "		</section>";
						names_table += "</li>";
						
						
                    }
          			
          			document.getElementById("show_all_names").innerHTML = names_table;

				}
				else
					document.getElementById("db_read_error").style.display="block";
			},

			error: function() {
			  console.log("process error");
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
			  console.log("process complete");
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
          			    
              			    names_table +="<article class=\"mini-post\">";
        					names_table += "	<header>";
        					names_table += "		<h3> "+ data[i].roomName + "</h3>";
        					names_table += "		<div class=\"author\" onclick=\" document.getElementById('"+ data[i].roomId + data[i].roomName +"').style.display='block'\" ><img src=\""+ data[i].roomImage + "\" /></div>";
        					names_table += "        <div id=\""+ data[i].roomId + data[i].roomName +"\" class=\"published\" style=\"display:none\"> ";
                            names_table += "            <div id=\""+i+"_threatLevel\">Threat level:"+data[i].threatLevel+"</div><br/>";
                            names_table += "            <div id=\""+i+"_illnessTypes\">Illness:"+data[i].illnessTypes+"</div><br/>";
                            names_table += "            <div id=\""+i+"_patientAge\">Age:"+data[i].patientAge+"</div><br/>";
                            names_table += "            <div id=\""+i+"_lengthOfStay\">Length of stay:"+data[i].lengthOfStay+"</div><br/>";
                            names_table += "            <div id=\""+i+"_nurseVisits\">Nurse visit:"+data[i].nurseVisits+"</div><br/>";
                            names_table += "            <div id=\""+i+"_visitors\">Visitors:"+data[i].visitors+"</div><br/>";
                            names_table += "            <div id=\""+i+"_wasteDispose\">Linnens change:"+data[i].wasteDispose+"</div><br/>";
                            names_table += "            <div id=\""+i+"_lastCleaning\">Last cleaning:"+data[i].lastCleaning+"</div><br/>";
                            names_table += "            <div id=\""+i+"_deviceWarning\">Device warning:"+data[i].deviceWarning+"</div><br/>";
                            names_table += "            <div id=\""+i+"_missingTasks\">Missing tasks:"+data[i].missingTasks+"</div><br/>";         
                            names_table += "            <div onclick=\" document.getElementById('"+ data[i].roomId + data[i].roomName +"').style.display='none'\" ><b>CLOSE</b></div>";
                            names_table += "		</div>";
                            names_table += "	</header>";
                            names_table +="</article>";
                            
                            
        			}
          			document.getElementById("show_all_rooms").innerHTML = names_table;
				}
				else
					document.getElementById("db_read_error").style.display="block";
			},

			error: function() {
			  console.log("process error");
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
				  console.log("process complete");
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
				  console.log("process error");
				}
		});
	});
});
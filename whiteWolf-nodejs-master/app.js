var express = require("express");
var cfenv = require("cfenv");
var app = express();
var request = require("request");
var Cloudant = require("cloudant");

app.use(express.static(__dirname + "/public"));

//To Store URL of Cloudant VCAP Services as found under environment variables on from App Overview page
var cloudant_url;
var services = JSON.parse(process.env.VCAP_SERVICES || "{}");
// Check if services are bound to your project
if(process.env.VCAP_SERVICES)
{
	services = JSON.parse(process.env.VCAP_SERVICES);
	if(services.cloudantNoSQLDB) //Check if cloudantNoSQLDB service is bound to your project
	{
		cloudant_url = services.cloudantNoSQLDB[0].credentials.url;  //Get URL and other paramters
		console.log("Name = " + services.cloudantNoSQLDB[0].name);
		console.log("URL = " + services.cloudantNoSQLDB[0].credentials.url);
        console.log("username = " + services.cloudantNoSQLDB[0].credentials.username);
		console.log("password = " + services.cloudantNoSQLDB[0].credentials.password);
	}
}

//Connect using cloudant npm and URL obtained from previous step
var cloudant = Cloudant({url: cloudant_url});
//Edit this variable value to change name of database.
var dbname = "names_database";
var dbroom = "threatmap";
var db;
var db_room;


//    ***************************************************** SEARCH DATABASE ************************************************************
////// To search for a document directly, without using request module....
////// It's crucial to know the ID of the document to be searched for.
////// TIP: While inserting a new document, a JSON object can be created with '_id' variable set to the same value as 'new_name' as in this case
////// This JSON document can be inserted whose _id can then be referenced for future search.
////// Eg: _id = "mydoc".
//
//	   db.get("mydoc", function(err, data){
//			if(!err)
//				console.log("Found document : " + JSON.stringify(data));
//  		else
//      		console.log("Document not found in database");
//	   });

//   ****************************************************** END OF SEARCH **************************************************************


//To update the 'Read Names' list
app.get("/view_names",function(req, res){
	var url = cloudant_url + "/names_database/_design/names_database/_view/names_database";
	// db url to load tasks
	var taskurl = cloudant_url + "/tasks/_design/tasks/_view/tasks";
	
	var name_array = [];
	var role_array  = [];
	var inRoom_array = [];
	var intask_array  = [];
	var name_id_array  = [];
	var image_array = [];
	var task1_array = [];
	var task2_array = [];
	var task3_array = [];
	var task4_array = [];
	var task5_array = [];
	var task6_array = [];
	var task7_array = [];
	var task8_array = [];
	var list_of_names = "[";
			
	request({
			 url: url, //'request' makes a call to API URL which in turn returns a JSON to the variable 'body'
			 json: true
			}, function (error, response, body) {
		if (!error && response.statusCode === 200)
		{
			var user_data = body.rows;  //body.rows contains an array of IDs, Revision numbers and Names from the view


			for(var i=0; i< user_data.length; i++)
			{
				name_id_array.push(user_data[i].value[1]);
				name_array.push(user_data[i].value[2]);
				role_array.push(user_data[i].value[3]);
				inRoom_array.push(user_data[i].value[4]);
				intask_array.push(user_data[i].value[5]);
				image_array.push(user_data[i].value[6]);
				
			}		
		}
		else
		{
			console.log("No data from URL");
			console.log("Response is : " + response.statusCode);
			var name_string="{\"added\":\"DB read error\"}"; //Send error message in case 'request' can't read database
			res.contentType("application/json");
			res.send(JSON.parse(name_string));
		}
	});
	
	request({
			 url: taskurl, //'request' makes a call to API URL which in turn returns a JSON to the variable 'body'
			 json: true
		}, function (error, response, taskbody) {
			if (!error && response.statusCode === 200)
			{
			    var task_data = taskbody.rows;
			    for(var i=0; i< task_data.length; i++)
		         {
		             task1_array.push(task_data[i].value[2]);
		             console.log(task1_array[i]);
		             /*
    				task2_array.push(user_data[i].value[8]);
    				task3_array.push(user_data[i].value[9]);
    				task4_array.push(user_data[i].value[10]);
    				task5_array.push(user_data[i].value[11]);
    				task6_array.push(user_data[i].value[12]);
    				task7_array.push(user_data[i].value[13]);
    				task8_array.push(user_data[i].value[14]);*/
	             }
	             
	             for(var i=0; i<name_array.length; i++)
    			{
    				var name_JSON = "{\"id\":\"" + name_id_array[i] + "\" ,";
    				name_JSON += "\"name\":\"" + name_array[i] + "\" ,";
    				name_JSON += "\"role\":\"" + role_array[i] + "\" ,";
    				name_JSON += "\"room\":\"" + inRoom_array[i] + "\" ,";
    				name_JSON += "\"task_id\":\"" + intask_array[i] + "\",";
    				name_JSON += "\"image\":\"" + image_array[i] + "\",";
    				
    				name_JSON += "\"task1\":\"" + task1_array[i] + "\",";
    				name_JSON += "\"task2\":\"" + task2_array[i] + "\",";
    				name_JSON += "\"task3\":\"" + task3_array[i] + "\",";
    				name_JSON += "\"task4\":\"" + task4_array[i] + "\",";
    				name_JSON += "\"task5\":\"" + task5_array[i] + "\",";
    				name_JSON += "\"task6\":\"" + task6_array[i] + "\",";
    				name_JSON += "\"task7\":\"" + task7_array[i] + "\",";
    				name_JSON += "\"task8\":\"" + task8_array[i] + "\"";
    				name_JSON += "}";
    				if(i !== 0)
    					list_of_names = list_of_names.concat(",");
    				list_of_names = list_of_names.concat(name_JSON);
    			}
    			list_of_names = list_of_names.concat("]");
    			res.contentType("application/json");
    			console.log("Returning names");
    			res.send(JSON.parse(list_of_names)); //return the list to front end for display

			}
			else
			{
			    console.log("No data from URL");
    			console.log("Response is : " + response.statusCode);
    			var name_string="{\"added\":\"DB read error\"}"; //Send error message in case 'request' can't read database
    			res.contentType("application/json");
    			res.send(JSON.parse(name_string));
			}
		});
	
});

app.get("/view_rooms",function(req, res){
	var json_string_for_csv_conversion = new Array();
	var url = cloudant_url + "/threatmap/_design/newRoom/_view/threatmap";
	request({
			 url: url, //'request' makes a call to API URL which in turn returns a JSON to the variable 'body'
			 json: true
			}, function (error, response, body) {
		if (!error && response.statusCode === 200)
		{
			var user_data = body.rows;  //body.rows contains an array of IDs, Revision numbers and Names from the view
			var list_of_names = "[";
			var roomId_array  = [];
			var roomName_array = [];
			var roomImage_array  = [];
			var threatLevel_array = [];
			var illnessTypes_array  = [];
			var patientAge_array  = [];
			var lengthOfStay_array  = [];
			var nurseVisits_array  = [];
			var visitors_array  = [];
			var wasteDispose_array  = [];
			var lastCleaning_array  = [];
			var deviceWarning_array  = [];
			var missingTasks_array  = [];

			for(var i=0; i< user_data.length; i++)
			{
				roomId_array.push(user_data[i].value[1]);
			    roomName_array.push(user_data[i].value[2]);
			    roomImage_array.push(user_data[i].value[3]);
			    threatLevel_array.push(user_data[i].value[4]);
			    illnessTypes_array.push(user_data[i].value[5]);
			    patientAge_array.push(user_data[i].value[6]);
			    lengthOfStay_array.push(user_data[i].value[7]);
			    nurseVisits_array.push(user_data[i].value[8]);
			    visitors_array.push(user_data[i].value[9]);
			    wasteDispose_array.push(user_data[i].value[10]);
			    lastCleaning_array.push(user_data[i].value[11]);
			    deviceWarning_array.push(user_data[i].value[12]);
			    missingTasks_array.push(user_data[i].value[13]);
			}
			var fields =["|__Rooms_in_Database__|"];

			//name_array.sort();
			
			//generate JSON object to send to front end here
			for(var i=0; i<roomId_array.length; i++)
			{
				var name_JSON = "{\"roomId\":\"" + roomId_array[i] + "\" ,";
				name_JSON += "\"roomName\":\"" + roomName_array[i] + "\" ,";
				name_JSON += "\"roomImage\":\"" + roomImage_array[i] + "\" ,";
				name_JSON += "\"threatLevel\":\"" + threatLevel_array[i] + "\" ,";
				name_JSON += "\"illnessTypes\":\"" + illnessTypes_array[i] + "\" ,";
				name_JSON += "\"patientAge\":\"" + patientAge_array[i] + "\" ,";
				name_JSON += "\"lengthOfStay\":\"" + lengthOfStay_array[i] + "\" ,";
				name_JSON += "\"nurseVisits\":\"" + nurseVisits_array[i] + "\" ,";
				name_JSON += "\"visitors\":\"" + visitors_array[i] + "\" ,";
				name_JSON += "\"wasteDispose\":\"" + wasteDispose_array[i] + "\" ,";
				name_JSON += "\"lastCleaning\":\"" + lastCleaning_array[i] + "\",";
				name_JSON += "\"deviceWarning\":\"" + deviceWarning_array[i] + "\" ,";
				name_JSON += "\"missingTasks\":\"" + missingTasks_array[i] + "\"";
				name_JSON += "}";
				if(i !== 0)
					list_of_names = list_of_names.concat(",");
				list_of_names = list_of_names.concat(name_JSON);
			}
			list_of_names = list_of_names.concat("]");
			res.contentType("application/json");
			console.log("Returning names");
			console.log(list_of_names);
			res.send(JSON.parse(list_of_names)); //return the list to front end for display
		}
		else
		{
			console.log("No data from URL");
			console.log("Response is : " + response.statusCode);
			var name_string="{\"added\":\"DB read error\"}"; //Send error message in case 'request' can't read database
			res.contentType("application/json");
			res.send(JSON.parse(name_string));
		}
	});
});




app.get("/update_name",function(req, res){ //to update a name into the database
	console.log("Received : " + JSON.stringify(req.query));
	req.query.updated_new_name = req.query.updated_new_name.toUpperCase();
	req.query.updated_new_name = req.query.updated_new_name.trim();

	//Search through the DB completely to retrieve document ID and revision number
	var url = cloudant_url + "/names_database/_design/names_database/_view/names_database";
	var name_present = 0;
	request({
			 url: url, //url returns doc id, revision number and name for each document
			 json: true
			}, function (error, response, body) {
			if (!error && response.statusCode === 200)
			{
				var name_string;
				var user_data = body.rows;
				var id_to_remove; //for updating, document ID is essential.
				//Format remains the same as adding new city name, except that document ID needs to be added
				var rev_to_remove;
				var total_rows = user_data.length;
				for(var i=0; i< user_data.length; i++)
				{
					var doc = user_data[i];
					if(doc.value[1] === req.query.name_list)
					{
						id_to_remove = doc.key;
						rev_to_remove = doc.value[0];
					}
					if(doc.value[1] === req.query.updated_new_name)
					{
						name_present = 1;
						break;
					}
				}
				//create a document object before updating, containing ID of the doc. that needs to be updated, revision number and new name
			    var string_to_update = "{\"new_name\":\"" + req.query.updated_new_name + "\",\"_id\":\"" +id_to_remove+"\",\"_rev\":\"" + rev_to_remove + "\"}";
			    var update_obj = JSON.parse(string_to_update);
				//if update name is not equal to existing name and database isn't empty then update document, else print error message
				if(total_rows !== 0)
				{
					if(name_present === 0)
					{
						db.insert(update_obj, function(err, data)
						{
								if(!err)
								{
									console.log("Updated doc.");
									name_string="{\"updated\":\"updated\"}";
									res.contentType("application/json");//res.contentType and res.send is added inside every block as code returns immediately
									res.send(JSON.parse(name_string));
								}
								else
								{
									console.log("Couldn't update name " + err);
									name_string="{\"updated\":\"could not update\"}";
									res.contentType("application/json");
									res.send(JSON.parse(name_string));
								}
						});
					}
					else
					{
						console.log("Duplicate city");
						name_string="{\"updated\":\"No\"}";
						res.contentType("application/json");
						res.send(JSON.parse(name_string));
					}

				}
				else
				{
					console.log("DB is empty");
					var name_string="{\"updated\":\"empty database\"}";
					res.contentType("application/json");
					res.send(JSON.parse(name_string));
				}
			}
			else
			{
				console.log("No response from URL. Status : " + response.statusCode);
				name_string="{\"updated\":\"DB read error\"}";
				res.contentType("application/json");
				res.send(JSON.parse(name_string));
			}
	});
});

app.get("/update_personel",function(req, res){ //to update a name into the database
	console.log("Received : " + JSON.stringify(req.query));
	req.query.updated_new_name = req.query.updated_new_name.toUpperCase();
	req.query.updated_new_name = req.query.updated_new_name.trim();

	//Search through the DB completely to retrieve document ID and revision number
	var url = cloudant_url + "/names_database/_design/names_database/_view/names_database";
	var name_present = 0;
	request({
			 url: url, //url returns doc id, revision number and name for each document
			 json: true
			}, function (error, response, body) {
			if (!error && response.statusCode === 200)
			{
				var name_string;
				var user_data = body.rows;
				var id_to_remove; //for updating, document ID is essential.
				//Format remains the same as adding new city name, except that document ID needs to be added
				var rev_to_remove;
				var total_rows = user_data.length;
				for(var i=0; i< user_data.length; i++)
				{
					var doc = user_data[i];
					if(doc.value[1] === req.query.name_list)
					{
						id_to_remove = doc.key;
						rev_to_remove = doc.value[0];
					}
					if(doc.value[1] === req.query.updated_new_name)
					{
						name_present = 1;
						break;
					}
				}
				//create a document object before updating, containing ID of the doc. that needs to be updated, revision number and new name
			    var string_to_update = "{\"new_name\":\"" + req.query.updated_new_name + "\",\"_id\":\"" +id_to_remove+"\",\"_rev\":\"" + rev_to_remove + "\"}";
			    var update_obj = JSON.parse(string_to_update);
				//if update name is not equal to existing name and database isn't empty then update document, else print error message
				if(total_rows !== 0)
				{
					if(name_present === 0)
					{
						db.insert(update_obj, function(err, data)
						{
								if(!err)
								{
									console.log("Updated doc.");
									name_string="{\"updated\":\"updated\"}";
									res.contentType("application/json");//res.contentType and res.send is added inside every block as code returns immediately
									res.send(JSON.parse(name_string));
								}
								else
								{
									console.log("Couldn't update name " + err);
									name_string="{\"updated\":\"could not update\"}";
									res.contentType("application/json");
									res.send(JSON.parse(name_string));
								}
						});
					}
					else
					{
						console.log("Duplicate people");
						name_string="{\"updated\":\"No\"}";
						res.contentType("application/json");
						res.send(JSON.parse(name_string));
					}

				}
				else
				{
					console.log("DB is empty");
					var name_string="{\"updated\":\"empty database\"}";
					res.contentType("application/json");
					res.send(JSON.parse(name_string));
				}
			}
			else
			{
				console.log("No response from URL. Status : " + response.statusCode);
				name_string="{\"updated\":\"DB read error\"}";
				res.contentType("application/json");
				res.send(JSON.parse(name_string));
			}
	});
});
var appEnv = cfenv.getAppEnv();
app.listen(appEnv.port, "0.0.0.0", function() {
  console.log("server starting on " + appEnv.url);
});
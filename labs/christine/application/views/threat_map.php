<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<meta charset="utf-8">
	<title>Threat Map</title>

	<style type="text/css">

	::selection { background-color: #E13300; color: white; }
	::-moz-selection { background-color: #E13300; color: white; }

	#body {
		margin: 0 15px 0 15px;
	}

	</style>
</head>
<body>

<div id="container">
	<h1>Threat Map</h1>

	<div>
		<table if="content" style="width:100%">
		  <tr>
		    <td id="room1" align="center" height="250px"></td>
		    <td id="room2" align="center"></td>
		    <td id="room3" align="center"></td>
		  </tr>
		  <tr>
		    <td id="room4" align="center" height="250px"></td>
		    <td width="33.33%" align="center">Nurses Station</td>
		    <td id="room5" align="center"></td>
		  </tr>
		  <tr>
		    <td id="room6" align="center" height="250px"></td>
		    <td id="room7" align="center"></td>
		    <td id="room8" align="center"></td>
		  </tr>
		</table>
	</div>
</div>

<script>
$(document).ready(function() {
    call_ajax();
});

// var scheduledResult = setInterval(function(){ ajaxQuery() }, 10000);
var scheduledResult = setInterval(function(){ call_ajax() }, 10000);

var status_colors = ['#037d12', '#4ea459', '#81be88', '#b3d8b7', '#cce5cf','e5f2e7', '#f0d0d4', '#e2a2a9', '#d4747e', '#c64652','#990000'];

function call_ajax() {
		//get data
		$.ajax({
            url: 'threatmap/ajaxQuery',
            type: 'GET',
            dataType: 'json'
        })
        
        .done(function(data) {

   //      	$('table tr').each(function() {
   //  			// $(this).find("td").css("height", "200px");;
   //  			$(this).find('td').each(function(){
   //  				$(this).css("height", "200px");
   //  			});
			// });

        	$.each(data, function(index, element) {
	            // console.log(element.room1);
	            $('#room1').html(element.room1);
	            $('#room1').css("background-color", status_colors[element.room1]);
	            $('#room2').html(element.room2);
	            $('#room2').css("background-color", status_colors[element.room2]);
	            $('#room3').html(element.room3);
	            $('#room3').css("background-color", status_colors[element.room3]);
	            $('#room4').html(element.room4);
	            $('#room4').css("background-color", status_colors[element.room4]);
	            $('#room5').html(element.room5);
	            $('#room5').css("background-color", status_colors[element.room5]);
	            $('#room6').html(element.room6);
	            $('#room6').css("background-color", status_colors[element.room6]);
	            $('#room7').html(element.room7);
	            $('#room7').css("background-color", status_colors[element.room7]);
	            $('#room8').html(element.room8);
	            $('#room8').css("background-color", status_colors[element.room8]);
	        });
        });
}
</script>

</body>
</html>
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



$(function () {

	//This section is what runs our speech recognition tool
	
	var recognition = new webkitSpeechRecognition();
	recognition.continuous = true;
	//all the words are going to go 
	//into this array individually
	var transArray = ["hello"];

	//grabs our button that starts listening
	$("#testButton").click(function (){
		//defines the recognition function --
		//not sure if this needs to be 
		//inside the onclick either. Ask.
		recognition.onresult = function(event) { 
			var transcript = event.results[0][0].transcript;
			//recognition.continuous = true;
			//"event.results[0][0].transcript" is our transcript of all the words
			
			//pushes the transcript into the trans array
			//as indivudual words
			var wordArray = transcript.split(" ");
			//puts the transcript on the page

			var results = function(){
				str = "";
				for (var x; x < fillers.length; x++){
					str += fillers[x] + ": " + fillerWordCount[x] + "<br>";
				}
			}
			$("#textHere").html(transcript);
			var fillerWordCounts = pickFillers(wordArray, fillers)
			$("#count").html(fillers[0] + fillerWordCounts[0] + "<br> So: " + fillerWordCounts[1] + "<br> Really: " + fillerWordCounts[2]);
			console.log("Inside: " + transArray);

		}
		$("#stopButton").click(function(){
				recognition.stop();
			});

		//calls listener function
		recognition.start();

	});

	//grabs the form where users enter words
	var $addWordForm = $("#fillerWordInput");
	//when user clicks submit...
	$addWordForm.on("submit", function (event) {
		//so that the page doesn't reload onclick
		event.preventDefault();
		var content = $("#newFiller").val();
		fillers.push(content);
		console.log(fillers);
		$("#displayFillers").append(content + "<br>");
	});
		
		//stops the recognition 

// this function is going to find our filler 
// words in the array of total words
// and count them	
	var fillers = [];
	//var fillers = ["like", "so", "really"];
	var pickFillers = function(transcript, fillers){
		console.log("transcript: " + transcript);
		// initializes an array that's the 
		// length of the filler words array
		var counts = new Array(fillers.length);
		console.log("counts.length : " + counts.length);
		console.log ("Transcript.length : " + transcript.length);
		//cycles through filler words
		for (var k = 0; k < fillers.length; k++ ){
			var filler = fillers[k];
			counts[k] = 0;
			//cycles through whole transcript
			for (var i = 0; i < transcript.length; i++){
				if (transcript[i] == filler){
					console.log(transcript[i]);
					counts[k] += 1;
				}
			} 
		}
		console.log("Counts: ", counts);
		return counts;
	}
	


	

});


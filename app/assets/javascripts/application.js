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
	var transArray = [""];

	//grabs our button that starts listening
	$("#testButton").click(function (){
		//starts the speech timer
		timer();
		//defines the recognition function --
		//not sure if this needs to be 
		//inside the onclick. Ask.
		recognition.onresult = function(event) { 
			// "event.results[0][0].transcript" is our transcript of all the words
			var transcript = event.results[0][0].transcript;
			
			// This pushes the transcript into the trans array
			// as indivudual words
			var wordArray = transcript.split(" ");
			
			// puts the words the user entered
			// onto the page next to the number of 
			// times the user used them
			var showResults = function(){
				str = "";
				for (var x = 0; x < fillers.length; x++){
					console.log("Fillers[x]: " + fillers[x]);
					str += (fillers[x] + ": " + fillerWordCounts[x] + "<br>");
				}
				console.log("str : " + str);
				return str;
			}


			
			//puts the transcript on the page
			$("#textHere").html(transcript);
			var fillerWordCounts = pickFillers(wordArray, fillers);
			$("#count").html(showResults());
			console.log("Inside: " + transArray);

		}
		//stops the recognition 
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
	
function timer(){
	var s = 1;
	var m = 0;
	var myVar = setInterval(function(){myTimer()},1000);
	$("#timer").html("00:00");
	function myTimer() {
	  if (s < 60){
	    if (s < 10){
	      $("#timer").html(m + ":0" + s);
	      s+=1;
	    } else {
	      $("#timer").html(m + ":" + s);
	      s+=1;
	    }
	  } else {
	      s = 1;
	      m += 1;
	      $("#timer").html(m + ":0" + s);
	  }
	}
	$("#stopButton").click(function(){
				clearInterval(myVar);
			});
}


// To Do:

// -- chain recognition starts until the user presses stop
// -- FOR ANYONE READING MY COMMENTS, I AM SO SORRY. 
// IT'S SO THAT PEOPLE STOP SAYING THESE WORDS.
// -- need to fix : fuck, fucking, fucker, motherfucker, whore, shit, 
// asshole, cunt, asswipe, bitches, blow job,
// bullshit, bumblefuck, cockhead, cocksucker, cum, 
// cumslut, slut, dickface, dicksucker, dipshit, dumbfuck (but not dumbshit??)
// fag, fagbag, fagfucker, faggot, motherfucking, nigger, nigga, niggers,
	

});






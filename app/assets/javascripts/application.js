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
	var stopClicked = false;
	//grabs our button that starts listening
	$("#testButton").click(function (){
		recognition.continuous = true;
		//starts the speech timer
		timer();
		//defines the recognition function --
		//not sure if this needs to be 
		//inside the onclick. Ask.
		recognition.onresult = function(event) { 
			recognition.continuous = true;

			
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
				//console.log("str : " + str);

				console.log("stopClicked: " + stopClicked);
				// RESET THING THAT DOESN'T WORK AGAIN
				// if (!stopClicked){
				// 		console.log("stopping");
				// 		recognition.stop().then(function (thing){
				// 			recognition.start();
				// 		});
				// 		console.log("stopped");
						
				// 		console.log("starting again");
				// };
				return str;
			}

			//puts the transcript on the page
			$("#textHere").html(transcript);
			var fillerWordCounts = pickFillers(wordArray, fillers);
			$("#count").html(showResults());
			//console.log("Inside: " + transArray);

		}
		recognition.start();
		console.log("starting!!")
		//calls listener function
		

	}); //end onclick start

	// RESET THING THAT DOESN'T WORK
	// recognition.onaudioend = function (event){
	// 	console.log("stopClicked: " + stopClicked);
	// 	if (!stopClicked){
	// 			recognition.start();
	// 			console.log("starting again");
	// 	}
	// };

		//stops the recognition 
	$("#stopButton").click(function(){
		stopClicked = true;
		console.log("stopClicked in stop button: " + stopClicked);
		recognition.stop();
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

	var pickFillers = function(transcript, fillers){
		//console.log("transcript: " + transcript);
		// initializes an array that's the 
		// length of the filler words array
		var counts = new Array(fillers.length);
		//console.log("counts.length : " + counts.length);
		//console.log ("Transcript.length : " + transcript.length);

		//cycles through filler words
		for (var k = 0; k < fillers.length; k++ ){
			var filler = fillers[k];
			counts[k] = 0;
			//if there's a space in the filler word...
			//which means that there are two words in the filler
			if (filler.indexOf(" ") != -1){
				var doubleWord = filler.split(" ");
				var d = doubleWord[0];
				var w = doubleWord[1];
				for (var i = 0; i < transcript.length-1; i++){
					// second comparison
					var j = i + 1;
					if (d == transcript[i] && w == transcript[j]){
						counts[k] += 1;
					}
				}
			} else {
				//cycles through whole transcript
				for (var i = 0; i < transcript.length; i++){
					if (transcript[i] == filler){
						console.log(transcript[i]);
						counts[k] += 1;
					}
				} 
			}
		}
		//console.log("Counts: ", counts);
		return counts;
	};
	
	function timer(){
		var s = -1;
		var m = 0;
		var timeCount = 0;
		var newTimer = setInterval(function(){myTimer()},1000);
		
		$("#timer").html("00:00");
		function myTimer() {
			s+=1;
			timeCount +=1;
			//hacky a.f. way to get the 
			//recognition session to refresh
			if (timeCount == 55){
				recognition.stop();
			};
			if (timeCount == 57){
				recognition.start();
				timeCount = 0;
			};
		  if (s < 60){
		    if (s < 10){
		      $("#timer").html(m + ":0" + s);
		   //   s+=1;
		    } else {
		      $("#timer").html(m + ":" + s);
		     // s+=1;
		    }
		  } else {
		      s = 0;
		      m += 1;
		      $("#timer").html(m + ":0" + s);
		  }
		};

		$("#stopButton").click(function(){
			clearInterval(newTimer);
		});
	}; // end


// To Do:

// -- Figure out data structures for collecting all words
//    vs filler words
// -- FOR ANYONE READING MY COMMENTS, I AM SO SORRY. 
// 		IT'S SO THAT PEOPLE STOP SAYING THESE WORDS.
// -- need to fix : fuck, fucking, fucker, motherfucker, whore, shit, 
// 		asshole, cunt c***, asswipe, bitches, blow job,
// 		bullshit, bumblefuck, cockhead, cocksucker, cum, 
// 		cumslut, slut s***, dickface, dicksucker, dipshit, dumbfuck (but not dumbshit??)
// 		fag, fagbag, fagfucker, faggot, motherfucking, nigger, nigga, niggers,
// -- add bigram iteration to find "you know" etc.

// if stopbutton has been clicked on, then end. If not, 
// restart when onend has been triggered. 

//create default user for people not logged in on which
//to attach collected words
});






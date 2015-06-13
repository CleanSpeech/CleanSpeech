
$(function () {
		
	var transcript;
	var wordArray = [];

	//This section is what runs our speech recognition tool
	var recognition = new webkitSpeechRecognition();
	recognition.continuous = true;
	//all the words are going to go 
	//into this array individually
	var stopClicked = false;
	//grabs our button that starts listening
	$(".mic-start-button").click(function (){
		wordArray = [];
		

		recognition.continuous = true;
		//starts the speech timer
		timer();
		//defines the recognition function --
		//not sure if this needs to be 
		//inside the onclick. Ask.
		
		recognition.onresult = function(event) { 
			recognition.continuous = true;
			console.log("onresult true");
			
			// "event.results[0][0].transcript" is our transcript of all the words
			transcript = event.results[0][0].transcript;
			console.log("Innitial transcript: " ,transcript);

			// This pushes each of the transcripts into the temp array,
			// and then adds each of the words into the wordArray
			wordArray = transcript.split(" ");

			// console.log("Testing yoda temp Array", tempArray);
			// for (i=0; i < tempArray.length; i++){
			// 	wordArray.push(tempArray[i]);
			// }

		}
		recognition.start();
		// console.log("starting!!");
		//calls listener function

	}); //end onclick start
///////////////////////////////////////////////////// FIX THIS DAMNIT.
// This takes the words the user has input from the page...(really?) and puts them
// in the array to track. Sorry.
	var fillers = [];
	$('.actualWord').each(function() {
	fillers.push($(this).html());
	});
///////////////////////////////////////////////////// Pull these from the database. Like an adult.

	var pickFillers = function(wordArray, fillers){
		//making sure all of our filler words are lower case
		//to avoid weird case conflicts
		//NEED TO ADD THIS FOR WORD ARRAY AS WELL.
		fillers = fillers.map(function(value) {
    		return value.toLowerCase();
		});

		// initializes an array that's the
		// length of the filler words array
		// in order to have a corresponding count
		// REFACTOR WITH KEY VALUE OBJECTS
		var counts = counts || fillers.slice();
		counts.forEach(function(el,id,arr){
			arr[id] = 0;
		});

		// this is to add one at the end to count swears
		// ////                  ///////                              /////     +1  ??
		// if (fillers.indexOf("*swears") === -1 && counts.length < fillers.length    ){
		// counts.push(0);
		// }

		console.log("hello from inside pick Fillers before cycling through fillers.");
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
				for (var i = 0; i < wordArray.length-1; i++){
					// second comparison
					var j = i + 1;
					if (d === wordArray[i] && w === wordArray[j]){
						counts[k] += 1;
					}
				}
			} else {
			// 	//cycles through whole wordArray
				counts[counts.length-1] = 0;
				for (var q = 0; q < wordArray.length; q++){
					if (wordArray[q] === filler){
						counts[k] += 1;
					}
					///This finds and counts the swears in the transcript
					// else if (wordArray[q][1] === "*"){ //THIS NEEDS TO BE MADE CONDITIONAL
			// 			counts[counts.length-1] += 1;
			// 		}
				}
			}
		}
		console.log("fillers:", fillers);
		console.log("Counts: ", counts);
		//counts[counts.length-1] = counts[counts.length-1];//fillers.length;
		return counts;
	};

	//grabs the form where users enter words
	var $addWordForm = $("#fillerWordInput");
	//when user clicks submit...
	$addWordForm.on("submit", function (event) {
		//so that the page doesn't reload onclick
		//event.preventDefault();
		var word = $("#newFiller").val();
		if (fillers.indexOf(word) === -1){
			fillers.push(word);
			console.log("before post after push", fillers);
			$.post("/words.json", {
				word: {
					word: word
				}
			}).done(function (createdWord){
				console.log("after post before display", fillers);
				 
				$("#displayFillers").append("<div class= 'fillerItem'><div class='actualWord'>"+ createdWord.word + "</div><button class=\"delete-user-word\" data-word-id=\"<%= w.id %>\"> X </button>" +"<br>");
			console.log("should have put this on the page ", createdWord.word);
			})

		}
		// location.reload();
	});


//  Not working on heroku
$(".delete-user-word").click(function(){
	var wordId = $(this).data("word-id");
	var wordVal = $(this).data("word");
	// console.log("word ID" + wordId);
	var $word = this.closest(".fillerItem");
	// console.log("$word  :::" , $word);
	$.ajax({
		url: "/words/"+ wordId + ".json",
		type: "PATCH"
	}).done(function(){
		indexWord = fillers.indexOf(wordVal);
		fillers.splice(indexWord, 1);
		console.log("Fillers post delete ", fillers);
		//console.log()
		$word.remove();
		// console.log(this)
		console.log("DELETED!!!");
	});
});


//.done(function (done){
// 			console.log("Deleted");
// 			$("#displayFillers").append(createdWord.word + "<br>");
// 		})
		
// this function is going to find our filler 
// words in the array of total words
// and count them	
	var newTimer;
	var seconds;
	function timer(){
		var s = -1;
		var m = 0;
		var timeCount = 0;
		seconds = 0;
		newTimer = setInterval(function(){myTimer()},1000);
		
		$("#timer").html("00:00");
		function myTimer() {
			seconds += 1;
			s+=1;
			timeCount +=1;
			//hacky a.f. way to get the 
			//recognition session to refresh
			if (timeCount === 55){
				recognition.stop();
			};
			if (timeCount === 57){
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

	
	}; // end timer

	var fillerWordCounts; //this variable is an array that we get from pickFillers eventually
	//it contains just the counts

	//This is to put the filler word counts on the page
	var showResults = function(){
			str = "";

			for (var x = 0; x < fillers.length; x++){
				//console.log("Fillers[x]: " + fillers[x]);
				str += (fillers[x] + ": " + fillerWordCounts[x] + "<br>");
			}
			console.log("fillers in show results: ", fillers);
			return str;
	};



	$(".stop-button").click(function(){
		console.log("CLICKED!! Now. Clicked.");
		recognition.stop();

		setTimeout(function(){
			console.log("TRANSCRIPT!!!! : ", wordArray);
			fillerWordCounts = pickFillers(wordArray, fillers); //contains counts
			console.log("FillerWordCounts???? ", fillerWordCounts);
		}, 2000);

		//console.log("stopClicked in stop button: " + stopClicked);
		clearInterval(newTimer);

		//adds speech attempt to database
		// $.post("/speech_attempts.json",{
		// 	speech_attempt: {
		// 			time: seconds

		// 	}
	//});

		myVar = setTimeout(function(){
			//adds swears to filler array...?
			// if (fillers.indexOf("*swears") === -1){
			// 	fillers.push("*swears");
			// 	console.log("adding swears");
			// };

			obj = toObj(fillers, fillerWordCounts);

			console.log("OBJ IS", obj);

			$.post('/messing', {wordHash: obj, speech_attempt: {time: seconds}}, function(data) {
				console.log(data);
			});

			$("#textHere").html(wordArray);
			$("#count").html(showResults());
		},4000);

	});


//takes the two arrays, and puts the corresponding values as key:value pairs
	var toObj = function(fillers, counts){
	  var obj = {};
	  for (var i = 0; i < fillers.length; i++){
	  obj[fillers[i]] = counts[i];
	  }
	return obj;
	};




});

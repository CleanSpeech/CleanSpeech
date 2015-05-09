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

	window.SpeechRecognition = window.SpeechRecognition       ||
	window.webkitSpeechRecognition || null;
 
  if (window.SpeechRecognition === null) {
    document.getElementById('ws-unsupported').classList.remove('hidden');
    document.getElementById('button-play-ws').setAttribute('disabled', 'disabled');
    document.getElementById('button-stop-ws').setAttribute('disabled', 'disabled');
  } else {
    var recognizer = new webkitSpeechRecognition();
    var transcription = document.getElementById('transcription');
    var log = document.getElementById('log');

    // Recogniser doesn't stop listening even if the user pauses
    recognizer.continuous = true;

    // Start recognising
    recognizer.onresult = function(event) {
      transcription.textContent = '';

      for (var i = event.resultIndex; i < event.results.length; i++) {
        if (event.results[i].isFinal) {
          transcription.textContent = event.results[i][0].transcript + ' (Confidence: ' + event.results[i][0].confidence + ')';
		console.log(transcription.textContent)	        
        } else {
          transcription.textContent += event.results[i][0].transcript;
        }
      }
    };

    // Listen for errors
    recognizer.onerror = function(event) {
      log.innerHTML = 'Recognition error: ' + event.message + '<br />' + log.innerHTML;
    };

    document.getElementById('button-play-ws').addEventListener('click', function() {
      // Set if we need interim results
      recognizer.interimResults = document.querySelector('input[name="recognition-type"][value="interim"]').checked;

      try {
        recognizer.start();
        log.innerHTML = 'Recognition started' + '<br />' + log.innerHTML;
      } catch(ex) {
        log.innerHTML = 'Recognition error: ' + ex.message + '<br />' + log.innerHTML;
      }
    });

    document.getElementById('button-stop-ws').addEventListener('click', function() {
      recognizer.stop();
      log.innerHTML = 'Recognition stopped' + '<br />' + log.innerHTML;
    });

    document.getElementById('clear-all').addEventListener('click', function() {
      transcription.textContent = '';
      log.textContent = '';
    });
  }

});
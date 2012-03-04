
function debug(text) {
  ((window.console && console.log) ||
   (window.opera && opera.postError) ||
   window.alert).call(this, text);
}

jQuery.noConflict();

(function($){
		
	$(function(){
		
		$('.bloxcontainer').css("visibility", "hidden");
		
		var setGrid = function () {
			return $("#center").vgrid({
				easeing: "easeOutQuint",
				time: 600,
				delay: 50,
				selRefGrid: ".bloxcontainer blox",
				selFitWidth: ["#header", "#footer"],
				forceAnim: 1 });
		};
		
		setTimeout(setGrid, 300);
		
		setTimeout(function() {
			$('.bloxcontainer').hide().css("visibility", "visible").fadeIn(500);
		}, 500);
		
		$(window).load(function(e){
			setTimeout(function(){ 
				// prevent flicker in grid area - see also style.css
				$(".bloxcontainer").css("paddingTop", "0px");
			}, 1000);
		});

	}); // end of document ready
})(jQuery); // end of jQuery name space 

/*
(function($){
		
	$(function(){
		
		$('#header').css("visibility", "hidden");
		
		var setGrid = function () {
			return $("#center .bloxcontainer").vgrid({
				easeing: "easeOutQuint",
				time: 100,
				delay: 50,
				selRefGrid: "#center blox",
				selFitWidth: ["#header", "#footer"],
				forceAnim: 1 });
		};
		
		setTimeout(setGrid, 300);
		
		setTimeout(function() {
			$('#header').hide().css("visibility", "visible").fadeIn(500);
		}, 500);
		
		$(window).load(function(e){
			setTimeout(function(){ 
				// prevent flicker in grid area - see also style.css
				$("#center").css("paddingTop", "0px");
			}, 1000);
		});

	}); // end of document ready
})(jQuery); // end of jQuery name space 
*/
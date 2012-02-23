<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js" type="text/javascript" charset="UTF-8"></script>

<script src="http://loudspring.com/wp-content/themes/twentyeleven/js/jquery.easing.1.3.js" type="text/javascript" charset="UTF-8"></script>
<script src="http://loudspring.com/wp-content/themes/twentyeleven/js/jquery.vgrid.0.1.4-mod.js" type="text/javascript" charset="UTF-8"></script>

<script type="text/javascript">
//<![CDATA[

function debug(text) {
  ((window.console && console.log) ||
   (window.opera && opera.postError) ||
   window.alert).call(this, text);
}
jQuery.noConflict();

(function($){
	$(function(){
		
		$('#header').css("visibility", "hidden");
		var setGrid = function () {
			return $("#main").vgrid({
				easeing: "easeOutQuint",
				time: 50,
				delay: 0,
				selRefGrid: "#main post",
				selFitWidth: ["#header", "#footer"],
				forceAnim: 1			});
		};
		
		setTimeout(setGrid, 300);
		setTimeout(function() {
			$('#header').hide().css("visibility", "visible").fadeIn(500);
		}, 500);
		
		$(window).load(function(e){
			setTimeout(function(){ 
				// prevent flicker in grid area - see also style.css
				$("#main").css("paddingTop", "0px");
			}, 1000);
		});

	}); // end of document ready
})(jQuery); // end of jQuery name space 

//]]>
</script>


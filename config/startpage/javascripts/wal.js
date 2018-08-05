setInterval( function() {
	$.getJSON("../../.cache/wal/colors.json", function(json) {
		$('.background-image').css('background', `url(${json.wallpaper}) no-repeat center center fixed`)
		$('h1').css('color', json.colors.color2)
		$('a').css('color', json.colors.color6)
	});
}, 500);

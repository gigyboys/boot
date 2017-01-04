$(function() {
	console.log('boot');
	
	
    
    $('#contact2').click(function() {
		console.log("create popup1");
		var content = 	'<div style="padding:5px; width:auto; background:#fff;height:300px; border-radius:5px">'+
							'<div style="text-align:center">'+
								'Contact ... '+
							'</div>'+
						'</div>';
        var bg = 'rgba(0,0,0,0.5)';
		popup(content, 500, true, bg);
    });
});


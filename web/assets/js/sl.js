
$(function() {
	console.log("inittabschool");
	var tab_sl_item = $('.tab_sl_item');
	var content_tab_sl_item = $('.content_tab_sl_item');
	
	tab_sl_item.live('click', function(e) {
        tab_sl_item.removeClass('selected');
        $(this).addClass('selected');
		var this_id = $(this).attr('id');
		var content = $("#content_"+this_id);
		content_tab_sl_item.removeClass('selected').css('display','none');
		
		content.addClass('selected').css('display','block');
		
    });
	
});
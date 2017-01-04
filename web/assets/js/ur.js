
$(function() {
	console.log("inittabuser");
	var tab_ur_item = $('.tab_ur_item');
	var content_tab_ur_item = $('.content_tab_ur_item');
	
	tab_ur_item.live('click', function(e) {
        tab_ur_item.removeClass('selected');
        $(this).addClass('selected');
		var this_id = $(this).attr('id');
		var content = $("#content_"+this_id);
		content_tab_ur_item.removeClass('selected').css('display','none');
		
		content.addClass('selected').css('display','block');
		
    });
	
	//var content_user_image = $('#content_user_image');
	
    /*
    *upload avatar for user
    */
    $('#avatarfile').on('change', function(){
      
		/*console.log("change avatar");*/
        var $this = $(this);
        var file = $this[0].files[0];
        var target = $this.data('target');
        var data = new FormData();
		console.log(target);
        data.append('file', file);
		//console.log(data);
		
        $.ajax({
            type: 'POST',
            url: target,
            data: data,
            contentType: false,
            processData: false,
            dataType : 'json',
            success: function(data){
                console.log(data.avatar32x32);
                console.log(data.avatar80x80);
				$("#avatar_banner").attr("src", data.avatar32x32);
				$("#user_avatar").attr("src", data.avatar80x80);
            },
            error: function(jqXHR, textStatus, errorThrown) {
				console.log(jqXHR.status);
				console.log(textStatus);
				console.log(errorThrown);
			}
        });
		
		
    });
	
});
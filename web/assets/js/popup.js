
var button_closable = $('.button_closable');
var popup_content = $('.popup_content');
var popup_content_closable = $('.popup_content_closable');
var popupw = $('.popup');
var zIndex = 10000;

function popup(content, width, closable = true, background = 'rgba(0,0,0,0.5)'){
	console.log("create popup");
	zIndex = zIndex + 2;
	var popup_content = $('<div>', {
		'class':'popup_content',
	}); 
	popup_content.css('z-index', zIndex);
	popup_content.css('background', background);
	if(closable){
		popup_content.addClass( "popup_content_closable" );
	}
	var popupwindow = $('<div>', {
		'class':'popup',
	}); 
	popupwindow.width(width);
	popupwindow.append(content);
	popup_content.append(popupwindow);
	$('body').prepend(popup_content);
	
	var popup_content_height = popup_content.height();
	var popup_height = popupwindow.height();
	popupwindow.css('margin-top', (popup_content_height - popup_height) / 2);
}

$(function() {
    $('.otherpopup').live('click', function() {
		var content = '<div style="padding:5px; width:auto; background:#fff""><div style="text-align:center"> other popup apert<br /> ok...</div><div style="text-align:center">	<span class="button_closable" style="background:#888; border-radius: 3px; cursor:pointer; display:inline-block; margin:auto; padding:5px;">	Confirmer	</span></div></div>';
        popup(content, 300, false);
    });
    
    $('#popupme').click(function() {
		var content = '<div style="padding:5px; width:auto; background:#aaa"><div style="text-align:center">	<span class="otherpopup" style="cursor:pointer">Que tous sois un ...</span></div><div style="text-align:center">	<span class="button_closable" style="background:#888; border-radius: 3px; cursor:pointer; display:inline-block; margin:auto; padding:5px;">	Confirmer	</span></div></div>';
        var bg = 'rgba(255,255,255,0.5)';
		popup(content, 500, true, bg);
    });
    
    popup_content_closable.live('click', function(e) {
        $(this).remove();
    });
    
    button_closable.live('click', function(e) {
		console.log('trigger');
		/*e.stopPropagation();
        //popup_content_closable.trigger('click');
		$(document).trigger({ 
			type:   'click',
			target: $('.popup_content_closable')[0]
		});*/
		$(this).closest('.popup_content').remove();
    });
    
    popupw.live('click', function(e) {
        e.stopPropagation();
    });
	
	$(window).resize(function() {
		centerBloc($('.popup_content'), $('.popup'));/*
        var popup_content_height = $('.popup_content').height();
		var popup_height = $('.popup').height();
		$('.popup').css('margin-top', (popup_content_height-popup_height)/2);*/
    });
    
});

function centerBloc(popup_content, popup){
	var popup_content_height = popup_content.height();
	var popup_height = popup.height();
	popup.css('margin-top', (popup_content_height-popup_height)/2);
}
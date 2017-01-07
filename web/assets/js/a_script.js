
$(function() {
	console.log("init");
	var body = $('body');
	var a_header = $('#a_header');
	var a_nav = $('#a_nav');
	var a_nav_main = $('#a_nav_main');
	var a_nav_main_item_text = $('.a_nav_main_item_text');
	var a_nav_sub_item_text = $('.a_nav_sub_item_text');
	var a_nav_foot = $('#a_nav_foot');
	var a_content = $('#a_content');
	var a_content_header = $('#a_content_header');
	var a_content_body = $('#a_content_body');
	var a_content_footer = $('#a_content_footer');
	var a_nav_item = $('.a_nav_item');
	
	//var a_nav_width_max = 240;
	var a_nav_width_max = 200;
	var a_nav_width_min = 40;
	
	var ww_width_min= 600;
	var ww_height_min= 300;
	
	var width_seuil = 800;
	
	var ww = $(window);
	
	
	var btn_edit = $('.btn_edit');
	var btn_reset = $('.btn_reset');
    
    btn_edit.click (function (event){
	//console.log("edit bloc editable");
        var $this = $(this);
        var bloc_editable = $this.closest(".bloc_editable");
        var bloc_view = bloc_editable.find(".bloc_view");
        var bloc_edit = bloc_editable.find(".bloc_edit");
        var btn_edit = bloc_editable.find(".btn_edit");
        var btn_save = bloc_editable.find(".btn_save");
        var btn_reset = bloc_editable.find(".btn_reset");
		bloc_view.hide();
		bloc_edit.show();
		btn_edit.hide();
		btn_save.show();
		btn_save.show();
		
    });
    
    btn_reset.click (function (event){
	//console.log("reset edit bloc editable");
        var $this = $(this);
        var bloc_editable = $this.closest(".bloc_editable");
        var bloc_view = bloc_editable.find(".bloc_view");
        var bloc_edit = bloc_editable.find(".bloc_edit");
        var btn_edit = bloc_editable.find(".btn_edit");
        var btn_save = bloc_editable.find(".btn_save");
        var btn_reset = bloc_editable.find(".btn_reset");
		bloc_view.show();
		bloc_edit.hide();
		btn_edit.show();
		btn_save.show();
		btn_save.show();
		
    });
	
	function init(){
		
		console.log("window : "+ww.width()+"/"+ww.height());
		//console.log("a_header : "+a_header.width()+"/"+a_header.height());
		
		if(ww.width() > width_seuil){
			var a_nav_width = a_nav_width_max;
			a_nav_main_item_text.css('display', 'block');
			a_nav_sub_item_text.css('display', 'block');
		}
		else{
			var a_nav_width = a_nav_width_min;
			a_nav_main_item_text.css('display', 'none');
			a_nav_sub_item_text.css('display', 'none');
		}
		
		var a_nav_height = ww.height() - a_header.height();
		var a_content_height = ww.height() - a_header.height();
		a_nav.width(a_nav_width);
		a_content.css('margin-left', a_nav_width);
		
		$('#a_content_body_left').css('width',$('#a_content_body').width()-260);
		$('#a_content_body_right').css('margin-left',$('#a_content_body_left').width());
		
		if(ww.height() > ww_height_min){
			body.css('overflow', 'hidden');
			a_nav.height(a_nav_height);
			var a_nav_main_height = a_nav.height() - a_nav_foot.height();
			a_nav_main.height(a_nav_main_height);
			a_content.height(a_content_height);
			
			var a_content_body_height = a_content.height() - a_content_header.height() - a_content_footer.height();
			a_content_body.height(a_content_body_height);
		}else{
			body.css('overflow', 'auto');
		}
	}
	
	$("#a_nav_main").mCustomScrollbar({
		theme:"minimal",
		animationSpeed:0
	});
	
    $(window).resize(function() {
        init();
    });

    init();
	   
	a_nav_item.live('click', function(e) {
        console.log($(this).find('.a_nav_sub_content').html);
        $('.a_nav_sub_content').css('display','none');
		$(this).find('.a_nav_sub_content').css('display','block');
    });
	
});

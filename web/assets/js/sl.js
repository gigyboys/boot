
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
	
	var row 	= 60; 		//60
    var row4 	= row*4; 	//
    var row8 	= row*8; 	//
    var row12 	= row*12; 	//
    var row16 	= row*16; 	//960
    var row20 	= row*20; 	//1200
	
    function slContent(){
        largeur_window = $(window).width();
		var sl_list = $("#sl_list");
		var sll = $(".sll");
		var sll_ct = $(".sll_ct");
		var slr = $(".slr");

        if(largeur_window<row20){
            if(largeur_window>row16){
				slr.css('display', 'block');
                widthBloc = sl_list.width()-row4;
                sll_ct.css('width', row12);
                sll.css('width', widthBloc);
                slr.css('width', row4);
				console.log(sll.css('width'));
                sll.css('float', 'left');
                slr.css('margin-left', widthBloc);
            }
            else{
				if(largeur_window>row12){
				slr.css('display', 'block');
					slr.css('width', row4);
					widthBloc = sl_list.width()-row4;
					sll_ct.css('width', row8);
					sll.css('width', widthBloc);
					console.log(sll.css('width'));
					sll.css('float', 'left');
					slr.css('margin-left', widthBloc);
				}
				else{
					if(largeur_window>row8){
						slr.css('display', 'none');
						widthBloc = sl_list.width();
						sll_ct.css('width', row8);
						sll.css('width', widthBloc);
						console.log(sll.css('width'));
						sll.css('float', 'none');
					}
					else{
						slr.css('display', 'none');
						widthBloc = sl_list.width();
						sll_ct.css('width', row4);
						sll.css('width', widthBloc);
						console.log(sll.css('width'));
						sll.css('float', 'none');
					}
				}
            }
        }
        else {
            sll.css('width', row16);
            sll_ct.css('width', row16);
			slr.css('display', 'block');
            slr.css('width', row4);
            sll.css('float', 'left');
			slr.css('margin-left', row16);
        }
		
    }
	
    $(window).resize(function() {
        slContent();
    });

    slContent();
	
	
    $('#btn_eval_sl').on('click', function(){
        var $this = $(this);
		//var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			comment : $("#sl_evaluation_comment").val(), 
			mark : $("#sl_evaluation_mark").val()
		};
		//loadBlocEdit(bloc_editable);
        $.ajax({
            type: 'POST',
            url: target,
            data: data,
            dataType : 'json',
            success: function(data){
                console.log(data.state);
				if(data.state){
				}
				else{
					alert("une erreur est survenue");
				}
            },
            error: function(jqXHR, textStatus, errorThrown) {
				console.log(jqXHR.status);
				console.log(textStatus);
				console.log(errorThrown);
			}
        });		
    });
	
	
    $('.eval_item').on('click', function(){
        var $this = $(this);
		$(".eval_item").each(function() {
			var item = $(this);
			if(item.data("value") <= $this.data("value")){
				item.css("background", "#2a2");
			}else{
				item.css("background", "#fff");
			}
			$("#sl_evaluation_mark").val($this.data("value"));
		});
    });
	
});
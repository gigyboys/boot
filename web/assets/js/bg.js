
$(function() {
	console.log("bg.css");
	
	var row 	= 60; 		//60
    var row4 	= row*4; 	//
    var row8 	= row*8; 	//
    var row12 	= row*12; 	//
    var row16 	= row*16; 	//960
    var row20 	= row*20; 	//1200
	
    function bgContent(){
        largeur_window = $(window).width();
		var bg_list = $("#bg_list");
		var bgl = $(".bgl");
		var bgr = $(".bgr");

        if(largeur_window<row20){
            if(largeur_window>row12){
				bgr.css('display', 'block');
                widthBloc = bg_list.width()-row4;
                bgl.css('width', widthBloc);
                bgr.css('width', row4);
                bgl.css('float', 'left');
                bgr.css('margin-left', widthBloc);
            }
            else{
				bgr.css('display', 'none');
				widthBloc = bg_list.width();
				bgl.css('width', widthBloc);
				bgl.css('float', 'none');
            }
        }
        else {
            bgl.css('width', row16);
			bgr.css('display', 'block');
            bgr.css('width', row4);
            bgl.css('float', 'left');
			bgr.css('margin-left', row16);
        }
		
    }
	
    $(window).resize(function() {
        bgContent();
    });

    bgContent();
	
	$('.btn_bg_post_new_cmt').on('click', function(){
        var $this = $(this);
        var target = $this.data('target');
		console.log(target);
		var data = {
			message : $("#bg_post_cmt_message").val()
		};
        $.ajax({
            type: 'POST',
            url: target,
            data: data,
            dataType : 'json',
            success: function(data){
                console.log(data.state);
				if(data.state){
					$("#bg_post_list_cmt").append(data.commentItem);
					$("#bg_post_cmt_message").val("");
					$("#info_comment").html(data.infoComment);
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
	
	$('.not_school_post').live('click', function(e){
		var $this = $(this);
        var target = $this.data('target');
		var data = {
		};
        $.ajax({
            type: 'POST',
            url: target,
            data: data,
            dataType : 'json',
            success: function(data){
                console.log(data.state);
				if(data.state){
					$this.remove();
					if($("#btn_add_to_sl .not_school_post").length == 0){
						$("#btn_add_to_sl").remove();
					}
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
	
});
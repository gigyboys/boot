
$(function() {	
	var row 	= 60; 		//60
    var row4 	= row*4; 	//
    var row5 	= row*5; 	//
    var row8 	= row*8; 	//
    var row12 	= row*12; 	//
    var row15 	= row*15; 	//900
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
                widthBloc = bg_list.width()-row5;
                bgl.css('width', widthBloc);
                bgr.css('width', row5);
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
            bgl.css('width', row15);
			bgr.css('display', 'block');
            bgr.css('width', row5);
            bgl.css('float', 'left');
			bgr.css('margin-left', row15);
        }
		
    }
	
    $(window).resize(function() {
        bgContent();
    });

    bgContent();
	
	/*
	* load posts
	*/
	$('#bg_load_post').on('click', function(){
        var $this = $(this);
        var target = $this.attr("data-target");
		
		var data = {
		};
		$("#bg_load_post_action #bg_load_post").hide();
		$("#bg_load_post_action .btn_loading").css("display", "block");
		$.ajax({
			type: 'POST',
			url: target,
			data: data,
			dataType : 'json',
			success: function(data){
				console.log(data.state);
				if(data.state){
					var htmlappend = '';
					for(var i = 0; i <data.posts.length; i++ ){
						var post = data.posts[i];
						htmlappend += post.postItem;
					}
					$("#bg_list_post").append(htmlappend);
					if(data.previousPostId > 0){
						$("#bg_load_post").attr("data-target", data.urlLoadPost);
						$("#bg_load_post").attr("data-previous-post", data.previousPostId);
						
						$("#bg_load_post_action #bg_load_post").css("display", "block");
						$("#bg_load_post_action .btn_loading").hide();
					}else{
						$("#bg_load_post_action").remove();
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
	
	/*
	* load commentItem
	*/
	$('#load_comment').on('click', function(){
        var $this = $(this);
        var target = $this.attr("data-target");
		
		var data = {
		};
		$("#bg_load_comment_action #load_comment").hide();
		$("#bg_load_comment_action .btn_loading").css("display", "block");
		$.ajax({
			type: 'POST',
			url: target,
			data: data,
			dataType : 'json',
			success: function(data){
				console.log(data.state);
				if(data.state){
					var htmlprepend = '';
					for(var i = 0; i <data.comments.length; i++ ){
						var comment = data.comments[i];
						htmlprepend += comment.commentItem;
					}
					$("#bg_post_list_cmt").prepend(htmlprepend);
					if(data.previousCommentId > 0){
						$("#load_comment").attr("data-target", data.urlLoadComment);
						$("#load_comment").attr("data-previous-cmt", data.previousCommentId);
						
						$("#bg_load_comment_action #load_comment").css("display", "block");
						$("#bg_load_comment_action .btn_loading").hide();
					}else{
						$("#bg_load_comment_action").remove();
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
	
	$('.btn_bg_post_new_cmt').on('click', function(){
        var $this = $(this);
        var target = $this.data('target');
		console.log(target);
		if($.trim($("#bg_post_cmt_message").val()) != ""){
			var data = {
				message : $("#bg_post_cmt_message").val()
			};
			$("#bg_add_comment_error").html("");
			$("#bg_add_comment_action .btn_save").hide();
			$("#bg_add_comment_action .btn_loading").css("display", "inline-block");
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
						$("#bg_add_comment_action .btn_save").css("display", "inline-block");
						$("#bg_add_comment_action .btn_loading").hide();
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
		}else{
			var errorHtml = '<div style="color:#d22">Veuillez bien remplir le champ</div>';
			$("#bg_add_comment_error").html(errorHtml);
		}	
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
	
	/*
	*load calendar
	*/
	$('.bg_month_btn').live('click', function(e){
		var $this = $(this);
        var target = $this.data('target');
		var data = {
		};
		
		
		var bg_calendar_height = $("#bg_calendar_ct").height();
		var bg_calendar_width = $("#bg_calendar_ct").width();
		$("#bg_load_calendar").css("height",bg_calendar_height);
		$("#bg_load_calendar").css("width",bg_calendar_width);
		$("#bg_load_calendar").css("display","block");
		$("#bg_load_calendar").css("padding-top",(bg_calendar_height/2) );
		
        $.ajax({
            type: 'POST',
            url: target,
            data: data,
            dataType : 'json',
            success: function(data){
                console.log(data.state);
				if(data.state){
					$("#bg_load_calendar").css("display","none");
					$("#bg_calendar_ct").html(data.calendar);
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
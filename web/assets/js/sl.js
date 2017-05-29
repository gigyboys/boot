
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
		document.title = $(this).data("title");
		history.pushState('', '', $(this).data("link"));
		
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
					sll.css('float', 'left');
					slr.css('margin-left', widthBloc);
				}
				else{
					if(largeur_window>row8){
						slr.css('display', 'none');
						widthBloc = sl_list.width();
						sll_ct.css('width', row8);
						sll.css('width', widthBloc);
						sll.css('float', 'none');
					}
					else{
						slr.css('display', 'none');
						widthBloc = sl_list.width();
						sll_ct.css('width', row4);
						sll.css('width', widthBloc);
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
	
	/*
	* toogle school of the day description
	*/
    $('#sl_oftheday_title').on('click', function(){
        $('#sl_oftheday_desc').toggle();
    });
	
	/*
	* on click button evaluate
	*/
    $('#btn_eval_sl').on('click', function(){
        var $this = $(this);
        var target = $this.data('target');
		if($.trim($("#sl_evaluation_comment").val()) != ""){
			var data = {
				comment : $.trim($("#sl_evaluation_comment").val()), 
				mark : $("#sl_evaluation_mark").val()
			};
			$("#add_evaluation_error").html("");
			$("#add_evaluation_action .btn_save").hide();
			$("#add_evaluation_action .btn_loading").css("display", "inline-block");
			$.ajax({
				type: 'POST',
				url: target,
				data: data,
				dataType : 'json',
				success: function(data){
					if(data.state){
						$("#evaluation_list").prepend(data.evaluationItem);
						$("#sl_evaluation_comment").val(""), 
						$("#evaluation_empty").remove();
						$("#add_evaluation_action .btn_save").css("display", "inline-block");
						$("#add_evaluation_action .btn_loading").hide();
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
			var errorHtml = '<div style="color:#d22">Veuillez bien fournir votre évaluation</div>';
			$("#add_evaluation_error").html(errorHtml);
		}
    });
	
	/*
	* click on evaluation star
	*/
    $('.eval_star_item').on('click', function(){
        var $this = $(this);
		$(".eval_star_item").each(function() {
			var item = $(this);
			if(item.data("value") <= $this.data("value")){
				item.addClass("selected");
			}else{
				item.removeClass("selected");
			}
			$("#sl_evaluation_mark").val($this.data("value"));
		});
    });
	
	//toogleSubscription school
    $('#toggle_subscription').on('click', function(){
        var $this = $(this);
        var target = $this.data('target');
        $.ajax({
            type: 'POST',
            url: target,
            dataType : 'json',
            success: function(data){
				if(data.state){
					if(data.active){
						$(".subscription_btn").hide();
						$(".unsubscription_btn").show();
					}else{
						$(".subscription_btn").show();
						$(".unsubscription_btn").hide();
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
	* Navigation pagination ajax
	*/
    $('.sll_pagination_item').live('click', function(e){
        e.preventDefault(true);
		var $this = $(this);
		//alert($this.attr("href"));
		var target = $this.attr("href");
		var sll_height = $(".sll").height();
		var sll_width = $(".sll").width();
		$("#sll_load_list").css("height",sll_height);
		$("#sll_load_list").css("width",sll_width);
		$("#sll_load_list").css("display","block");
		$("#sll_load_list").css("padding-top",(sll_height/2) - 40);
		
        $.ajax({
            type: 'POST',
            url: target,
            dataType : 'json',
            success: function(data){
				if(data.state){
					$("#sll_load_list").css("display","none");
					var htmlappend = '';
					for(var i = 0; i <data.schools.length; i++ ){
						var school = data.schools[i];
						htmlappend += school.school_view;
					}
					htmlappend += '<div class="both"></div>';
					$(".sll_ct").html(htmlappend);
					$(".sll_pagination").html(data.pagination);
					history.pushState('', 'School - page '+data.page, data.currentUrl);
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
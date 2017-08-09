
$(function() {
	$('body').on('click','.tab_sl_item',function(){
        $('.tab_sl_item').removeClass('selected');
        $(this).addClass('selected');
		var this_id = $(this).attr('id');
		var content = $("#content_"+this_id);
		var content_tab_sl_item = $('.content_tab_sl_item');
		content_tab_sl_item.removeClass('selected').css('display','none');
		
		content.addClass('selected').css('display','block');
		document.title = $(this).data("title");
		history.pushState('', '', $(this).data("link"));
		initTabsl();
		
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
	
	function toggleInfoSchool(){
		var slgl = $( "#sl_gl" );
		if(slgl.length != 0){
			var slglposition = $( "#sl_gl" ).offset().top;
			var scrollTop = $( document ).scrollTop();
			if(slglposition-scrollTop+30 < 0){
				$( "#sl_view_hidden" ).show();
				$( "#navigation" ).css("border-bottom","1px solid #ddd");
				$( "#navigation" ).css("box-shadow","0px 0px 0px #fff");
			}else{
				$( "#sl_view_hidden" ).hide();
				$( "#navigation" ).css("border-bottom","1px solid #888");
				$( "#navigation" ).css("box-shadow","1px 1px 7px #999");
			}
		}
	}
	
    $(window).resize(function() {
        slContent();
    });

    slContent();
	toggleInfoSchool();
	$( window ).scroll(function() {
		toggleInfoSchool();
	});
	
    $(window).resize(function() {
        toggleInfoSchool();
    });
	
	/*
	* toogle school of the day description
	*/
	$('body').on('click','#sl_oftheday_title',function(){
        $('#sl_oftheday_desc').toggle();
    });
	
	/*
	* on click button evaluate
	*/
	$('body').on('click','#btn_eval_sl',function(){
        var $this = $(this);
        var target = $this.data('target');
		if($.trim($("#sl_evaluation_comment").val()) != ""){
			var data = {
				comment : $.trim($("#sl_evaluation_comment").val()), 
				mark : $("#sl_evaluation_mark").val()
			};
			$("#add_evaluation_error").html("");
			//$("#add_evaluation_action .btn_save").hide();
			//$("#add_evaluation_action .btn_loading").css("display", "inline-block");
			var bloc_editable = $this.closest(".bloc_editable");
			loadBlocEdit(bloc_editable);
			$.ajax({
				type: 'POST',
				url: target,
				data: data,
				dataType : 'json',
				success: function(data){
					if(data.state){
						$("#my_evaluation").html(data.myEvaluationItem);
						$("#evaluation_empty").remove();
						/*$("#evaluation_list").prepend(data.evaluationItem);
						$("#sl_evaluation_comment").val(""), 
						$("#evaluation_empty").remove();
						$("#add_evaluation_action .btn_save").css("display", "inline-block");
						$("#add_evaluation_action .btn_loading").hide();*/
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
	$('body').on('click','.eval_star_item',function(){
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
	$('body').on('click','#toggle_subscription',function(){
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
	$('body').on('click','.sll_pagination_item',function(e){
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
	
	//tab sl about
	var content_tab_header_item = $('.content_tab_header_item');
	var content_tab_content_item = $('.content_tab_content_item');
	var content_tab_header_content = $('.content_tab_header_content');
	var content_tab_header_sep_slide = $('.content_tab_header_sep_slide');
	
	content_tab_header_item.live('click', function(e) {
        content_tab_header_item.removeClass('selected');
        $(this).addClass('selected');
		var this_id = $(this).attr('id');
		var content = $("#content_"+this_id);
		content_tab_content_item.removeClass('selected');
		
		content.addClass('selected');
		initTabsl();
    });
	function initTabsl(){
		var content_tab_header_content_selected = $('.content_tab_header_content .selected');
		if(content_tab_header_content_selected.length > 0){
			var decalage = content_tab_header_content_selected.offset().left - content_tab_header_content.offset().left;
			content_tab_header_sep_slide.animate({
				marginLeft: decalage,
				width: $('.content_tab_header_content .selected').outerWidth(true),
				}, 300, function() {
			});
		}
	}	
    initTabsl();
	
});
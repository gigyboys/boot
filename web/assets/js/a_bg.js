
$(function() {
	console.log("a_bg.js");
	
    /*
    *upload illustration for post
    */
    $('#illustrationfile').on('change', function(){
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
                console.log(data.illustration116x116);
				$("#post_illustration").attr("src", data.illustration116x116);
            },
            error: function(jqXHR, textStatus, errorThrown) {
				console.log(jqXHR.status);
				console.log(textStatus);
				console.log(errorThrown);
			}
        });
    });
	
    $('#btn_save_bg_common').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			defaultTitle : bloc_editable.find("#bg_input_defaulttitle").val(),
			slug : bloc_editable.find("#bg_input_slug").val(),
			categoryId : bloc_editable.find("#bg_select_category").val()
		};
		loadBlocEdit(bloc_editable);
        $.ajax({
            type: 'POST',
            url: target,
            data: data,
            dataType : 'json',
            success: function(data){
                console.log(data.state);
				if(data.state){
					bloc_editable.find("#bg_view_defaulttitle").text(data.defaultTitle);
					bloc_editable.find("#bg_view_slug").text(data.slug);
					bloc_editable.find("#bg_view_category").text(data.category);
					resetBlocEdit(bloc_editable);
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
	
    $('.btn_save_bg_trans').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			title : bloc_editable.find(".bgt_input_title").val(), 
			description : bloc_editable.find(".bgt_input_description").val(), 
			content : bloc_editable.find(".bgt_input_content").val()
		};
		loadBlocEdit(bloc_editable);
        $.ajax({
            type: 'POST',
            url: target,
            data: data,
            dataType : 'json',
            success: function(data){
                console.log(data.state);
				if(data.state){
					bloc_editable.find(".bgt_view_title").html(data.title);
					bloc_editable.find(".bgt_view_description").html(data.description);
					bloc_editable.find(".bgt_view_content").html(data.content);
					resetBlocEdit(bloc_editable);
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
	
	
	//tooglePublishState post
    $('#toggle_publishState_post').on('click', function(){
        var $this = $(this);
        var target = $this.data('target');
        $.ajax({
            type: 'POST',
            url: target,
            dataType : 'json',
            success: function(data){
				if(data.state){
					if(data.published){
						$(".publish_btn").hide();
						$(".not_publish_btn").show();
					}else{
						$(".publish_btn").show();
						$(".not_publish_btn").hide();
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
	
	
	//toogleShowAuthor post
    $('#toggle_showAuthorState_post').on('click', function(){
        var $this = $(this);
        var target = $this.data('target');
        $.ajax({
            type: 'POST',
            url: target,
            dataType : 'json',
            success: function(data){
				if(data.state){
					if(data.showAuthor){
						$(".show_author_btn").hide();
						$(".not_show_author_btn").show();
					}else{
						$(".show_author_btn").show();
						$(".not_show_author_btn").hide();
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
	
    $('#btn_save_bgcat_common').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			defaultName : bloc_editable.find("#bgcat_input_defaultname").val(),
			slug : bloc_editable.find("#bgcat_input_slug").val()
		};
		loadBlocEdit(bloc_editable);
        $.ajax({
            type: 'POST',
            url: target,
            data: data,
            dataType : 'json',
            success: function(data){
				if(data.state){
					bloc_editable.find("#bgcat_view_defaultname").text(data.defaultName);
					bloc_editable.find("#bgcat_view_slug").text(data.slug);
					resetBlocEdit(bloc_editable);
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
	
    $('.btn_save_bgcat_trans').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			name : bloc_editable.find(".bgcatt_input_name").val(), 
			description : bloc_editable.find(".bgcatt_input_description").val()
		};
		loadBlocEdit(bloc_editable);
        $.ajax({
            type: 'POST',
            url: target,
            data: data,
            dataType : 'json',
            success: function(data){
                console.log(data.state);
				if(data.state){
					bloc_editable.find(".bgcatt_view_name").html(data.name);
					bloc_editable.find(".bgcatt_view_description").html(data.description);
					resetBlocEdit(bloc_editable);
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
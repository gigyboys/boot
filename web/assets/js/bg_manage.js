
$(function() {	
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
				if(data.state == 1){
					$("#post_illustration").attr("src", data.illustration116x116);
				}else{
					alert("Une erreur est survenue");
				}
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
    $('.toggle_publishState_post').on('click', function(){
        var $this = $(this);
        var target = $this.data('target');
        $.ajax({
            type: 'POST',
            url: target,
            dataType : 'json',
            success: function(data){
				if(data.state){
					if(data.published){
						$this.find(".greenstate").hide();
						$this.find(".redstate").show();
					}else{
						$this.find(".greenstate").show();
						$this.find(".redstate").hide();
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
    $('.toggle_showAuthorState_post').on('click', function(){
        var $this = $(this);
        var target = $this.data('target');
        $.ajax({
            type: 'POST',
            url: target,
            dataType : 'json',
            success: function(data){
				if(data.state){
					if(data.showAuthor){
						$this.find(".greenstate").hide();
						$this.find(".redstate").show();
					}else{
						$this.find(".greenstate").show();
						$this.find(".redstate").hide();
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
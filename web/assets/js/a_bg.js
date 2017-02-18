
$(function() {
	console.log("a_bg.js");
	
    $('#btn_save_bg_common').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			defaultTitle : bloc_editable.find("#bg_input_defaulttitle").val(),
			slug : bloc_editable.find("#bg_input_slug").val()
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
			name : bloc_editable.find(".slt_input_name").val(), 
			shortDescription : bloc_editable.find(".slt_input_shortdescription").val(), 
			description : bloc_editable.find(".slt_input_description").val()
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
					bloc_editable.find(".slt_view_name").html(data.name);
					bloc_editable.find(".slt_view_shortdescription").html(data.shortDescription);
					bloc_editable.find(".slt_view_description").html(data.description);
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
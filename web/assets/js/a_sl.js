
$(function() {
	console.log("a_sl.js");
    $('#btn_save_sl_common').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
        var data = new FormData();
		console.log(target);
        data.append('name', bloc_editable.find("#sl_input_name").val());
        data.append('shortName', bloc_editable.find("#sl_input_shortname").val());
        data.append('slug', bloc_editable.find("#sl_input_slug").val());
		
        $.ajax({
            type: 'POST',
            url: target,
            data: data,
            contentType: false,
            processData: false,
            dataType : 'json',
            success: function(data){
                console.log(data.state);
				if(data.state){
					bloc_editable.find("#sl_view_name").text(data.name);
					bloc_editable.find("#sl_view_shortname").text(data.shortName);
					bloc_editable.find("#sl_view_slug").text(data.slug);
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
	
    $('.btn_save_sl_trans').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
        var data = new FormData();
		console.log(target);
        data.append('name', bloc_editable.find(".slt_input_name").val());
        data.append('shortDescription', bloc_editable.find(".slt_input_shortdescription").val());
        data.append('description', bloc_editable.find(".slt_input_description").val());
		
        $.ajax({
            type: 'POST',
            url: target,
            data: data,
            contentType: false,
            processData: false,
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
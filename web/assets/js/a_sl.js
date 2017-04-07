
$(function() {
	console.log("a_sl.js");
	
    /*
    *upload logo for school
    */
    $('#logofile').on('change', function(){
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
                console.log(data.logo116x116);
				$("#school_logo").attr("src", data.logo116x116);
            },
            error: function(jqXHR, textStatus, errorThrown) {
				console.log(jqXHR.status);
				console.log(textStatus);
				console.log(errorThrown);
			}
        });
    });
	
    $('#btn_save_sl_common').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			name : bloc_editable.find("#sl_input_name").val(), 
			shortName : bloc_editable.find("#sl_input_shortname").val(), 
			slug : bloc_editable.find("#sl_input_slug").val()
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
	
    $('#btn_save_field_common').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			defaultName : bloc_editable.find("#field_input_defaultname").val(),
			slug : bloc_editable.find("#field_input_slug").val()
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
					bloc_editable.find("#field_view_defaultname").text(data.defaultName);
					bloc_editable.find("#field_view_slug").text(data.slug);
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
	
    $('.btn_save_field_trans').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			name : bloc_editable.find(".fieldt_input_name").val(),
			description : bloc_editable.find(".fieldt_input_description").val()
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
					bloc_editable.find(".fieldt_view_name").html(data.name);
					bloc_editable.find(".fieldt_view_description").html(data.description);
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
	
	//delete field
	$('.delete_field').live('click', function() {
		var fieldId = $(this).data("id");
		var fieldDefaultName = $(this).data("defaultname");
		var fieldTarget = $(this).data("target");
		
		var content = "";
		content += '<div style="padding:10px; width:auto; background:#fff; border-radius:3px">';
			content += '<div style="text-align:center;padding:10px 0"> Voulez vous effectuer la suppression du fied "'+fieldDefaultName+'"?</div>';
			content += '<div style="text-align:center">	';
				content += '<span class="button_closable" style="background:#888; border-radius: 3px; cursor:pointer; display:inline-block; margin:auto; padding:5px;margin:5px">	Annuler	</span>';
				content += '<span class="confirm_delete_field button_closable" data-id="'+fieldId+'" data-target="'+fieldTarget+'" style="background:#888; border-radius: 3px; cursor:pointer; display:inline-block; margin:auto; padding:5px;margin:5px">	Confirmer	</span>	';
			content += '</div>';
		content += '</div>';
        
		popup(content, 500, true);
		
    });
	
	//confirm delete field
	$('.confirm_delete_field').live('click', function() {
		var $this = $(this);
		var fieldId = $this.data("id");
        var target = $this.data('target');
		var data = {
			id : fieldId
		};
		var widthLoadDeleteField = $( "#field_"+data.id ).width()-2;
		var heightLoadDeleteField = $( "#field_"+data.id ).height()-2;
		$( "#field_"+data.id ).find(".a_table_cell_id").prepend("<div class=\"load_delete_field\" style=\"position:absolute; text-align:center; height:"+heightLoadDeleteField+"px; width:"+widthLoadDeleteField+"px; background:rgba(255,255,255,0.8)\">Suppression chargement ...</div>");
        
		$.ajax({
            type: 'POST',
            url: target,
            data: data,
            dataType : 'json',
            success: function(data){
                console.log(data.state);
				if(data.state){
					$( "#field_"+data.id ).remove();
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
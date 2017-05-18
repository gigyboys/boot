
$(function() {
	console.log("a_sl.js");
	
	var timeOutIdQuery = 0; 
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
    /*
    *upload cover for school
    */
    $('#coverfile').on('change', function(){
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
				//$("#cover_box").append(data.cover300x100);
				$("#cover_box").html(data.cover300x100);
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
	
	/*
	* save common field
	*/
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
	
	$('#input_sl_search_not_admin').on('keyup', function(ed){
        var $this = $(this);
		var query = $this.val();
		if(ed.which != 38 && ed.which != 40 && ed.which != 13){
			$('#view_result_wrap').show();
			
			$('#view_query').html(query);
			var target = $this.data('target');
			clearTimeout(timeOutIdQuery);
			timeOutIdQuery = setTimeout(function(){
				var data = {
					query: query
				};
				$.ajax({
					type: 'POST',
					url: target,
					data: data,
					dataType : 'json',
					success: function(data){
						if(data.users.length>0){
							var htmlappend = '<div>';
							for(var i = 0; i <data.users.length; i++ ){
								var user = data.users[i];
								//alert(user.username);
								htmlappend += '<div style="background:#ccc; height:1px; width:100%; margin:3px 0"></div>';
								htmlappend += '<div data-id="'+user.id+'" data-target="'+user.urlSetAdmin+'" data-username="'+user.username+'" class="item_user" style="padding:2px; cursor:pointer">';
								htmlappend += '<div style="width:60px;height:60px;background:#ddd;float:left">';
								htmlappend += '<img id="" style="width: 60px; height: 60px" src="'+user.avatar+'" alt="'+user.username+'" />';
								htmlappend += '</div>';
								htmlappend += '<div style="margin-left:65px">';
								htmlappend += user.username+'<br />'+user.name+'<br />'+user.email;
								htmlappend += '</div>';
								htmlappend += '<div style="clear:both"></div>';
								htmlappend += '</div>';
							}
							htmlappend += '</div>';
							$("#view_result").html(htmlappend);
							$("#view_result .item_user").first().addClass("user_selected");
							
							$('#view_result').on('mouseover','.item_user',function(){
								var $this = $(this);
								$("#view_result .item_user").removeClass("user_selected");
								$this.addClass("user_selected");
							});
							
						}else{
							//alert("Aucun resultat");
							var htmlappend = '<div>';
							htmlappend += '<div style="background:#ccc; height:1px; width:100%; margin:3px 0"></div>';
							htmlappend += '<div>Aucun resultat trouvé</div>';
							htmlappend += '</div>';
							$("#view_result").html(htmlappend);
						}
					},
					error: function(jqXHR, textStatus, errorThrown) {
					}
				});
			}, 400);
		}
    });
		
	$(document).keydown(function(ed) {
		var userSelected = $( "#view_result .item_user.user_selected" );
		var indexUserSelected = $( "#view_result .item_user" ).index( userSelected );
		var users = $( "#view_result .item_user" );
		var lengthusers = users.length;
		switch(ed.which) {
			case 38: // up
				var indexPrecUserSelected = indexUserSelected-1;
				if(indexUserSelected == 0){
					indexPrecUserSelected = lengthusers-1
				}
				
				userSelected.removeClass("user_selected");
				$( "#view_result .item_user" ).eq(indexPrecUserSelected).addClass("user_selected");
				ed.preventDefault();
			break;

			case 40: // down
				var indexNextUserSelected = 0;
				if(lengthusers-1>indexUserSelected){
					indexNextUserSelected = indexUserSelected+1;
				}
				
				userSelected.removeClass("user_selected");
				$( "#view_result .item_user" ).eq(indexNextUserSelected).addClass("user_selected");
				ed.preventDefault();
			break;

			case 13: // enter
				if(userSelected.length == 1){
					//alert("id : "+ userSelected.data("id") + " - name : "+userSelected.data("username"));
					setAdmin(userSelected);
					ed.preventDefault();
				}
			break;

			default: return;
		}
		
	});
	
	function setAdmin(element){
		var $this = element;
		//alert("id : "+ $this.data("id") + " - name : "+$this.data("username"));
		$("#view_result").html("");
		$("#view_result_wrap").hide();
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
					$("#a_sl_list_admin").prepend(data.schoolAdminItem);
				}
				else{
					alert("une erreur est survenue");
				}
            },
            error: function(jqXHR, textStatus, errorThrown) {
			}
        });
	}
	
	$('#view_result_wrap').on('click', '.item_user', function(ed){
		var $this = $(this);
		setAdmin($this);
    });
	
	$('.remove_school_admin').live('click', function(ed){
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
				if(data.state){
					$this.closest(".school_admin_item").remove();
				}
				else{
					alert("une erreur est survenue");
				}
            },
            error: function(jqXHR, textStatus, errorThrown) {
			}
        });
    });
	
	
	$(document).click(function() {
		$("#view_result").html("");
		$("#view_result_wrap").hide();
    });
	
	$("#view_result_wrap").live('click', function(e) {
        e.stopPropagation(); 
        return false;      
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
	
	/*
	* save common contact
	*/
    $('#btn_save_sl_contact_common').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			address : bloc_editable.find("#sl_contact_input_address").val(),
			phone : bloc_editable.find("#sl_contact_input_phone").val(),
			website : bloc_editable.find("#sl_contact_input_website").val(),
			longitude : bloc_editable.find("#sl_contact_input_longitude").val(),
			latitude : bloc_editable.find("#sl_contact_input_latitude").val()
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
					bloc_editable.find("#sl_contact_view_address").text(data.address);
					bloc_editable.find("#sl_contact_view_phone").text(data.phone);
					bloc_editable.find("#sl_contact_view_website").text(data.website);
					bloc_editable.find("#sl_contact_view_longitude").text(data.longitude);
					bloc_editable.find("#sl_contact_view_latitude").text(data.latitude);
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
	
	/*
	* save translate contact
	*/
    $('.btn_save_sl_contactt').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			description : bloc_editable.find(".sl_contactt_input_description").val()
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
					bloc_editable.find(".sl_contactt_view_description").html(data.description);
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
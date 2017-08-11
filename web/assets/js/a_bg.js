
$(function() {
	//toogleValidation post
    $('.toggle_validState_post').on('click', function(){
        var $this = $(this);
        var target = $this.data('target');
        $.ajax({
            type: 'POST',
            url: target,
            dataType : 'json',
            success: function(data){
				if(data.state){
					if(data.valid){
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
	
	//toogleDeletion post
    $('.toggle_deleteState_post').on('click', function(){
        var $this = $(this);
        var target = $this.data('target');
        $.ajax({
            type: 'POST',
            url: target,
            dataType : 'json',
            success: function(data){
				if(data.state){
					if(data.deleted){
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
	
	/*
	 *modification category bg common
	 */
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
	
	
	/*
	 *modification category bg translate
	 */
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
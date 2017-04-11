
$(function() {
	console.log("a_fm.js");
	
    $('#btn_save_fm_topic_common').on('click', function(){
        var $this = $(this);
		var bloc_editable = $this.closest(".bloc_editable");
        var target = $this.data('target');
		console.log(target);
		var data = {
			defaultName : bloc_editable.find("#fm_topic_input_defaultname").val(),
			slug : bloc_editable.find("#fm_topic_input_slug").val()
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
					bloc_editable.find("#fm_topic_view_defaultname").text(data.defaultName);
					bloc_editable.find("#fm_topic_view_slug").text(data.slug);
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
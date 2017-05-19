
$(function() {
	console.log("at.js");
	
	$('.btn_at_new_cmt').on('click', function(){
        var $this = $(this);
        var target = $this.data('target');
		if($.trim($("#at_cmt_message").val()) != ""){
			var data = {
				message : $("#at_cmt_message").val()
			};
			$("#at_add_comment_action .btn_save").hide();
			$("#at_add_comment_action .btn_loading").css("display", "inline-block");
			$.ajax({
				type: 'POST',
				url: target,
				data: data,
				dataType : 'json',
				success: function(data){
					console.log(data.state);
					if(data.state){
						$("#at_list_cmt").append(data.commentItem);
						$("#at_cmt_message").val("");
						$("#info_comment").html(data.infoComment);
						$("#at_add_comment_action .btn_save").css("display", "inline-block");
						$("#at_add_comment_action .btn_loading").hide();
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
			alert("Remplissez le champ");
		}	
    });
	
	$('.not_school_advert').live('click', function(e){
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
                console.log(data.state);
				if(data.state){
					$this.remove();
					if($("#btn_add_to_sl .not_school_advert").length == 0){
						$("#btn_add_to_sl").remove();
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
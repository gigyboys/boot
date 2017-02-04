$(function() {
	console.log('header');
	
	var search_entity_item = $('.search_entity_item');
	var search_entity_content = $('.search_entity_content');
	
	search_entity_item.live('click', function(e) {
        search_entity_item.removeClass('selected');
        $(this).addClass('selected');
		
		search_entity_content.css('display','none');
		var content = $("#search_critere_"+$(this).data("entity"));
		content.css('display','block');
		
    });
	
	$('#form_search').submit( function(e){
		e.preventDefault();
		$('#search_submit_button_go').trigger('click');
	});
	
	$( "#search_submit_button_go" ).click(function() {
		var target = $(this).data("target");
		var critere = "";
		var entity = $(".search_entity_item.selected").data("entity");
		var q = "";
		q = $("#q_"+entity).val();
		q = $.trim(q);
		if(q == ""){
			alert("Ne pas laisser le critère de recherche à vide.");
		}else{
			switch (entity) {
				case "sl":
					critere = "entity=school";
					break;
				case "bg":
					critere = "entity=post";
					break;
				case "at":
					critere = "entity=advert";
					break;
			}
			critere = critere+"&q="+q;
			window.location=target+"?"+critere;
		}
	});
});


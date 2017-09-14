function resetBlocEdit(bloc_editable){
	var bloc_view = bloc_editable.find(".bloc_view");
	var bloc_edit = bloc_editable.find(".bloc_edit");
	var btn_edit = bloc_editable.find(".btn_edit");
	var btn_save = bloc_editable.find(".btn_save");
	var btn_reset = bloc_editable.find(".btn_reset");
	var btn_loading = bloc_editable.find(".btn_loading");
	bloc_view.show();
	bloc_edit.hide();
	btn_edit.show();
	btn_save.hide();
	btn_reset.hide();
	btn_loading.hide();
}

function editBlocEdit(bloc_editable){
	var bloc_view = bloc_editable.find(".bloc_view");
	var bloc_edit = bloc_editable.find(".bloc_edit");
	var btn_edit = bloc_editable.find(".btn_edit");
	var btn_save = bloc_editable.find(".btn_save");
	var btn_reset = bloc_editable.find(".btn_reset");
	var btn_loading = bloc_editable.find(".btn_loading");
	bloc_view.hide();
	bloc_edit.show();
	btn_edit.hide();
	btn_save.show();
	btn_reset.show();
	btn_loading.hide();
}

function loadBlocEdit(bloc_editable){
	var bloc_view = bloc_editable.find(".bloc_view");
	var bloc_edit = bloc_editable.find(".bloc_edit");
	var btn_edit = bloc_editable.find(".btn_edit");
	var btn_save = bloc_editable.find(".btn_save");
	var btn_reset = bloc_editable.find(".btn_reset");
	var btn_loading = bloc_editable.find(".btn_loading");
	bloc_view.hide();
	bloc_edit.show();
	btn_edit.hide();
	btn_save.hide();
	btn_reset.hide();
	btn_loading.show();
}

$(function() {
	$('body').on('click','.btn_edit',function(event){
        var $this = $(this);
        var bloc_editable = $this.closest(".bloc_editable");
		editBlocEdit(bloc_editable);
    });
    
	$('body').on('click','.btn_reset',function(event){
        var $this = $(this);
        var bloc_editable = $this.closest(".bloc_editable");
		resetBlocEdit(bloc_editable);
    });
});

$(function() {
    $(window).resize(function() {
        initSpinner();
    });
});

function createSpinner() {
	var spinner = "<div id='spinnerloading'><div><span>Loading...</span></div></div>";
	$( "body" ).prepend( spinner );
	initSpinner();
}

function initSpinner() {
	$("#spinnerloading").css('width',$(window).width());
	$("#spinnerloading").css('height',$(window).height());
	$("#spinnerloading div").css('margin-top',($(window).height() - $("#spinnerloading div").height())/2);
}

function destroySpinner() {
	$( "#spinnerloading" ).remove();
}

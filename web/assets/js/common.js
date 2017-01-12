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
	console.log("common.js");
	
	var btn_edit = $('.btn_edit');
	var btn_reset = $('.btn_reset');
    
    btn_edit.click (function (event){
		//console.log("edit bloc editable");
        var $this = $(this);
        var bloc_editable = $this.closest(".bloc_editable");
		editBlocEdit(bloc_editable);
    });
    
    btn_reset.click (function (event){
		//console.log("reset edit bloc editable");
        var $this = $(this);
        var bloc_editable = $this.closest(".bloc_editable");
		resetBlocEdit(bloc_editable);
    });
	
});

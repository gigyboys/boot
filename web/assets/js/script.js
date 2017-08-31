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


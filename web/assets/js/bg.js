
$(function() {
	console.log("bg.css");
	
	var row 	= 60; 		//60
    var row4 	= row*4; 	//
    var row8 	= row*8; 	//
    var row12 	= row*12; 	//
    var row16 	= row*16; 	//960
    var row20 	= row*20; 	//1200
	
    function bgContent(){
        largeur_window = $(window).width();
		var bg_list = $("#bg_list");
		var bgl = $(".bgl");
		var bgr = $(".bgr");

        if(largeur_window<row20){
            if(largeur_window>row12){
				bgr.css('display', 'block');
                widthBloc = bg_list.width()-row4;
                bgl.css('width', widthBloc);
                bgr.css('width', row4);
                bgl.css('float', 'left');
                bgr.css('margin-left', widthBloc);
            }
            else{
				bgr.css('display', 'none');
				widthBloc = bg_list.width();
				bgl.css('width', widthBloc);
				bgl.css('float', 'none');
            }
        }
        else {
            bgl.css('width', row16);
			bgr.css('display', 'block');
            bgr.css('width', row4);
            bgl.css('float', 'left');
			bgr.css('margin-left', row16);
        }
		
    }
	
    $(window).resize(function() {
        bgContent();
    });

    bgContent();
	
});
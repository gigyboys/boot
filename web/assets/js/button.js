$(function() {
    var menu_deroulant_button = $('.menu_deroulant_button');
    var menu_deroulant_liste = $('.menu_deroulant_liste');
    var link = $('.link');
    
    $(document).click(function() {
        var menu_deroulant = $('.menu_deroulant_liste');
        menu_deroulant.css('display','none');
    });
    
    menu_deroulant_button.live('click', function(e) {
        
        e.stopPropagation(); 
        e.preventDefault(true);
        
        var menu_deroulant = $('.menu_deroulant_liste');
        
        var menu_deroulant_liste_to = $(this).parent().find(".menu_deroulant_liste");
        if(menu_deroulant_liste_to.css('display') == 'none'){
            menu_deroulant.css('display','none');
            menu_deroulant_liste_to.css('display','block').css('margin-left',0);
            var decalage = $(window).width() - menu_deroulant_liste_to.width() - menu_deroulant_liste_to.offset().left - 15; 
            if (decalage < 0){
                menu_deroulant_liste_to.css('margin-left',decalage);
            }
        }
        else{
            menu_deroulant.css('display','none');
            menu_deroulant_liste_to.css('display','none');
        }
    });
    
    menu_deroulant_liste.live('click', function(e) {
        e.stopPropagation(); 
        return false;      
    });
    
    link.click(function(e) {
        window.location=$(this).attr("href");
    });    
    
});
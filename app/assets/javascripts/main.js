var menuTimer;

function showMenu() {
    window.clearInterval( menuTimer );
    $("#hidden_menu").show('slide', {direction:"right"});
}

function startHideMenuTimer() {
    window.clearInterval( menuTimer );
    menuTimer = setInterval( function() {
            $("#hidden_menu").hide('slide', {direction:"right"});
    }, 1000 );
}

function setupGallery() {
    $(".galleryimage").click(function( e ) {
        $(".overlay").show();
        $("#overlay_image").attr("src", $(e.target).attr("src") );
    })

    $(".overlay").click(function() {
        $(".overlay").hide();
    })
}

$(document).ready(function() {
    showMenu();
    startHideMenuTimer();

    $("#header").hover(function() {
        showMenu();
    }, function() {
        startHideMenuTimer();
    });
    setupGallery();
});

$(document).on('page:change',  function() {
  $('pre code').each(function(i, e) {hljs.highlightBlock(e)});
});
$(document).on('page:restore', function() {
  $('pre code').each(function(i, e) {hljs.highlightBlock(e)});
});

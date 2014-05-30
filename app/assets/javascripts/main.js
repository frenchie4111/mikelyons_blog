function setupGallery() {
    $(".galleryimage").click(function( e ) {
        $(".overlay").show();
        $("#overlay_image").attr("src", $(e.target).attr("src") );
    })

    $(".overlay").click(function() {
        $(".overlay").hide();
    })
}

function changeColor() {
    // $("body").addClass("color1");
}

$(document).ready(function() {
    setupGallery();
    changeColor();
});

$(document).on('page:change',  function() {
  $('pre code').each(function(i, e) {hljs.highlightBlock(e)});
});
$(document).on('page:restore', function() {
  $('pre code').each(function(i, e) {hljs.highlightBlock(e)});
});

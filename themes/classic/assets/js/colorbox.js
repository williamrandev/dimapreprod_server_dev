$(document).ready(function() {
    if (typeof $.colorbox === 'function') {
        $(".inline").colorbox({
            inline: true,
            width: '80%'
        });
    } else {
        console.warn("Colorbox n'est pas chargé !");
    }
});

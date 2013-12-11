$(document).on("ready", function () {
    $("section#content-wrapper select").chosen();
    var menu = $("ul#top-menu");
    var buscador = $("input#buscador");
    seleccionInicial();

    function seleccionInicial() {
        menu.find("li a").each(function () {
            if (document.title == $(this).text()) {
                $(this).addClass("active");
            }
        });
    }

    buscador.focus(function () {
        $(this).val("");
    });
    buscador.focusout(function () {
        $(this).val("Buscador de Peliculas");
    });

    $("#selectCategory").change(function () {
        $("#movieDataList").fadeOut(2000);
    });

    menu.delegate("li a", "click", function () {
        menu.find("li a").removeClass("active");
        $(this).addClass("active");
    });

});
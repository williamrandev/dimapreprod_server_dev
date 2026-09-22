$(document).ready(function () {	
    $(' .schema .les_boutons button').mouseover(function () {
        // on cherche la donné qui correspond 'data-sort-by'
		//	Modified ai-dev, CMS doesn't accept data-sort-by
		var sortClass = '.' + $.trim($(this).attr('class').replace('pulse', '').replace('active_img', '').replace('active', '').replace('last', ''));
        //var sortClass = '.' + $(this).attr('data-sort-by');
        // on charge l'élement qui porte la donnée correspondante et on lui applique un style //
        $(this).load(sortClass).fadeIn('normal').css({color: '#ffffff', 'background-color': '#2765ad'});
        // on cherche les élements parents qui ont la classe active et on leur enlève ainsi que leur style //
        $(this).parent().find('button.active').removeClass('active').removeAttr("style");
        // on ajoute la classe active//
        $(this).addClass("active");

        // on vérifie, si l'élement a la classe active_img alors on lui applique un style sinon les autres élémpents sont un style différents
        if ($(sortClass).hasClass('active_img')) {
            $(sortClass).css({opacity: '1', transition: '0.5s', animation:' pulse 2s infinite'});
            $(sortClass).hasClass('.pulse').css({opacity: '1', transition: '0.5s', animation:' pulse 2s infinite'});
        } else {
            $(' .schema img#stade').not('active_img').css({opacity: '0.3', transition: '0.5s'});
            $(' .schema img.hover').css({opacity: '0.5', transition: '0.5s', '-webkit-filter': 'opacity(1) drop-shadow(2px 2px 2px white)' ,filter: 'opacity(1) drop-shadow(2px 2px 2px white)', '-ms-filter':'opacity(1)'});
            $(' .schema div.txt').not('active_img').css({opacity: '0', transition: '0.5s'});
            $(' .schema span.pulse').css({opacity:'0.3', transition : '0.5s', animation:'pulse 2s infinite'});


        }
        // on charge l'élement de sortClass et on l'affiche avec du style
        $(sortClass).load(sortClass).fadeIn('400').css({opacity: '1'});
        // on cherche les élements parents qui ont la classe active et on leur enlève avec de l'animation  //
        //$(sortClass).parent().find(' img.active_img, div.active_img').removeClass('active_img').fadeIn('200').animate({opacity: '0.3'}, "200");
        $('txt').removeClass('active_img');
        // on ajoute la classe active_img //
        $(sortClass).addClass("active_img");
        $(sortClass).filter('.schema img').fadeIn('200').css({transform:'scaleX(1.4) scaleY(1.4) ', transition: '0.5s', '-webkit-filter': 'none' ,filter: 'none', '-ms-filter': 'none'});

    }).mouseout(function () {
		//	Modified ai-dev, CMS doesn't accept data-sort-by
		var sortClass = '.' + $.trim($(this).attr('class').replace('pulse', '').replace('active_img', '').replace('active', '').replace('last', ''));
		console.log('out : ' + sortClass);
        //var sortClass = '.' + $(this).attr('data-sort-by');
        // on affiche la classe active sur le bouton en hover //
        $(this).load(sortClass).fadeIn('normal');
        $(this).parent().find('button.active').removeClass('active').css({
            color: '#ffffff',
            'background-color': '#b7b7b7'
        });
        $(this).addClass("active");

        if ($(this).hasClass('active')) {
            $(this).removeClass('active')
        }

        if ($(sortClass).hasClass('active_img')) {
            $(sortClass).removeClass('active_img');
            $(' .schema div.txt').css({opacity: '0', transition: '0.5'});
            $('.schema img').css({opacity: '1', transition: '0.5s', transform:'scaleX(1) scaleY(1)', '-webkit-filter': 'none' ,filter: 'none', '-ms-filter':'none'});
            $('.schema img#stade').css({opacity: '1', transition: '0.5'});
            $(' .schema span.pulse').css({opacity:'1', transition : '0.5', animation:'pulse 2s infinite '})
        }
    });
});

$(document).ready(function () {
    var bool = 0;

    $('.schema span.pulse').click(function () {
        if (bool == 0) {
			//	Modified ai-dev, CMS doesn't accept data-sort-by
			var sortClass = '.' + $.trim($(this).attr('class').replace('pulse', '').replace('active_img', '').replace('active', '').replace('last', ''));
			//var sortClass = '.' + $(this).attr('data-sort-by');

            if ($(this).not('active_pulse')) {
                $(' .schema span.pulse').css({opacity: '0.3'});
                $(' .schema img#stade').css({opacity: '1', transition: '0.5'});
                $(' .schema img').css({opacity: '0.3', transition: '0.2s', transform:'scaleX(1) scaleY(1)', '-webkit-filter': 'opacity(1) drop-shadow(2px 2px 2px white)' ,filter: 'opacity(1) drop-shadow(2px 2px 2px white)', '-ms-filter':'opacity(1)'});
                $(' .schema img.hover').css({opacity: '0.5', transition: '0.2s', transform:'scaleX(1) scaleY(1)'});
                $(' .schema div.txt').not('.active_img').css({opacity: '0', transition: '0.5s','pointer-events':'none'});
                $(' button').not('active').css({'background-color': '#b7b7b7' })
            }
            if ($(this).hasClass('active_pulse')) {
                $(this).removeClass('active_pulse');
                $(' .schema span.pulse').css({opacity: '0.3'});
                $(' .schema img#stade').css({opacity: '0.3', transition: '0.5'});
                $(' .schema img.active_img, div.active_img').removeClass('active_img').css({opacity:'1', transition:'0.5s','pointer-events':'none', transform:'scaleX(1) scaleY(1)'});
                $(' button.active').css({'background-color': '#2765ad' })
            }



            $(this).load(sortClass);
            // on cherche les élements parents qui ont la classe active et on leur enlève ainsi que leur style //
            $(this).parent().find(' span.active_pulse').removeClass('active_pulse');
            // on ajoute la classe active//
            $(this).toggleClass("active_pulse");

            if ($('.schema span.active_pulse').hasClass('courir')) {
                $(' .schema span.courir').addClass('active_pulse');
            }
            if ($('.schema span.active_pulse').hasClass('lancer')) {
                $(' .schema span.lancer').addClass('active_pulse')
            }
            if ($('.schema span.active_pulse').hasClass('environement')) {
                $(' .schema span.environement').addClass('active_pulse')
            }

            // on vérifie, si l'élement a la classe active_img alors on lui applique un style sinon les autres élémpents sont un style différents

            // on charge l'élement de sortClass et on l'affiche avec du style
            $(sortClass).load(sortClass).fadeIn('400').css({opacity: '1'});
            // on cherche les élements parents qui ont la classe active et on leur enlève avec de l'animation  //
            $(sortClass).parent().find(' img.active_img, .txt.active_img').removeClass('active_img').fadeIn('200').animate({opacity: '0.3'}, "400");
            // on ajoute la classe active_img //
            $(sortClass).filter('.schema img.hover, .schema div.txt').css({'pointer-events':'auto'}).toggleClass("active_img");
            $(sortClass).filter('.schema img.hover').css({transform:'scaleX(1.4) scaleY(1.4)', '-webkit-filter': 'none' ,filter: 'none', '-ms-filter': 'none'});

            if ($(sortClass).hasClass('environement')) {
                $(' button.environement ').fadeIn('normal').css({
                    color: '#ffffff',
                    'background-color': '#2765ad',
                    transition: '0.5'
                });
                // on cherche les élements parents qui ont la classe active et on leur enlève ainsi que leur style //
                $(' button.environement ').parent().find('button.active').removeClass('active').removeAttr('style');
                // on ajoute la classe active//
                $(' button.environement ').addClass("active");
                $(sortClass).css({opacity: '1', transition: '0.5s'});

            }
            if ($(sortClass).hasClass('courir')) {
                $(' button.courir ').fadeIn('normal').css({
                    color: '#ffffff',
                    'background-color': '#2765ad',
                    transition: '0.5'
                });
                // on cherche les élements parents qui ont la classe active et on leur enlève ainsi que leur style //
                $(' button.courir ').parent().find('button.active').removeClass('active').removeAttr('style');
                // on ajoute la classe active//
                $(' button.courir ').addClass("active");
                $(sortClass).css({opacity: '1', transition: '0.5s'});

            }
            if ($(sortClass).hasClass('hauteur')) {
                $(' button.hauteur ').fadeIn('normal').css({
                    color: '#ffffff',
                    'background-color': '#2765ad',
                    transition: '0.5'
                });
                // on cherche les élements parents qui ont la classe active et on leur enlève ainsi que leur style //
                $(' button.hauteur ').parent().find('button.active').removeClass('active').removeAttr('style');
                // on ajoute la classe active//
                $(' button.hauteur ').addClass("active");
                $(sortClass).css({opacity: '1', transition: '0.5s'});
            }
            if ($(sortClass).hasClass('longueur')) {
                $(' button.longueur ').fadeIn('normal').css({
                    color: '#ffffff',
                    'background-color': '#2765ad',
                    transition: '0.5'
                });
                // on cherche les élements parents qui ont la classe active et on leur enlève ainsi que leur style //
                $(' button.longueur ').parent().find('button.active').removeClass('active').removeAttr('style');
                // on ajoute la classe active//
                $(' button.longueur ').addClass("active");
                $(sortClass).css({opacity: '1', transition: '0.5s'});
            }
            if ($(sortClass).hasClass('lancer')) {
                $(' button.lancer ').fadeIn('normal').css({
                    color: '#ffffff',
                    'background-color': '#2765ad',
                    transition: '0.5'
                });
                // on cherche les élements parents qui ont la classe active et on leur enlève ainsi que leur style //
                $(' button.lancer ').parent().find('button.active').removeClass('active').removeAttr('style');
                // on ajoute la classe active//
                $(' button.lancer ').addClass("active");
                $(sortClass).css({opacity: '1', transition: '0.5s'});
            }
            if ($(sortClass).hasClass('perche')) {
                $(' button.perche ').fadeIn('normal').css({
                    color: '#ffffff',
                    'background-color': '#2765ad',
                    transition: '0.5'
                });
                // on cherche les élements parents qui ont la classe active et on leur enlève ainsi que leur style //
                $(' button.perche ').parent().find('button.active').removeClass('active').removeAttr('style');
                // on ajoute la classe active//
                $(' button.perche ').addClass("active");
                $(sortClass).css({opacity: '1', transition: '0.5s'});
            }


            var active = $('.active_pulse');
            $(document.body).click(function (e) {

                // Si ce n'est pas l'élément qui a la classe active ni un de ses enfants
                if (!$(e.target).is(active) && !$.contains(active[0], e.target)) {

                    if ($(active).hasClass('active_pulse')) {
                        $(active).removeClass('active_pulse');
                        $(' button').css({'background-color': '#b7b7b7'});
                        $(' .schema span.pulse').removeAttr('style');
                        bool = 0
                    }

                    if ($(sortClass).hasClass('active_img')) {
                        $(sortClass).removeClass('active_img');
                        $(' .schema div.txt').not('.active_img').css({opacity: '0', transition: '0.5s'});
                        $('.schema img').not('.active_img').css({opacity: '1', transition: '0.5s', transform:'scaleX(1) scaleY(1)', '-webkit-filter': 'none' ,filter: 'none', '-ms-filter':'none'});
                        $(' .schema img#stade').css({opacity: '1', transition: '0.5s'});
                        bool = 0
                    }
                }
            });



            bool = 1;

        } else {
            bool = 1;

            if ($(this).not('active_pulse')) {
                $(' .schema span.pulse').css({opacity: '0.3'});
                $(' .schema img#stade').css({opacity: '1', transition: '0.5'});
                $(' .schema img').css({opacity: '1', transition: '0.2s', '-webkit-filter': 'none' ,filter: 'none', '-ms-filter': 'none'});
                $(' .schema div.txt').css({opacity: '0', transition: '0.5s','pointer-events':'none', transform:'scaleX(1) scaleY(1)'});
                $(' button').not('active').css({'background-color': '#b7b7b7' });
            }
            if ($(this).hasClass('active_pulse')) {
                $(this).removeClass('active_pulse');
                $(' .schema span.pulse').css({opacity: '1'});
                $(' .schema img#stade').css({opacity: '1', transition: '0.5'});
                $(' .schema div.active_img').removeClass('active_img').css({opacity:'0', transition:'0.5s', 'pointer-events':'none', transform:'scaleX(1) scaleY(1)'});
                $(' .schema img.active_img').removeClass('active_img').css({opacity:'1', transition:'0.5s', 'pointer-events':'none', transform:'scaleX(1) scaleY(1)', '-webkit-filter': 'none' ,filter: 'none', '-ms-filter': 'none'});
                $(' button.active').removeClass('active').css({'background-color': '#b7b7b7' });
                bool = 1;
            }


            bool = 0;
        }
    })
});

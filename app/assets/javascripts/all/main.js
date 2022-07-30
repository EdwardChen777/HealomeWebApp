/**
*
* -----------------------------------------------------------------------------
*
* Template : Vsaasi - Creative HTML5 Template for Saas, Startup & Agency
* Author : pi-theme
* Author URI : https://pi-theme.com/ 

* -----------------------------------------------------------------------------
*
**/

(function($) {
    "use strict";

    // pisticky Menu
    var header = $('.pi-header');
    var win = $(window);
    win.on('scroll', function() {
        var scroll = win.scrollTop();
        if (scroll < 100) {
           header.removeClass("pi-sticky");
        } else {
           header.addClass("pi-sticky");
        }
    });

    //Menu Code Here
    $("#jkmenu").jkResponsiveMenu({
        resizeWidth: '991', 
        animationSpeed: 'medium', 
        accoridonExpAll: false 
    });



    //Menu Active Here
    var path = window.location.href; 
    $('.jk-menus li a').each(function() {
        if (this.href === path) {
            $(this).addClass('pi-current-page');
        }
    });


    //Load More
    $(".pi-blogs li").slice(0, 8).show();
    $("#pi-load").on("click", function(e){
        e.preventDefault();
        $(".pi-blogs li:hidden").slice(0, 8).slideDown(1000);
        if($(".pi-blogs li:hidden").length == 0) {
            $("#pi-load").text("No Content").addClass("nocontent");
        }
    });

    // Sticky Sidebar
    var contentsticky = $('.pi-content-sticky');
    if(contentsticky.length) {
        $('.pi-content-sticky, .pi-sidebar-sticky').theiaStickySidebar({
            additionalMarginTop: 140,
            additionalMarginBottom: 20,
        });
    }

    // wow init
    new WOW().init({
        offset: 0,
    });

    // AOS init
    AOS.init();


    //Taggle Js
    $('#menu-btn').on('click', function(e) {
        $(this).toggleClass("pi__close");
        e.preventDefault();
    });

    //Video PopUp 
    var popup = $('.pi-popup-video');
    if(popup.length) {
        $('.pi-popup-video').magnificPopup({
            disableOn: 10,
            type: 'iframe',
            mainClass: 'mfp-fade',
            removalDelay: 160,
            preloader: false,
            fixedContentPos: false
        }); 
    }

    //onclick js
    $(".pi-anu").on('click', function(){
        $(this).addClass('pi-active');
    });     
    $(".pi-mon").on('click', function () {
        $('.pi-anu').removeClass('pi-active');
    });    

    $(".pi-mon").on('click', function(){
        $(this).addClass('pi-actives');
    });     
    $(".pi-anu").on('click', function () {
        $('.pi-mon').removeClass('pi-actives');
    });

    // Acc js
    $('.pi-tab-gird .menu div').on("click", function() {
        var numberIndex = $(this).index();
        if (!$(this).is("active")) {
            $(".pi-tab-gird .menu div").removeClass("active");
            $(".pi-tab-gird ul li").removeClass("active");
            $(this).addClass("active");            
            $(".pi-tab-gird ul").find("li:eq(" + numberIndex + ")").addClass("active");
            var listItemHeight = $(".pi-tab-gird ul")
                .find("li:eq(" + numberIndex + ")")
                .innerHeight();
            $(".pi-tab-gird ul").height(listItemHeight + "px");
        }
    });
    

    //parallax js
    if ($('.layer1').length) {
	    var layer1 = document.getElementById('layer1');
	    var parallax = new Parallax(layer1);
	}

	if ($('.layer2').length) {
	    var layer2 = document.getElementById('layer2');
	    var parallax = new Parallax(layer2);
	}

	if ($('.layer3').length) {
	    var layer3 = document.getElementById('layer3');
	    var parallax = new Parallax(layer3);
	}

	if ($('.layer4').length) {
	    var layer4 = document.getElementById('layer4');
	    var parallax = new Parallax(layer4);
	}

    if ($('.layer5').length) {
        var layer5 = document.getElementById('layer5');
        var parallax = new Parallax(layer5);
    }

    if ($('.layer6').length) {
        var layer6 = document.getElementById('layer6');
        var parallax = new Parallax(layer6);
    }
    if ($('.layer7').length) {
        var layer7 = document.getElementById('layer7');
        var parallax = new Parallax(layer7);
    }    
    if ($('.layer8').length) {
        var layer8 = document.getElementById('layer8');
        var parallax = new Parallax(layer8);
    }

    //Clients Slider
    if ($('.pi-clients-slider').length) {
        $('.pi-clients-slider').slick({
            dots: true,
            infinite: false,
            speed: 500,
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: false,
            autoplaySpeed: 2000,
            arrows: false,
            responsive: [
            {
                breakpoint: 991,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
               breakpoint: 400,
                settings: {
                    arrows: false,
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
            ]
        });
    }

    //Blogs Slider
    if ($('.pi-blog-slider').length) {
        $('.pi-blog-slider').slick({
            dots: false,
            infinite: false,
            speed: 500,
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: false,
            autoplaySpeed: 2000,
            arrows: false,
            responsive: [
            {
                breakpoint: 991,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
               breakpoint: 400,
                settings: {
                    arrows: false,
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
            ]
        });
    }


    //preloader
    $(window).on( 'load', function() {
        $("#pi__preloader").delay(1000).fadeOut(400);
        $("#pi__preloader").delay(1000).fadeOut(400);
    })

    //UX Slider
    if ($('.pi-ux-slider').length) {
        $('.pi-ux-slider').slick({
            dots: false,
            infinite: false,
            speed: 500,
            slidesToShow: 2,
            slidesToScroll: 1,
            autoplay: false,
            autoplaySpeed: 2000,
            arrows: true,
            responsive: [
            {
                breakpoint: 991,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
               breakpoint: 400,
                settings: {
                    arrows: false,
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
            ]
        });
    }
  
    //filter js
    var pifilter = $('.pi-grid');
    if(pifilter.length){
        $('.pi-grid').imagesLoaded(function() {
            $('.pi-filter').on('click', 'button', function() {
                var filterValue = $(this).attr('data-filter');
                $grid.isotope({
                    filter: filterValue
                });
            });
            var $grid = $('.pi-grid').isotope({
                itemSelector: '.grid-item',
                percentPosition: true,
                masonry: {
                    columnWidth: '.grid-item',
                }
            });
        });
    }   
        
    // Isotop Filter
    if ($('.pi-filter button').length) {
        var projectfiler = $('.pi-filter button');
            if(projectfiler.length){
            $('.pi-filter button').on('click', function(event) {
                $(this).siblings('.active').removeClass('active');
                $(this).addClass('active');
                event.preventDefault();
            });
        }
    }


    // Paroller Js
    if ($('.pi__shape_bg1').length) {
        $('.pi__shape_bg1').paroller();
    }
    if ($('.pi__shape_bg2').length) {
        $('.pi__shape_bg2').paroller();
    }    
    if ($('.pi__shape_bg3').length) {
        $('.pi__shape_bg3').paroller();
    }    
    if ($('.pi__shape_bg4').length) {
        $('.pi__shape_bg4').paroller();
    }    
    if ($('.pi__shape_bg5').length) {
        $('.pi__shape_bg5').paroller();
    }    
    if ($('.pi__shape_bg6').length) {
        $('.pi__shape_bg6').paroller();
    }   
    if ($('.pi__shape_bg7').length) {
        $('.pi__shape_bg7').paroller();
    }
    if ($('.pi__shape_bg8').length) {
        $('.pi__shape_bg8').paroller();
    }
    if ($('.pi__shape_bg9').length) {
        $('.pi__shape_bg9').paroller();
    }    
    if ($('.pi__shape_bg10').length) {
        $('.pi__shape_bg10').paroller();
    }    
    if ($('.pi__shape_bg11').length) {
        $('.pi__shape_bg11').paroller();
    }
    
    //Price table js
    checkScrolling($('.pricing-body'));
        $(window).on('resize', function(){
        window.requestAnimationFrame(function(){checkScrolling($('.pricing-body'))});
    });

    $('.pricing-body').on('scroll', function(){ 
        var selected = $(this);
        window.requestAnimationFrame(function(){checkScrolling(selected)});
    });

    function checkScrolling(tables){
        tables.each(function(){
            var table= $(this),
            totalTableWidth = parseInt(table.children('.pricing-features').width()),
            tableViewport = parseInt(table.width());
            if( table.scrollLeft() >= totalTableWidth - tableViewport -1 ) {
                table.parent('li').addClass('is-ended');
            } else {
                table.parent('li').removeClass('is-ended');
            }
        });
    }

    bouncy_filter($('.pi-pricing'));

    function bouncy_filter(container) {
        container.each(function(){
            var pricing_table = $(this);
            var filter_list_container = pricing_table.children('.pricing-switcher'),
            filter_radios = filter_list_container.find('input[type="radio"]'),
            pricing_table_wrapper = pricing_table.find('.pricing-wrapper');
            var table_elements = {};

            filter_radios.each(function(){
                var filter_type = $(this).val();
                table_elements[filter_type] = pricing_table_wrapper.find('li[data-type="'+filter_type+'"]');
            });

            filter_radios.on('change', function(event){
                event.preventDefault();
                var selected_filter = $(event.target).val();
                show_selected_items(table_elements[selected_filter]);
                
                if( !Modernizr.cssanimations ) {
                    hide_not_selected_items(table_elements, selected_filter);
                    pricing_table_wrapper.removeClass('is-switched');
                } else {
                    pricing_table_wrapper.addClass('is-switched').eq(0).one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function() {    
                    hide_not_selected_items(table_elements, selected_filter);
                    pricing_table_wrapper.removeClass('is-switched');
                    //change rotation direction if .pricing-list has the .bounce-invert class
                    if(pricing_table.find('.pricing-list').hasClass('bounce-invert')) pricing_table_wrapper.toggleClass('reverse-animation');
                    });
                }
            });
        });
    }
    
    function show_selected_items(selected_elements) {
        selected_elements.addClass('is-selected');
    }

    function hide_not_selected_items(table_containers, filter) {
        $.each(table_containers, function(key, value){
            if ( key != filter ) {  
                $(this).removeClass('is-visible is-selected').addClass('is-hidden');
            } else {
                $(this).addClass('is-visible').removeClass('is-hidden is-selected');
            }
        });
    }

    // scrollTop init
    var pitotop = $('#piscrollUp'); 
    if(pitotop.length){   
        win.on('scroll', function() {
            if (win.scrollTop() > 350) {
                pitotop.fadeIn();
            } else {
                pitotop.fadeOut();
            }
        });
        pitotop.on('click', function() {
            $("html,body").animate({
                scrollTop: 0
            }, 500)
        });
    }

})(jQuery);

	
	jQuery(document).ready(function($) {
	"use strict";
	$("a.fancy,a.iframe").fancybox({
	'titleShow'     : false,
	'showCloseButton': true,
	'overlayShow' : true
	});
var sticky_navigation_offset_top = $('#header').offset().top;
var sticky_navigation = function(){
var scroll_top = $(window).scrollTop();
if(scroll_top>sticky_navigation_offset_top){ 
/*jshint smarttabs: true */
$('#header').removeClass('bg');
$('#header').addClass('scroll');
$("link#menu-b").attr("href",'css/menu-b.css');
}else{
$('#header').removeClass('scroll');
$('#header').addClass('bg');
$("link#menu-b").attr("href",' ');
}
};
sticky_navigation();
$(window).scroll(function(){
sticky_navigation();
});

var sticky_option = $('#demopanel').offset().top;
/*jshint smarttabs: true */
	// our function that decides weather the navigation bar should have "fixed" css position or not.
	 var sticky_opt = function(){
		var scroll = $(window).scrollTop(); // our current vertical position from the top
		
		// if we've scrolled more than the navigation, change its position to fixed to stick to top, otherwise change it back to relative
		if (scroll> sticky_option){ 
			
			$('#demopanel').css('position','fixed');
			$('#demopanel').css('top','105px');

		}else{
		
			$('#demopanel').css('position','absolute');
			$('#demopanel').css('top','190px');
			
		}};

	// run our function on load
	sticky_opt();
	// and run it again every time you scroll
	$(window).scroll(function() {
		sticky_opt();

	});		

	//tabs 
	$("ul.tabs").tabs("div.panes > div");

		//accordion
		 $(".accordion").tabs(
				".accordion div.pane",
			{tabs: 'a', effect: 'slide', initialIndex:0}
			);
		
		//accordion
		 $("div.toggle").tabs(
				"div.toggle div.pane",
			{tabs: 'h5', effect: 'slide', initialIndex: 1}
			);
		
		
		
		
		
		//menu call		
		$('ul.sf-menu li a').hover(function(){
		
				$(this).addClass('active-b');
				
			},function(){
		
				$(this).removeClass('active-b');
		
		});
		
		
		
				// TinyNav.js 1
	$('.sf-menu').tinyNav();
	
		
		$('ul.sf-menu').superfish({
			delay : 200,
			autoArrows :false,
			speed:         'normal', 
			disableHI:     false
		});
		

		


/* Tabs */

$(".tab_content").hide(); //Hide all content
$("ul.tabs li:first").addClass("active").show(); //Activate first tab

$(".tab_content").filter(':first').show(); //Show first tab content


$("ul.tabs li").click(function() {

	$("ul.tabs li").removeClass("active"); //Remove any "active" class
	$(this).addClass("active"); //Add "active" class to selected tab
	$(".tab_content").hide(); //Hide all tab content

	var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
	$(activeTab).fadeIn(); //Fade in the active ID content
	return false;
});
		
		
		
/*toogle*/

$(".toggle_container").hide(); 

$(".toggle_trigger").click(function(){
	$(this).toggleClass("toggle_active").next().slideToggle("fast");
	return false;
});
		
		
		//auto clear for  input box

		$('.autoclear').click(
		function() {
		if ( this.value === this.defaultValue ) {
		this.value = '';
		} 
		});
		
		$('.autoclear').blur(
		function() {
		if (this.value === '') {
		this.value = this.defaultValue;
		}
		}
		);



/*
quick sand jquery 
-----------------------------------*/

// Custom sorting plugin
	// bind radiobuttons in the form
	var $filterType = jQuery('#filter a');
	// get the first collection
	var $list = jQuery('#portfolio-sorting');
	// clone applications to get a second collection
	var $data = $list.clone();
	jQuery('#filter>a:first-child').addClass('current_link');
	$filterType.click(function() {
			var $sortedData;
		if (jQuery(this).attr('class') === 'every') {
		  $sortedData = $data.find('li');
		} else {
			$sortedData = $data.find('.'+ jQuery(this).attr('class'));
		}	
		jQuery('#filter a').removeClass('current_link');
		jQuery(this).addClass('current_link');
			
		$list.quicksand($sortedData, {
		  attribute: 'id',
		  duration: 800,
		  easing: 'easeInOutQuad',
		  useScaling: 'false',
		   adjustHeight: 'auto'
		   },function(){
				$('.da-thumbs > li >div.main').each( function() { $(this).hoverdir(); } );

		   });

		   return false;

		});
		
				
		
		
		
	
		
		
/*
color Picker 
------------------------*/

$('#back').click(function(){
	if($(this).is(":checked")){
	
	$('body').css('background','none');
	$('.inner-heading h1').css('background','#fff');
	

	}
	
	else{
	$('body').css('background-image','url("./img/bg.png")');
	$('.inner-heading h1').css('background-image','url("./img/bg.png")');
	
	}
	
});
		


$('#colorSelector').ColorPicker({
		onShow: function (colpkr) {
			$(colpkr).fadeIn(500);
			return false;
		},
		onHide: function (colpkr) {
/*jshint smarttabs: true */		
			$(colpkr).fadeOut(500);
			return false;
		},
		onChange: function (hsb,hex) {
/*jshint bitwise: false*/		 
		var hexStr = '#'+hex;  // 190 ie bebebe
		var hex1 = parseInt(hexStr.substring(1), 16);
		var r = (hex1 & 0xff0000) >> 16;
		var g = (hex1 & 0x00ff00) >> 8;
		var b = hex & 0x0000ff;
		
	$("head").append("<style type=\"text/css\" charset=\"utf-8\" class='color-pick'>#header.bg,.sort a.current_link{background-color:#"+hex+";}.service-block:hover{background-color:#"+hex+"}section.social ul li a.facebook:hover{background:#"+hex+";}section.social ul li a.twitter:hover{background:#"+hex+";}section.social ul li a.google-plus:hover{background:#"+hex+";}.flex control-paging li a.flex-active{background:#"+hex+";}.da-thumbs li .main div{background-color:rgba("+r+","+g+","+b+",0.7);}.recent-blog .containt:hover{background-color:#"+hex+";}.flex-control-paging li a.flex-active{background-color:#"+hex+";}.flex-control-paging li a:hover{background-color:#"+hex+";}#bx-pager{border-top:2px solid #"+hex+";}#bx-pager a.active:before{border-top-color:#"+hex+";}.bx-wrapper .bx-prev:hover{background-color:#"+hex+"}.bx-wrapper .bx-next:hover{background-color:#"+hex+"}#footer .footer-widget ul.list li a:before{background-color:#"+hex+";}#footer .footer-widget ul.list li a:hover:before{background-color:#"+hex+";color:#"+hex+";}#footer .footer-widget ul.list li a:hover{color:#"+hex+";}.carousel .next:hover, .carousel .prev:hover,a.submit,.bottom-footer,.sf-menu li a:hover{background-color:#"+hex+";}.bx-wrapper li a span{color:#"+hex+";}#footer,#footer .footer-widget h4:before{border-top-color:#"+hex+";}.sf-menu li li:hover .icon span{color:#"+hex+";}.sf-menu a, .sf-menu a:visited{color:#"+hex+";}.sf-menu li a{color:#"+hex+";}.sf-menu .sfHover>a{color:#fff;background:#"+hex+";}.sf-menu li li{background:#"+hex+";}.stylish,div.comment-cout,.arrow-circle{background-color:#"+hex+";}.halfCircleBottom,.halfCircleright{border-color:#"+hex+";}div>a.read,.gallery.full-width .da-thumbs li .main div a.read{color:#"+hex+";}.nivo-controlNav a:hover,.nivo-controlNav a.active{background:#"+hex+";}.flex-caption.bottom .textp,.flex-caption.bottom .right .btcolor,.flex-caption.left .textp{background:#"+hex+";}.flex-caption.left .textp{color:#fff;}.flex-caption.left .btcolor{background:#"+hex+";}.flex-caption.bottom .textp:after{border-top-color:#"+hex+";}#send_message,#send{background:#"+hex+";}.sf-menu li a:hover:before{border-color: #"+hex+" #"+hex+" transparent transparent;}.sf-menu li a:hover:after{border-top:10px solid #"+hex+";}.circleright{border-top-color:#"+hex+";border-right-color:#"+hex+";border-bottom-color:#"+hex+";}a.active-button{background:#"+hex+";}div.node{background-color:#"+hex+";}.people span.post{color:#"+hex+";}.buttonred:hover,.ca-content-wrapper{background-color:#"+hex+";}.list li:hover span,span.drop,.post-info a span.icon-comment,.post-info a.post-read,ul.catagories li:hover a,ul.bullet-list li span,a.toggle_trigger span{color:#"+hex+";}.search input.submit,.mailchimp a,.blog-post:hover .post-contant,.widget-controls .flex-direction-nav li a:hover,.tags a:hover:after,.tags a:hover,ul.catagories li:hover span,.accordion a.current,.toggle_trigger.toggle_active,.tabs li a.current,.home-tab .tabs:after,.pricing_table_wdg ul.bestb li:last-child a,.pricing_table_wdg ul li:last-child:hover a{background-color:#"+hex+";}.pricing_table_wdg ul.bestb{border-color:#"+hex+";}");
			

			
		}
	});
	

	
$('#logocolor').ColorPicker({
		onShow: function (colpkr) {
			$(colpkr).fadeIn(500);
			return false;
		},
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onChange: function (hsb,hex) {
			$('#header.bg h3 a.logo').css('color','#'+hex);
			$('#header.scroll h3 a.logo').css('color','#'+hex);
		}
	});	
	
	
$('#colorSelector_inner').ColorPicker({
		color: 'r:255, r:0, b:0',
		onShow: function (colpkr) {
			$(colpkr).fadeIn(500);
			return false;
		},
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onChange: function (hsb,hex) {
			$('.tweet_roll a,.sidebar_tabs ul li a,.toggles a,.sorting a.current_link').css('color','#' +hex);
		}
	});


$('.pattern li').click(function() {
		$('body').css('background-image','none');
		var pat = $(this).css('background-image');
		$('style.color').remove();
		$('body').css('background-image',pat);
		$('.inner-heading h1').css('background-image',pat);
		

	});

$("div.panel_button").click(function(){
		$("div#panel").animate({
			left: "0"
		}, "fast");
		$(".panel_button").animate({
			left: "320px"
		}, "fast");
		$("div.panel_button").toggle();
});	
	
$("div.hide_button").click(function(){
	$("div#panel").animate({
		left: "-310px"
	}, "fast");
	$(".panel_button").animate({
		left: "10px"
	}, "fast");
});



	
		

/* Contact Form */
	
	$('#send_message').click(function(e){
	
        e.preventDefault();
        var error = false;
        var name = $('#name').val();
        var email = $('#email').val();
        var message = $('#message').val();
			/*jshint unused:true, eqnull:true */	
        if(name.length === 0){
                error = true;
                $('#name').css("border", "solid 1px #dc5948") ;
            }else{
                $('#name').css("border", "solid 1px #efefef") ;
            }
            if(email.length === 0 || email.indexOf('@') === -1){
                error = true;
                 $('#email').css("border", "solid 1px #dc5948") ;
            }else{  
				
                $('#email').css("border", "solid 1px #efefef") ;
            }
            if(message.length === 0){
                error = true;
				$('#message').css("border", "solid 1px #dc5948") ;
            }else{                   
                $('#message').css("border", "solid 1px #efefef") ;
            }
			
			if(error === true)
			{
				$('#errors').show();
				$('#mail_sucess').hide();
				$('#mail_fail').hide();
			}
			
            
        if(error === false){
			$('#send_message').attr({'disabled' : 'true', 'value' : 'wait' });

            /* using the jquery's post(ajax) function and a lifesaver
            function serialize() which gets all the data from the form
            we submit it to send_email.php */
            $.post("js/send_email.php", $("#contact_form").serialize(),function(result){
				if(result === 'sent'){
					$('#errors').hide();
					$('#send_message').remove();
                    $('#mail_success').fadeIn(500);
					$('#mail_fail').hide();
                }else{
					$('#mail_fail').fadeIn(500);
					$('#errors').hide();
                    $('#send_message').removeAttr('disabled').attr('value', 'Sent');
                }
            });
        }
    });

	

/* Footer contact Form */
	
	$('#send').click(function(e){
	
        e.preventDefault();
        var error = false;
        var bottomsg = $('#footmessage').val();
	
     
            if(bottomsg.length === 0){
                error = true;
				$('#footmessage').css("border", "solid 1px #dc5948") ;
            }else{                   
                $('#footmessage').css("border", "solid 1px #efefef") ;
            }
			
			if(error === true)
			{
				$('#errors').show();
				$('#mail_sucess').hide();
				$('#mail_fail').hide();
			}
			
            
        if(error === false){
			$('#send').attr({'disabled' : 'true', 'value' : 'wait' });

            /* using the jquery's post(ajax) function and a lifesaver
            function serialize() which gets all the data from the form
            we submit it to send_email.php */
            $.post("js/send.php", $("#footermsg").serialize(),function(result){
				if(result === 'sent'){
					$('#errors').hide();
					$('#send').remove();
                    $('#mail_s').fadeIn(500);
					$('#mail_f').hide();
                }else{
					$('#mail_f').fadeIn(500);
					$('#errors').hide();
                    $('#send').removeAttr('disabled').attr('value', 'Sent');
                }
            });
        }
    });
	

			
			
});
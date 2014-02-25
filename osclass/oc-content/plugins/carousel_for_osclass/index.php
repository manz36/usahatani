<?php
/*
Plugin Name: Carousel for Osclass
Plugin URI: http://www.osclass.org/
Description: Displays items in a carousel.
Version: 2.5.1
Author: kingsult & JChapman
Author URI:
Short Name: CarouselforOsclass
Plugin update URI:
*/
// future improvment add option to only show items with x amount of views. also debug feature.

    function cVersion() {
	  	  $carouselVersion = '2.5.1';
	     return($carouselVersion);
	 }

    function carouselosclass_call_after_install() {
        // Insert here the code you want to execute after the plugin's install
        // for example you might want to create a table or modify some values

         /* 1.5 preferences */
         osc_set_preference('carousel_items'        , '4', 'plugin-carousel_for_osclass', 'INTEGER');
         osc_set_preference('carousel_autoscroll'   , '1', 'plugin-carousel_for_osclass', 'INTEGER');
	     osc_set_preference('carousel_scrolldelay'  , '2800','plugin-carousel_for_osclass','INTEGER');
	     osc_set_preference('carousel_premiumOnly'  , '0','plugin-carousel_for_osclass','INTEGER');
	     /* 2.0 preferences */
	     osc_set_preference('carousel_vertical'     , '0','plugin-carousel_for_osclass','INTEGER');
	     osc_set_preference('carousel_picOnly'      , '0','plugin-carousel_for_osclass','INTEGER');
	     osc_set_preference('carousel_priceEnabled' , '1','plugin-carousel_for_osclass','INTEGER');
	     osc_set_preference('carousel_width'        , '718','plugin-carousel_for_osclass','INTEGER');
	     osc_set_preference('carousel_height'       , '120','plugin-carousel_for_osclass','INTEGER');
	     osc_set_preference('carousel_Swidth'       , '140','plugin-carousel_for_osclass','INTEGER');
	     osc_set_preference('carousel_Sheight'      , '110','plugin-carousel_for_osclass','INTEGER');
	     osc_set_preference('carousel_b_color'      , '#E9F5F9','plugin-carousel_for_osclass','STRING');
	     osc_set_preference('carousel_i_color'      , '#94CEE4','plugin-carousel_for_osclass','STRING');
	     osc_set_preference('carousel_arrows'       , '0','plugin-carousel_for_osclass','INTEGER');
	     osc_set_preference('carousel_version'      , cVersion(),'plugin-carousel_for_osclass','STRING');
	     /* 2.5 preferences */
	     osc_set_preference('carousel_random'		, '0','plugin-carousel_for_osclass','INTEGER');
	     /*2.5.1 preferences */
	     osc_set_preference('carousel_limit'		, '15','plugin-carousel_for_osclass','INTEGER');
	     /*2.5.2 preferences */
	     osc_set_preference('carousel_sDir'			, '+','plugin-carousel_for_osclass','STRING');
	     osc_set_preference('carousel_scrollNum'	, '1','plugin-carousel_for_osclass','INTEGER');

        }

    function carouselosclass_call_after_uninstall() {
		osc_delete_preference('carousel_items'			, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_autoscroll'		, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_scrolldelay'	, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_premiumOnly'	, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_vertical'		, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_picOnly'		, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_priceEnabled'	, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_width'			, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_height'			, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_Swidth'			, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_Sheight'		, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_b_color'		, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_i_color'		, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_arrows'			, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_version'		, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_random'			, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_limit'			, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_sDir'			, 'plugin-carousel_for_osclass');
		osc_delete_preference('carousel_scrollNum'		, 'plugin-carousel_for_osclass');
	}

    // HELPER
    function osc_carousel_items() {
		if(osc_carousel_premiumOnly()) {
			$searchPrem = new Search();
			$searchPrem->addConditions(sprintf("b_premium = %d", 1));

			$premiumItems = $searchPrem->count();

			$carouselItems = $premiumItems;
		} else {
			$carouselItems = (osc_total_active_items() != '' ) ? osc_total_active_items() : 0;
		}
		if ($carouselItems >= osc_get_preference('carousel_items', 'plugin-carousel_for_osclass')) { $carouselItems = osc_get_preference('carousel_items', 'plugin-carousel_for_osclass'); }

        return($carouselItems) ;
    }

    function osc_carousel_autosp() {
        return(osc_get_preference('carousel_autoscroll', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_scrolldelay() {
        return(osc_get_preference('carousel_scrolldelay', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_premiumOnly() {
        return(osc_get_preference('carousel_premiumOnly', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_vertical() {
        return(osc_get_preference('carousel_vertical', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_picOnly() {
        return(osc_get_preference('carousel_picOnly', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_price() {
        return(osc_get_preference('carousel_priceEnabled', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_width() {
        return(osc_get_preference('carousel_width', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_height() {
        return(osc_get_preference('carousel_height', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_Swidth() {
        return(osc_get_preference('carousel_Swidth', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_Sheight() {
        return(osc_get_preference('carousel_Sheight', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_b_color() {
        return(osc_get_preference('carousel_b_color', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_i_color() {
        return(osc_get_preference('carousel_i_color', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_arrows() {
        return(osc_get_preference('carousel_arrows', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_version() {
        return(osc_get_preference('carousel_version', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_random() {
        return(osc_get_preference('carousel_random', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_limit() {
        return(osc_get_preference('carousel_limit', 'plugin-carousel_for_osclass')) ;
    }


    function osc_carousel_sDir() {
        return(osc_get_preference('carousel_sDir', 'plugin-carousel_for_osclass')) ;
    }

    function osc_carousel_scrollNum() {
        return(osc_get_preference('carousel_scrollNum', 'plugin-carousel_for_osclass')) ;
    }
    // javascript files.
	function js_init() {
		if(osc_version() >= '310'){
			osc_register_script('jCarouselLite', osc_base_url() . 'oc-content/plugins/carousel_for_osclass/js/jCarouselLite.js', 'jquery');
			 osc_enqueue_script('jCarouselLite', 'jquery');
		}
	}


    // Self-explanatory
    function carousel($itemPage = FALSE, $itemLimit = 5) {
    	$items 		= (osc_carousel_items() != '') 			? osc_carousel_items() : '4' ;
        $premOnly 	= (osc_carousel_premiumOnly() != '') 	? osc_carousel_premiumOnly() : '' ;
        $price 		= (osc_carousel_price() != '') 			? osc_carousel_price() : '';
        $picOnly 	= (osc_carousel_picOnly() != '') 		? osc_carousel_picOnly() : '';
        $random 	= (osc_carousel_random() != '')			? osc_carousel_random() : '';
        $limit	 	= (osc_carousel_limit() != '')			? osc_carousel_limit() : '';
        require_once 'carousel_detail.php';
    }

    // Self-explanitory
    function carouselosclass_js($sName = NULL, $sWidth = NULL, $sHeight = NULL, $sVert = NULL ){

    $items 		 = (osc_carousel_items() != '') ? osc_carousel_items() : '4' ;
    $autosp 	 = (osc_carousel_autosp() != '') ? osc_carousel_autosp() : '' ;
    $scrolldelay = (osc_carousel_scrolldelay() != '') ? osc_carousel_scrolldelay() : '' ;
    $vert 		 = (osc_carousel_vertical() != '') ? osc_carousel_vertical() : '';
    $back_color  = (osc_carousel_b_color() != '') ? osc_carousel_b_color() : '';
    $hover_color = (osc_carousel_i_color() != '') ? osc_carousel_i_color() : '';
    $width 		 = (osc_carousel_width() != '') ? osc_carousel_width() : '';
    $height 	 = (osc_carousel_height() != '') ? osc_carousel_height() : '';
    $Swidth 	 = (osc_carousel_Swidth() != '') ? osc_carousel_Swidth() : '';
    $Sheight 	 = (osc_carousel_Sheight() != '') ? osc_carousel_Sheight() : '';
    $sDir 		 = (osc_carousel_sDir() != '') ? osc_carousel_sDir() : '+';
    $scrollNum	 = (osc_carousel_scrollNum() != '') ? osc_carousel_scrollNum() : '1';
    ?>
    <!-- carousel css/js -->
    	<style type="text/css">
    	  <?php $cssurl = 'oc-content/plugins/carousel_for_osclass/css/slideshow.css' ;
    		include($cssurl) ; ?>
    	</style>

	<?php if(osc_version() < '310'){ ?>
		<script type='text/javascript' src="<?php echo osc_base_url() . 'oc-content/plugins/carousel_for_osclass/js/jCarouselLite.js'; ?>">
		</script>
	<?php } ?>

  	<script type='text/javascript'>
  	<?php
  	//used for enabling auto speed in carousel.
  	$autospeed = ',
					auto: ' . $scrolldelay . ' ,
					speed: 1100,';?>


  	jQuery(document).ready(function(){


	/* featured listings slider */
    jQuery(".carouselSlider").jCarouselLite({
        btnNext: ".nextCarousel",
        btnPrev: ".prevCarousel",

        visible: <?php echo $items; ?>,
		hoverPause:true<?php if($autosp == 1) { echo $autospeed; } else{ echo ',';} ?>
		scroll: <?php echo $sDir . $scrollNum; ?>,
		vertical: <?php if($vert == 1) { echo 'true';} else{ echo 'false';} ?>,
		circular: true
        //easing: "easeOutQuint" // for different types of easing, see easing.js
    });

   });
  	</script>

<?php }

    // Self-explanitory not used at this time maybe at a latter date.
    function admin_carouselosclass_js(){
    $items = (osc_carousel_items() != '') ? osc_carousel_items() : '' ;
    $autosp = (osc_carousel_autosp() != '') ? osc_carousel_autosp() : '' ;
    $scrolldelay = (osc_carousel_scrolldelay() != '') ? osc_carousel_scrolldelay() : '' ;
    $vert = (osc_carousel_vertical() != '') ? osc_carousel_vertical() : '';
    $back_color = (osc_carousel_b_color() != '') ? osc_carousel_b_color() : '';
    $hover_color = (osc_carousel_i_color() != '') ? osc_carousel_i_color() : '';
    $width = (osc_carousel_width() != '') ? osc_carousel_width() : '';
    $height = (osc_carousel_height() != '') ? osc_carousel_height() : '';
    $Swidth = (osc_carousel_Swidth() != '') ? osc_carousel_Swidth() : '';
    $Sheight = (osc_carousel_Sheight() != '') ? osc_carousel_Sheight() : '';
    ?>
    <!-- carousel css/js -->
    	<style type="text/css">
    	  <?php $cssurl = '../oc-content/plugins/carousel_for_osclass/css/slideshow.css' ;
    		include($cssurl) ; ?>
    	</style>
	<?php
	if(osc_version() < '310') {
	?>
		<script type='text/javascript' src="<?php echo osc_base_url() . 'oc-content/plugins/carousel_for_osclass/js/jCarouselLite.js'; ?>">
		</script>
  	<?php
	}
	?>

  	<script type='text/javascript'>
  	<?php
  	//used for enabling auto speed in carousel.
  	$autospeed = ',
					auto: ' . $scrolldelay . ' ,
					speed: 1100,';?>

  	jQuery(document).ready(function(){


	/* featured listings slider */
    jQuery(".carouselSlider").jCarouselLite({
        btnNext: ".nextCarousel",
        btnPrev: ".prevCarousel",

        visible: <?php echo $items; ?>,
		hoverPause:true<?php if($autosp == 1) { echo $autospeed; } else{ echo ',';} ?>
		vertical: <?php if($vert == 1) { echo 'true';} else{ echo 'false';} ?>
        //easing: "easeOutQuint" // for different types of easing, see easing.js
    });

	<?php osc_run_hook('eCarousel'); ?>

   });
  	</script>

<?php }

     function carouselosclass_admin_menu() {
     	if(OSCLASS_VERSION < '2.4.0') {
        echo '<h3><a href="#">Carousel for Osclass</a></h3>
        <ul>
        		<li><a href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/admin.php') . '">&raquo; ' . __('Configure', 'carousel_for_osclass') . '</a></li>
        		<li><a href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/displayAdmin.php') . '">&raquo; ' . __('Configure Display', 'carousel_for_osclass') . '</a></li>
            <li><a href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/help.php') . '">&raquo; ' . __('F.A.Q. / Help', 'carousel_for_osclass') . '</a></li>
        </ul>';
       } else {
       	echo '<li id="carousel"><h3><a href="#">Carousel for Osclass</a></h3>
        <ul>
        		<li><a href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/admin.php') . '">&raquo; ' . __('Configure', 'carousel_for_osclass') . '</a></li>
        		<li><a href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/displayAdmin.php') . '">&raquo; ' . __('Configure Display', 'carousel_for_osclass') . '</a></li>
            <li><a href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/help.php') . '">&raquo; ' . __('F.A.Q. / Help', 'carousel_for_osclass') . '</a></li>
        </ul></li>';
       }
    }

    function carouselosclass_admin() {
        osc_admin_render_plugin(osc_plugin_path(dirname(__FILE__)) . '/admin.php') ;
    }

    function before_url() {
		 return Params::getParam('page');
    }

    function carousel_admin_header() {
	?>
    <style>
    .ico-carousel_for_osclass{
        background-image: url('<?php echo osc_base_url();?>oc-content/plugins/<?php echo osc_plugin_folder(__FILE__);?>images/projector.png') !important;
    }
    body.compact .ico-carousel_for_osclass{
        background-image: url('<?php echo osc_base_url();?>oc-content/plugins/<?php echo osc_plugin_folder(__FILE__);?>images/projector.png') !important;
        background-size: 35px, 35px;
    }
	</style>
    <?php
	}

    // This is a hack to show a Configure link at plugins table (you could also use some other hook to show a custom option panel)
    osc_add_hook(osc_plugin_path(__FILE__) . '_configure', 'carouselosclass_admin');
    // This is needed in order to be able to activate the plugin
    osc_register_plugin(osc_plugin_path(__FILE__), 'carouselosclass_call_after_install');
    // This is a hack to show a Uninstall link at plugins table (you could also use some other hook to show a custom option panel)
    osc_add_hook(osc_plugin_path(__FILE__). '_uninstall', 'carouselosclass_call_after_uninstall');

    // Add js to header
    osc_add_hook('header', 'carouselosclass_js', 10);
    osc_add_hook('admin_header', 'carousel_admin_header');
    //osc_add_hook('admin_header', 'admin_carouselosclass_js');
    if(osc_version() <= 241) {
		osc_add_hook('admin_menu', 'carouselosclass_admin_menu');
	} else {
		osc_add_admin_menu_page(__('Carousel for OSClass', 'carousel_for_osclass'), '#', 'carousel_for_osclass');
		osc_add_admin_submenu_page('carousel_for_osclass', __('Configure','carousel_for_osclass'), osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/admin.php'), 'carousel_configure');
		osc_add_admin_submenu_page('carousel_for_osclass', __('Configure Display','carousel_for_osclass'), osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/displayAdmin.php'), 'carousel_display');
		osc_add_admin_submenu_page('carousel_for_osclass', __('F.A.Q. / Help','carousel_for_osclass'), osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/help.php'), 'carousel_help');
	}
    // before html
    osc_add_hook('before_html', 'before_url');
    osc_add_hook('init', 'js_init');

?>

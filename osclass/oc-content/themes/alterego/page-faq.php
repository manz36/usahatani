<?php
    /*
     *      Osclass – software for creating and publishing online classified
     *                           advertising platforms
     *
     *                        Copyright (C) 2012 OSCLASS
     *
     *       This program is free software: you can redistribute it and/or
     *     modify it under the terms of the GNU Affero General Public License
     *     as published by the Free Software Foundation, either version 3 of
     *            the License, or (at your option) any later version.
     *
     *     This program is distributed in the hope that it will be useful, but
     *         WITHOUT ANY WARRANTY; without even the implied warranty of
     *        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     *             GNU Affero General Public License for more details.
     *
     *      You should have received a copy of the GNU Affero General Public
     * License along with this program.  If not, see <http://www.gnu.org/licenses/>.
     */

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()); ?>">
    <head>
        <?php osc_current_web_theme_path('head.php'); ?>
        <meta name="robots" content="noindex, nofollow" />
        <meta name="googlebot" content="noindex, nofollow" />
    </head>
    <body>
        <?php osc_current_web_theme_path('header.php'); ?>
        <?php osc_current_web_theme_path('navbar.php'); ?>
		<!-- Container -->
		<div class="container">
		    <!-- Wrapper -->
			<div class="wrapper">
			    <!-- Main content -->
				<div class="content_main">
                    <!-- Breadcrumb -->
					<?php
    					    
						$breadcrumb = osc_breadcrumb('&raquo;', false);
    					if( $breadcrumb != '') { ?>
    					<div class="breadcrumb">
        					<?php echo $breadcrumb; ?>
        					<div class="clear"></div>
    					</div>
						<?php
    				    }
					?> 
					<!-- Breadcrumb END -->
					<!-- FAQ -->
        			<div class="page">
					    <h1><?php _e('FAQ', 'alterego'); ?></h1>
						<div>
						    <div class="faq_element">
							    <h3><?php _e('1. Do I need to get registered to publish an Ad?', 'alterego'); ?></h3>
								<div class="faq_data" style="display: none;">
								    <p><?php _e('Yes. You do need to register to post ads.', 'alterego'); ?></p>
								</div>
							</div>
							<div class="faq_element">
							    <h3><?php _e('1. Do I need to get registered to publish an Ad?', 'alterego'); ?></h3>
								<div class="faq_data" style="display: none;">
								    <p><?php _e('Yes. You do need to register to post ads.', 'alterego'); ?></p>
								</div>
							</div>
							<div class="faq_element">
							    <h3><?php _e('1. Do I need to get registered to publish an Ad?', 'alterego'); ?></h3>
								<div class="faq_data" style="display: none;">
								    <p><?php _e('Yes. You do need to register to post ads.', 'alterego'); ?></p>
								</div>
							</div>
							<div class="faq_element">
							    <h3><?php _e('1. Do I need to get registered to publish an Ad?', 'alterego'); ?></h3>
								<div class="faq_data" style="display: none;">
								    <p><?php _e('Yes. You do need to register to post ads.', 'alterego'); ?></p>
								</div>
							</div>
							<div class="faq_element">
							    <h3><?php _e('1. Do I need to get registered to publish an Ad?', 'alterego'); ?></h3>
								<div class="faq_data" style="display: none;">
								    <p><?php _e('Yes. You do need to register to post ads.', 'alterego'); ?></p>
								</div>
							</div>
							<script type="text/javascript">
							    // <![CDATA[
								$(document).ready(function(){
								    $('.faq_data').hide();
									$('.faq_data').eq(0).show();
									$('.faq_element h3').click(function(){
		
									    var display = $(this).next('.faq_data').css('display');
										$('.faq_data').hide(200);
										if(display != 'block'){
			 							    $(this).next('.faq_data').slideDown(400);
										}
									});
								});
								// ]]>
							</script>
						</div>
					</div>
					<!-- FAQ END -->
       			</div>
				<!-- Main content END -->
			</div>
			<!-- Wrapper -->
		</div>
		<!-- Container END -->
		<script type="text/javascript">
		    function displaymessage(val){
			    jQuery(".T-"+val).hide();
				jQuery(".setdisplay").attr("class","popup")
				jQuery("#P-"+val).attr("class","setdisplay")
				jQuery("#C-"+val).html($('#captcha').clone(true,true));
				jQuery("#C-"+val+" #captcha").attr("class","displayme");
			}
			function donotDisplay(){
			    jQuery(".setdisplay").attr("class","popup")
				jQuery('.displayme').remove();
				jQuery('.trigger').show();
			}
		</script>
		<!-- Footer -->
        <?php osc_current_web_theme_path('footer.php'); ?>
		<!-- Footer END -->
    </body>
</html>
					
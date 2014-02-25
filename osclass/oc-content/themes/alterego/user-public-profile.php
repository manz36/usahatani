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

    $address = '';
    if(osc_user_address()!='') {
        if(osc_user_city_area()!='') {
            $address = osc_user_address().", ".osc_user_city_area();
        } else {
            $address = osc_user_address();
        }
    } else {
        $address = osc_user_city_area();
    }
    $location_array = array();
    if(trim(osc_user_city()." ".osc_user_zip())!='') {
        $location_array[] = trim(osc_user_city()." ".osc_user_zip());
    }
    if(osc_user_region()!='') {
        $location_array[] = osc_user_region();
    }
    if(osc_user_country()!='') {
        $location_array[] = osc_user_country();
    }
    $location = implode(", ", $location_array);
    unset($location_array);

    osc_enqueue_script('jquery-validate');
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
			    <!-- Left sidebar -->
				<?php osc_current_web_theme_path('left_sidebar.php'); ?>
				<!-- Left sidebar END -->
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
					<!-- Content middle -->
					<div class="mid_content">
        			    <div id="item_head">
                		    <h1><?php echo sprintf(__('%s\'s profile', 'alterego'), osc_user_name()); ?></h1>
                		</div>
            			<div id="main">
                		    <div id="description">
                			    <h2><?php _e('Informasi Umum', 'alterego'); ?></h2>
                    			<ul id="user_data">
                        		    <li><?php _e('Nama Lengkap', 'alterego'); ?>: <?php echo osc_user_name(); ?></li>
                        			<li><?php _e('Alamat', 'alterego'); ?>: <?php echo $address; ?></li>
                        			<li><?php _e('Lokasi', 'alterego'); ?>: <?php echo $location; ?></li>
                        			<li><?php _e('Website', 'alterego'); ?>: <?php echo osc_user_website(); ?></li>
                        			<li><?php _e('Keterangan', 'alterego'); ?>: <?php echo osc_user_info(); ?></li>
                    			</ul>
                			</div>
                			<div id="description" class="latest_ads">
                    		    <h2><?php _e('Iklan Terakhir', 'alterego'); ?></h2>
                    			<table border="0" cellspacing="0">
                        		    <tbody>
                            		    <?php $class = "even"; ?>
                            			<?php while(osc_has_items()) { ?>
                                		<tr class="<?php echo $class; ?>" >
                                    	    <td class="photo">
                                         	    <?php if(osc_count_item_resources()) { ?>
                        						    <a href="<?php echo osc_item_url(); ?>"><img src="<?php echo osc_resource_thumbnail_url(); ?>" width="85" title="<?php echo osc_item_title(); ?>" alt="<?php echo osc_item_title(); ?>" /></a>
                    							<?php } else { ?>
                        						    <img src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" title="" alt="" />
                    							<?php } ?>
                                     		</td>
                                     		<td class="text">
                                                <div class="ad_info"></div>
											        <h4><a href="<?php echo osc_item_url(); ?>"><?php echo osc_item_title(); ?></a></h4>
                                             	    <p><span class="date"><?php echo osc_format_date(osc_item_pub_date()); ?></span></p>
												 	<div class="description">
												        <p><?php echo osc_highlight( strip_tags( osc_item_description() ) ); ?></p>
													    <!-- <a class="reply" href="javascript:void(0)" onclick="displaymessage(2414);"><?php _e('Quick Reply', 'maurojobs'); ?></a> -->
													    <div class="more_info">
													        <a href="<?php echo osc_item_url(); ?>" title="<?php echo osc_item_title(); ?>" class="button more_info"><?php _e('More info', 'maurojobs'); ?></a>
													    </div>
												    </div>
												    <div class="price">
												        <span class="price"><?php echo osc_item_formated_price()?></span>
												    </div>
                                                </div>
                                        	</td>
                                    	</tr>
                                		<?php $class = ($class == 'even') ? 'odd' : 'even'; ?>
                            			<?php } ?>
                        			</tbody>
                    			</table>
                    			<?php if(osc_search_total_pages() > osc_max_results_per_page_at_search() ) { ?>
                    			<p class="see_more_link"><a href="<?php echo osc_base_url(true).'&page=search&sUser[]='.osc_user_id(); ?>"><strong>See all offers »</strong></a></p>
                    			<?php } ?>
                			</div>
            			</div>
					</div>
					<!-- Right sidebar -->
					<div class="right_sidebar">
            			<div id="sidebar" style="margin-top:22px !important;">
                		<?php if(osc_logged_user_id()!=  osc_user_id()) { ?>
                			<?php     if(osc_reg_user_can_contact() && osc_is_web_user_logged_in() || !osc_reg_user_can_contact() ) { ?>
                			<div id="company_logos">
	    					    <a href="<?php echo osc_user_public_profile_url( osc_item_user_id() ); ?>" ><?php company_logos_show(); ?></a>
							</div>
							<div id="contact">
                    			<h2><?php _e("Hubungi Pengiklan", 'alterego'); ?></h2>
                    			<ul id="error_list"></ul>
                    			<?php ContactForm::js_validation(); ?>
                    			<form action="<?php echo osc_base_url(true); ?>" method="post" name="contact_form" id="contact_form">
                        			<input type="hidden" name="action" value="contact_post" />
                        			<input type="hidden" name="page" value="user" />
                        			<input type="hidden" name="id" value="<?php echo osc_user_id();?>" />
                        			<?php osc_prepare_user_info(); ?>
                        			<label for="yourName"><?php _e('Nama', 'alterego'); ?>:</label> <?php ContactForm::your_name(); ?>
                            		<label for="yourEmail"><?php _e('E-mail', 'alterego'); ?>:</label> <?php ContactForm::your_email(); ?>
                            		<label for="phoneNumber"><?php _e('Telpon', 'alterego'); ?> (<?php _e('optional', 'alterego'); ?>):</label> <?php ContactForm::your_phone_number(); ?>
                            		<label for="message"><?php _e('Pesan', 'alterego'); ?>:</label> <?php ContactForm::your_message(); ?>
                            		<?php if( osc_recaptcha_public_key() ) { ?>
                            		<script type="text/javascript">
                               			 var RecaptchaOptions = {
                                    		 theme : 'custom',
                                    		 custom_theme_widget: 'recaptcha_widget'
                                		};
                            		</script>
                            		<style type="text/css"> div#recaptcha_widget, div#recaptcha_image > img { width:280px; } </style>
                            		<div id="recaptcha_widget">
                                		<div id="recaptcha_image"><img /></div>
                                		<span class="recaptcha_only_if_image"><?php _e('Ketikan tulisan diatas','alterego'); ?>:</span>
                                		<input type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
                                		<div><a href="javascript:Recaptcha.showhelp()"><?php _e('Bantuan', 'alterego'); ?></a></div>
                            		</div>
                            		<?php } ?>
                            		<?php osc_show_recaptcha(); ?>
                            		<button id="contact-btn" type="submit"><?php _e('Kirim', 'alterego'); ?></button>
                    			</form>
                			</div>
                			<?php     } ?>
                			<?php } ?>
            			</div>
        			</div>
				</div>
        	    <!-- Main content END -->
			</div>
			<!-- Wrapper -->
		</div>
		<!-- Container END -->
		<!-- Footer -->
        <?php osc_current_web_theme_path('footer.php'); ?>
		<!-- Footer END -->
    </body>
</html>

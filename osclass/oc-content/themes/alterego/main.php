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

function drawSubcategory($category) {
    if ( osc_count_subcategories2() > 0 ) {
        osc_category_move_to_children();
        ?>
        <ul>
            <?php while ( osc_has_categories() ) { ?>
                <li><a class="category cat_<?php echo osc_category_id(); ?>" href="<?php echo osc_search_category_url(); ?>"><?php echo osc_category_name(); ?></a> <span>(<?php echo osc_category_total_items(); ?>)</span><?php drawSubcategory(osc_category()); ?></li>
            <?php } ?>
        </ul>
    <?php
        osc_category_move_to_parent();
    }
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()); ?>">
    <head>
        <?php osc_current_web_theme_path('head.php'); ?>
        <meta name="robots" content="index, follow" />
        <meta name="googlebot" content="index, follow" />
    </head>
    <body>
	    <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                $.each($('ul.q_body'), function(index, value) {
                    $(this).hide();
                });

                $('.quick_reply').live('click', function() {
                    $(this).parent().find('ul').toggle();
                });
            })
        </script>
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
				    <!-- Welcome -->
					<p class="site_info"><strong><?php _e('Selamat Datang di ', 'alterego') ; ?><?php echo osc_page_title() ; ?><?php _e(' -', 'alterego') ; ?></strong><?php _e('Tempat Jual-belinya Petani Indonesia', 'alterego') ; ?></p>
					<!-- Welcome END -->
					<!-- Carousel -->
					<div class="ad_rotator">
					    <?php if (function_exists('carousel')) {carousel();} ?>
					</div>
					<!-- Carousel END -->
					<!-- Content middle -->
					<div class="mid_content">
					    <!-- Latest ads -->
						<h2><?php _e('Iklan Terakhir', 'alterego'); ?></h2>
						<div class="latest_ads">
                   		<?php if( osc_count_latest_items() == 0) { ?>
                            <p class="empty"><?php _e('Iklan Terakhir', 'alterego'); ?></p>
                    	<?php } else { ?>
                        <table border="0" cellspacing="0">
                             <tbody>
                                <?php $class = "even"; ?>
                                <?php while ( osc_has_latest_items() ) { ?>
                                 <tr class="<?php echo $class. (osc_item_is_premium()?" premium":""); ?>">
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
													 <!-- <a class="reply" href="javascript:void(0)" onclick="displaymessage(2414);"><?php _e('Quick Reply', 'alterego'); ?></a> -->
													 <div class="more_info">
													     <a href="<?php echo osc_item_url(); ?>" title="<?php echo osc_item_title(); ?>" class="button more_info"><?php _e('More info', 'alterego'); ?></a>
													 </div>
												 </div>
												 <div class="price">
												     <span class="price"><?php echo osc_item_formated_price()?></span>
												 </div>
												 <div class="quick_reply"></div>
						 						 <ul class="q_body">
						     					     <div class="q_form">
							     					     <ul id="error_list"></ul>
                        		 						 <form action="<?php echo osc_base_url(true); ?>" method="post" name="contact_form" id="contact_form">
                            						<!-- <div class="q_close"></div> -->
								 					     <?php osc_prepare_user_info(); ?>
                            	 						 <fieldset style="border:none;">
                                     					     <label for="yourName"><?php _e('Nama', 'alterego'); ?>:</label> <?php ContactForm::your_name(); ?>
                                	 						 <label for="yourEmail"><?php _e('Alamat email', 'alterego'); ?>:</label> <?php ContactForm::your_email(); ?>
                                	 						 <label for="phoneNumber"><?php _e('No Telpon', 'alterego'); ?>:</label> <?php ContactForm::your_phone_number(); ?>
                                	 						 <?php osc_run_hook('item_contact_form', osc_item_id()); ?>
                                	 						 <label for="message"><?php _e('Pesan', 'alterego'); ?>:</label> <?php ContactForm::your_message(); ?>
                                	 						 <input type="hidden" name="action" value="contact_post" />
                                	 						 <input type="hidden" name="page" value="item" />
                                	 						 <input type="hidden" name="id" value="<?php echo osc_item_id(); ?>" />
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
                                    	 						 <span class="recaptcha_only_if_image"><?php _e('Ketikan tulisan diatas ','alterego'); ?>:</span>
                                    	 						 <input type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
                                    	 						 <div><a href="javascript:Recaptcha.showhelp()"><?php _e('Help', 'alterego'); ?></a></div>
                                	 						 </div>
                                	 						 <?php } ?>
                                	 						 <?php osc_show_recaptcha(); ?>
                                	 						 <button style="margin-top:20px;" type="submit" id="contact-btn"><?php _e('Kirim', 'alterego'); ?></button>
                            	 						 </fieldset>
                        	 	 					 	 </form>
							 						 </div>
						 						 </ul>
                                             </div>
										 </td>
                                     </tr>
                                    <?php $class = ($class == 'even') ? 'odd' : 'even'; ?>
                                <?php } ?>
                            </tbody>
                        </table>
                        <?php if( osc_count_latest_items() == osc_max_latest_items() ) { ?>
                        <p class='pagination'><?php echo osc_search_pagination(); ?></p>
                            <p class="see_more_link"><a href="<?php echo osc_search_show_all_url();?>"><strong><?php _e("Lihat semua penawaran", 'alterego'); ?> &raquo;</strong></a></p>
                        <?php } ?>
                    	<?php View::newInstance()->_erase('items'); } ?>
                		</div>
						<!-- Latest ads END -->
					</div>
					<!-- Content middle END -->
					<!-- Right sidebar -->
					<div class="right_sidebar">
					    <div class="location_search">
						    <div class="location_search_left"></div>
							<div class="location_search_mid">
							    <h3><?php _e("Pilih Kota ", 'alterego'); ?></h3>
								<form action="<?php echo osc_base_url(true); ?>" method="get" onsubmit="return doSearch()" class="nocsrf">
                				    <input type="hidden" name="page" value="search" />
                					<input type="hidden" name="sOrder" value="<?php echo osc_esc_html(osc_search_order()); ?>" />
                					<input type="hidden" name="iOrderType" value="<?php $allowedTypesForSorting = Search::getAllowedTypesForSorting(); echo osc_esc_html($allowedTypesForSorting[osc_search_order_type()]); ?>" />
                					<?php foreach(osc_search_user() as $userId) { ?>
                    			        <input type="hidden" name="sUser[]" value="<?php echo osc_esc_html($userId); ?>" />
                					<?php } ?>
									<div class="category-selector">
		            			        <?php $aCities = City::newInstance()->listAll(); ?>
                                        <?php if(count($aCities) > 0 ) { ?>
                                            <select name="sCity" id="sCity">
                                                <?php foreach($aCities as $city) { ?>
                                                <option value="<?php echo $city['s_name'] ; ?>"><?php echo $city['s_name'] ; ?></option>
                                                <?php } ?>
                                            </select>
                                        <?php } ?>
									</div>
        							<input class="submit" type="submit" value="Go"></input>
								</form>
							</div>
							<div class="location_search_right"></div>
						</div>
						<div class="right_element shadow">
						</div>
						<div class="right_element shadow">
						</div>
						<div class="right_element shadow">
						</div>
					</div>
					<!-- Right sidebar END -->
				</div>
				<!-- Main content END -->
			</div>
			<!-- Wrapper END -->
		</div>
		<!-- Container END -->
		<!-- Footer -->
        <?php osc_current_web_theme_path('footer.php'); ?>
		<!-- Footer END -->
    </body>
</html>

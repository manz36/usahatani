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

    osc_enqueue_script('jquery-validate');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()); ?>">
    <head>
        <?php osc_current_web_theme_path('head.php'); ?>
        <meta name="robots" content="noindex, nofollow" />
        <meta name="googlebot" content="noindex, nofollow" />
		<!-- only item-edit.php -->
        <?php ItemForm::location_javascript_new(); ?>
        <?php if(osc_images_enabled_at_items()) ItemForm::photos_javascript(); ?>
        <script type="text/javascript">
            function uniform_input_file(){
                photos_div = $('div.photos');
                $('div',photos_div).each(
                    function(){
                        if( $(this).find('div.uploader').length == 0  ){
                            divid = $(this).attr('id');
                            if(divid != 'photos'){
                                divclass = $(this).hasClass('box');
                                if( !$(this).hasClass('box') & !$(this).hasClass('uploader') & !$(this).hasClass('row')){
                                    $("div#"+$(this).attr('id')+" input:file").uniform({fileDefaultText: fileDefaultText,fileBtnText: fileBtnText});
                                }
                            }
                        }
                    }
                );
            }

            setInterval("uniform_plugins()", 250);
            function uniform_plugins() {

                var content_plugin_hook = $('#plugin-hook').text();
                content_plugin_hook = content_plugin_hook.replace(/(\r\n|\n|\r)/gm,"");
                if( content_plugin_hook != '' ){

                    var div_plugin_hook = $('#plugin-hook');
                    var num_uniform = $("div[id*='uniform-']", div_plugin_hook ).size();
                    if( num_uniform == 0 ){
                        if( $('#plugin-hook input:text').size() > 0 ){
                            $('#plugin-hook input:text').uniform();
                        }
                        if( $('#plugin-hook select').size() > 0 ){
                            $('#plugin-hook select').uniform();
                        }
                    }
                }
            }
            <?php if(osc_locale_thousands_sep()!='' || osc_locale_dec_point() != '') { ?>
            $().ready(function(){
                $("#price").blur(function(event) {
                    var price = $("#price").prop("value");
                    <?php if(osc_locale_thousands_sep()!='') { ?>
                    while(price.indexOf('<?php echo osc_esc_js(osc_locale_thousands_sep());  ?>')!=-1) {
                        price = price.replace('<?php echo osc_esc_js(osc_locale_thousands_sep());  ?>', '');
                    }
                    <?php }; ?>
                    <?php if(osc_locale_dec_point()!='') { ?>
                    var tmp = price.split('<?php echo osc_esc_js(osc_locale_dec_point())?>');
                    if(tmp.length>2) {
                        price = tmp[0]+'<?php echo osc_esc_js(osc_locale_dec_point())?>'+tmp[1];
                    }
                    <?php }; ?>
                    $("#price").prop("value", price);
                });
            });
            <?php }; ?>
        </script>
        <!-- end only item-edit.php -->
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
					<!-- Item post page -->
        			<div class="page">
            		    <h1><strong><?php _e('Ubah iklan anda', 'alterego'); ?></strong></h1>
            			<ul id="error_list"></ul>
            			<form name="item" action="<?php echo osc_base_url(true);?>" method="post" enctype="multipart/form-data">
                		    <input type="hidden" name="action" value="item_edit_post" />
                    		<input type="hidden" name="page" value="item" />
                    		<input type="hidden" name="id" value="<?php echo osc_item_id();?>" />
                    		<input type="hidden" name="secret" value="<?php echo osc_item_secret();?>" />
                    		<div class="box general_info">
                        	    <h3><?php _e('Informasi Umum', 'alterego'); ?></h3>
                        		<div class="row">
                            	    <label for="catId"><?php _e('Kategori', 'alterego'); ?> *</label>
                            	    <?php ItemForm::category_multiple_selects(null, null, __('Pilih kategori', 'alterego')); ?>
                        		</div>
                        		<div class="row">
                            	    <?php ItemForm::multilanguage_title_description(); ?>
                        		</div>
                    		</div>
                    		<?php if( osc_price_enabled_at_items() ) { ?>
                    		<div class="box price">
                        	    <label for="price"><?php _e('Harga', 'alterego'); ?></label>
                        		<?php ItemForm::price_input_text(); ?>
                        		<?php ItemForm::currency_select(); ?>
                    		</div>
                    		<?php } ?>
                    		<?php if( osc_images_enabled_at_items() ) { ?>
                    		<div class="box photos">
                        	    <h3><?php _e('Photo', 'alterego'); ?></h3>
                        		<?php ItemForm::photos(); ?>
                            	<div id="photos">
                                    <?php if(osc_max_images_per_item()==0 || (osc_max_images_per_item()!=0 && osc_count_item_resources()<  osc_max_images_per_item())) { ?>
                                	<div class="row">
                                        <input type="file" name="photos[]" />
                                	</div>
                                	<?php }; ?>
                            	</div>
                            	<a href="#" onclick="addNewPhoto(); uniform_input_file(); return false;"><?php _e('Masukan Photo baru', 'alterego'); ?></a>
                    		</div>
                    		<?php } ?>
							<div class="box location">
                        	    <h3><?php _e('Lokasi Iklan', 'alterego'); ?></h3>
                        		<div class="row">
                            	    <label for="countryId"><?php _e('Negara', 'alterego'); ?></label>
                            		<?php ItemForm::country_select(osc_get_countries(), osc_user()); ?>
                        		</div>
                        		<div class="row">
                            	    <label for="regionId"><?php _e('Provinsi', 'alterego'); ?></label>
                            		<?php ItemForm::region_text(osc_user()); ?>
                        		</div>
                        		<div class="row">
                            	    <label for="city"><?php _e('Kota', 'alterego'); ?></label>
                            		<?php ItemForm::city_text(osc_user()); ?>
                        		</div>
                        		<div class="row">
                            	    <label for="city"><?php _e('Area Kota', 'alterego'); ?></label>
                            		<?php ItemForm::city_area_text(osc_user()); ?>
                        		</div>
                        		<div class="row">
                            	    <label for="address"><?php _e('Alamat', 'alterego'); ?></label>
                            		<?php ItemForm::address_text(osc_user()); ?>
                        		</div>
                    		</div>
                    		<!-- seller info -->
                    		<?php if(!osc_is_web_user_logged_in() ) { ?>
                    		<div class="box seller_info">
                        	    <h3><?php _e("Informasi Penjual", 'alterego'); ?></h3>
                        		<div class="row">
                            		<label for="contactName"><?php _e('Nama', 'alterego'); ?></label>
                            		<?php ItemForm::contact_name_text(); ?>
                        		</div>
                        		<div class="row">
                            	    <label for="contactEmail"><?php _e('E-mail', 'alterego'); ?> *</label>
                            		<?php ItemForm::contact_email_text(); ?>
                        		</div>
                        		<div class="row">
                            	    <div style="width: 120px;text-align: right;float:left;">
                                	    <?php ItemForm::show_email_checkbox(); ?>
                            		</div>
                            		<label for="showEmail" style="width: 250px;"><?php _e('Lihat E-mail pada list', 'alterego'); ?></label>
                        		</div>
                    		</div>
                    		<?php }; ?>
                    		<?php ItemForm::plugin_post_item(); ?>
                    		<?php if( osc_recaptcha_items_enabled() ) {?>
                    		<div class="box">
                        	    <div class="row">
                            	    <?php osc_show_recaptcha(); ?>
                        		</div>
                    		</div>
                    		<?php }?>
                			<div class="clear"></div>
                			<button id="post-btn" class="itemFormButton" type="submit"><?php _e('Update', 'modern'); ?></button>
                    		<a id="post-btn" href="javascript:history.back(-1)" class="go_back"><?php _e('Cancel', 'modern'); ?></a>
            			</form>
        		    </div>
					<!-- Item post page END -->
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
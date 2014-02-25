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
                    <!-- Content middle -->
					<div class="mid_content">
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
						<!-- User listings -->
            			<h1>
                		    <strong><?php _e('Manager Akun', 'alterego'); ?></strong>
            			</h1>
            			<div id="main">
                		    <h2><?php _e('Iklan anda', 'alterego'); ?></h2>
                			<?php if(osc_count_items() == 0) { ?>
                    		<h3><?php _e("Anda belum memiliki Iklan", 'alterego'); ?></h3>
                			<?php } else { ?>
                			<?php while(osc_has_items()) { ?>
                			<div class="userItem" >
                    		    <div class="photo" style="float:left;margin-right:12px;">
									<?php if(osc_count_item_resources()) { ?>
                        			    <a href="<?php echo osc_item_url(); ?>"><img src="<?php echo osc_resource_thumbnail_url(); ?>" width="85" title="<?php echo osc_item_title(); ?>" alt="<?php echo osc_item_title(); ?>" /></a>
                    				<?php } else { ?>
                        			    <img src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" title="" alt="" />
                    				<?php } ?>
								</div>
								<div>
                        		    <a href="<?php echo osc_item_url(); ?>"><?php echo osc_item_title(); ?></a>
                        			<?php if(osc_item_is_active()) { echo '<span style="color:rgb(135, 170, 81);" class="user-listing-active"><strong>'.__('Aktif', 'alterego').'</strong></span>'; } else { echo '<span style="color:red;" class="user-listing-inactive"><strong>'.__('Nonaktif', 'alterego').'</strong></span>'; }; ?>
                        			<?php if(osc_item_is_premium()) { echo '<span style="color:yellow;" class="user-listing-premium"><strong>'.__('Berbayar', 'alterego').'</strong></span>'; }; ?>
                        			<?php if(osc_item_is_spam()) { echo '<span style="color:red;" class="user-listing-spam"><strong>'.__('Spam', 'alterego').'</strong></span>>'; }; ?>
                    			</div>
                    			<div class="userItemData" >
								    <?php _e('Tanggal diiklankan', 'alterego'); ?>: <?php echo osc_format_date(osc_item_pub_date()); ?><br />
                        			    <?php if( osc_price_enabled_at_items() && osc_item_category_price_enabled() ) { _e('Harga', 'alterego'); ?>: <?php echo osc_format_price(osc_item_price()); } ?>
                    			    <p class="options">
                        		        <strong><a href="<?php echo osc_item_edit_url(); ?>"><?php _e('Ubah', 'alterego'); ?></a></strong>
                        				<span>|</span>
                        				<a class="delete" onclick="javascript:return confirm('<?php echo osc_esc_js(__('Hal ini tidak bisa diubah, anda yakin??', 'alterego')); ?>')" href="<?php echo osc_item_delete_url();?>" ><?php _e('Hapus', 'alterego'); ?></a>
                        				<?php if(osc_item_is_inactive()) {?>
                        				<span>|</span>
                        				<a href="<?php echo osc_item_activate_url();?>" ><?php _e('Aktifkan', 'alterego'); ?></a>
                        				<?php } ?>
                    				</p>
                    			</div>
                			</div>
                			<?php } ?>
                			<br />
                			<div class="paginate" >
                    		<?php for($i = 0; $i < osc_list_total_pages(); $i++) {
                        	    if($i == osc_list_page()) {
                            	    printf('<a class="searchPaginationSelected" href="%s">%d</a>', osc_user_list_items_url($i), ($i + 1));
                        		} else {
                            	printf('<a class="searchPaginationNonSelected" href="%s">%d</a>', osc_user_list_items_url($i), ($i + 1));
                        		}
                    		} ?>
                			</div>
                			<?php } ?>
            			</div>
        				<!-- User listings END -->
					</div>
        			<!-- Content middle END -->
					<!-- Right sidebar -->
					<div class="right_sidebar">
            		    <div id="sidebar">
						    <?php osc_current_web_theme_path('account-sidebar.php'); ?>
						</div>
        			</div>
					<!-- Right sidebar END -->
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

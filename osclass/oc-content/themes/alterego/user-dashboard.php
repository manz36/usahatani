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
						<!-- Dashboard -->
        				<h1>
                		    <strong><?php _e('Manager Akun', 'alterego'); ?></strong><a class="user_post-btn" href="<?php echo osc_item_post_url(); ?>">+ <?php _e('Masukan Iklan baru', 'alterego'); ?></a>
            			</h1>
            			<div id="main">
                		    <h2><?php echo sprintf(__('Daftar Iklan %s', 'alterego') ,osc_logged_user_name()); ?></h2>
                			<div class="tips">
							    <a id="closeme"></a>
								<h3><?php _e('Pemberitahuan', 'alterego'); ?></h3>
								<ul>
					    		    <li><?php _e('1. Some useful tips here!', 'alterego'); ?></li>
									<li><?php _e('2. Some useful tips here!', 'alterego'); ?></li>
									<li><?php _e('3. Some useful tips here!', 'alterego'); ?></li>
									<li><?php _e('4. Some useful tips here!', 'alterego'); ?></li>
								</ul>
								<script type="text/javascript">
								    $('#closeme').click(function(){
									    $('.tips').hide(300);
									});
								</script>
							</div>
							<?php if(osc_count_items() == 0) { ?>
                    		    <h3><?php _e('Belum ada iklan yang terdaftar', 'alterego'); ?></h3>
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
                            		</div>
                            		<div class="userItemData" >
                            		<?php _e('Tanggal Publikasi', 'alterego'); ?>: <?php echo osc_format_date(osc_item_pub_date()); ?><br />
                                    	<?php if( osc_price_enabled_at_items() && osc_item_category_price_enabled() ) { _e('Harga', 'alterego'); ?>: <?php echo osc_format_price(osc_item_price()); } ?>
                                    	<p class="options">
                                            <strong><a href="<?php echo osc_item_url(); ?>"><?php _e('Lihat Iklan', 'alterego'); ?></a></strong>
                                        	<span>|</span>
                                        	<a href="<?php echo osc_item_edit_url(); ?>"><?php _e('Ubah', 'alterego'); ?></a>
                                        	<?php if(osc_item_is_inactive()) {?>
                                        	<span>|</span>
                                        	<a href="<?php echo osc_item_activate_url();?>" ><?php _e('Aktifkan', 'alterego'); ?></a>
                                        	<?php } ?>
                                    	</p>
                                    	<br />
                            		</div>
                        		</div>
                        		<br />
                    			<?php } ?>
                			<?php } ?>
            			</div>
						<!-- Dashboard END -->
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

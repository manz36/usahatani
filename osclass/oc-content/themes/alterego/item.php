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

    osc_enqueue_script('fancybox');
    osc_enqueue_style('fancybox', osc_assets_url('js/fancybox/jquery.fancybox.css'));
    osc_enqueue_script('jquery-validate');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()); ?>">
    <head>
        <?php osc_current_web_theme_path('head.php'); ?>
		<script type="text/javascript">
            $(document).ready(function(){
                $("a[rel=image_group]").fancybox({
                    openEffect : 'none',
                    closeEffect : 'none',
                    nextEffect : 'fade',
                    prevEffect : 'fade',
                    loop : false,
                    helpers : {
                            title : {
                                    type : 'inside'
                            }
                    }
                });
            });
        </script>
        <meta name="robots" content="index, follow" />
        <meta name="googlebot" content="index, follow" />
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
						<!-- Item head -->
        				<div id="item_head">
                		    <h1><span class="price"></span><?php if( osc_price_enabled_at_items() && osc_item_category_price_enabled() ) { ?><span class="price"><?php echo osc_item_formated_price(); ?></span> <?php } ?><strong><?php echo osc_item_title() . ' ' . osc_item_city(); ?></strong></h1>
                    		<?php if(osc_is_web_user_logged_in() && osc_logged_user_id()==osc_item_user_id()) { ?>
                        	<p id="edit_item_view">
                                <strong>
                                    <a href="<?php echo osc_item_edit_url(); ?>" rel="nofollow"><?php _e('Edit Iklan', 'alterego'); ?></a>
                                </strong>
                        	</p>
                    		<?php } else { ?>
                        	<p id="report">
                                <strong><?php _e('Tandai Sebagai', 'alterego'); ?></strong>
                            	<span>
                                    <a id="item_spam" href="<?php echo osc_item_link_spam(); ?>" rel="nofollow"><?php _e('Spam', 'alterego'); ?></a> | 
                                	<a id="item_bad_category" href="<?php echo osc_item_link_bad_category(); ?>" rel="nofollow"><?php _e('Salah Klasifikasi', 'alterego'); ?></a> | 
                                	<a id="item_repeated" href="<?php echo osc_item_link_repeated(); ?>" rel="nofollow"><?php _e('Duplikasi', 'alterego'); ?></a> | 
                                	<a id="item_expired" href="<?php echo osc_item_link_expired(); ?>" rel="nofollow"><?php _e('Kadaluarsa', 'alterego'); ?></a> | 
                                	<a id="item_offensive" href="<?php echo osc_item_link_offensive(); ?>" rel="nofollow"><?php _e('Kasar', 'alterego'); ?></a>
                            	</span>
                        	</p>
                    		<?php }; ?>
                		</div>
						<!-- Item head END -->
						<!-- Item main -->
            			<div id="main">
							<!-- Types -->
                		    <div id="type_dates">
                    		    <strong><?php echo osc_item_category(); ?></strong> / 
                    			<em class="publish"><?php if ( osc_item_pub_date() != '' ) echo __('Tanggal Terbit', 'alterego') . ': ' . osc_format_date( osc_item_pub_date() ); ?></em>
                    			<em class="update"><?php if ( osc_item_mod_date() != '' ) echo __('Tanggal Diubah', 'alterego') . ': ' . osc_format_date( osc_item_mod_date() ); ?></em>
                			</div>
							<!-- Types END -->
							<!-- Description -->
                			<div id="description">
                    		    <p><?php echo osc_item_description(); ?></p>
                    			<div id="custom_fields">
                        		    <?php if( osc_count_item_meta() >= 1 ) { ?>
                            		<br />
                            		<div class="meta_list">
                                	<?php while ( osc_has_item_meta() ) { ?>
                                    <?php if(osc_item_meta_value()!='') { ?>
                                        <div class="meta">
                                            <strong><?php echo osc_item_meta_name(); ?>:</strong> <?php echo osc_item_meta_value(); ?>
                                        </div>
                                    <?php } ?>
                                	<?php } ?>
                            		</div>
                        			<?php } ?>
                    			</div>
								<!-- Description END -->
								<!-- Item details hook -->
                    			<?php osc_run_hook('item_detail', osc_item() ); ?>
								<!-- Item details END -->
								<!-- Google map hook -->
								<div class="g_map">    
									<?php osc_run_hook('Lokasi'); ?>
								</div>
								<!-- Google map END -->
                			</div>
							<!-- Description END -->
							<!-- Item location -->
							<ul id="item_location">
                    		    <?php if ( osc_item_country() != "" ) { ?><li><?php _e("Negara", 'alterego'); ?>: <strong><?php echo osc_item_country(); ?></strong></li><?php } ?>
                    			<?php if ( osc_item_region() != "" ) { ?><li><?php _e("Provinsi", 'alterego'); ?>: <strong><?php echo osc_item_region(); ?></strong></li><?php } ?>
                    			<?php if ( osc_item_city() != "" ) { ?><li><?php _e("Kota", 'alterego'); ?>: <strong><?php echo osc_item_city(); ?></strong></li><?php } ?>
                    			<?php if ( osc_item_city_area() != "" ) { ?><li><?php _e("Area Kota", 'alterego'); ?>: <strong><?php echo osc_item_city_area(); ?></strong></li><?php } ?>
                    			<?php if ( osc_item_address() != "" ) { ?><li><?php _e("Alamat", 'alterego'); ?>: <strong><?php echo osc_item_address(); ?></strong></li><?php } ?>
                			</ul>
                			<!-- Item location END -->
                			<!-- Useful tips -->
                			<div class="tips">
							    <a id="closeme"></a>
								<h3><?php _e('Perhatian', 'alterego'); ?></h3>
								<ul>
					    		    <li><?php _e('1. Hindari transfer langsung sebelum melihat barang yang dijual', 'alterego'); ?></li>
                        			<li><?php _e('2. Jangan lakukan pembayaran di muka kepada penjual yang tidak Anda kenal.', 'alterego'); ?></li>
                        			<li><?php _e('3. Usahatani.com TIDAK mengirim konfirmasi pembayaran apapun', 'alterego'); ?></li>
                        			<li><?php _e('4. Usahatani.com tidak akan pernah terlibat dalam segala hal transaksi, pembayaran, pengiriman, garansi transaksi, meneyediakan layanan pendampingan, atau menawarkan "Perlindungan konsumen" atau "Sertifikasi penjual"', 'alterego'); ?></li>
                    			</ul>
								<script type="text/javascript">
								    $('#closeme').click(function(){
									    $('.tips').hide(300);
									});
								</script>
							</div>
							<!-- Useful tips END -->
						</div>
                		<!-- Item main END -->
					</div>
					<!-- Content middle END -->
					<!-- Right sidebar -->
					<div class="right_sidebar">
            		    <?php osc_current_web_theme_path('item-sidebar.php'); ?>
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

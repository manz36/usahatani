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

    $locales   = __get('locales');
    $user = osc_user();
    osc_enqueue_style('jquery-ui-custom', osc_current_web_theme_styles_url('jquery-ui/jquery-ui-1.8.20.custom.css'));
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
					<!-- Content middle -->
					<div class="mid_content">
						<!-- User profile --> 
        			    <h1>
                		    <strong><?php _e('Manager Akun', 'alterego'); ?></strong>
            			</h1>
            			<div id="main" class="modify_profile">
                		    <h2><?php _e('Update profil', 'alterego'); ?></h2>
                			<?php UserForm::location_javascript(); ?>
                			<script type="text/javascript">
                    		    $(document).ready(function(){
                        		    $("#delete_account").click(function(){
                            		    $("#dialog-delete-account").dialog('open');
                        				});

                        				$("#dialog-delete-account").dialog({
                            			autoOpen: false,
                            			modal: true,
                            			buttons: {
                                		"<?php echo osc_esc_js(__('Hapus', 'alterego')); ?>": function() {
                                    	window.location = '<?php echo osc_base_url(true).'?page=user&action=delete&id='.osc_user_id().'&secret='.$user['s_secret']; ?>';
                                		},
                                		"<?php echo osc_esc_js(__('Batal', 'alterego')); ?>": function() {
                                    	    $( this ).dialog( "close" );
                                		    }
                            		    }
                        		    });
                    			});
                			</script>
                			<form action="<?php echo osc_base_url(true); ?>" method="post">
                    		    <input type="hidden" name="page" value="user" />
                    			<input type="hidden" name="action" value="profile_post" />
                    			<fieldset>
								    <div class="row">
                            	        <p>
										    <label for="name"><?php _e('Nama', 'alterego'); ?></label>
                            		        <?php UserForm::name_text(osc_user()); ?>
										</p>
                        		    </div>
                        			<div class="row">
                            	        <p>
										    <label for="email"><?php _e('Namauser', 'alterego'); ?></label>
                            				<span class="update">
                                	    	    <?php echo osc_user_username(); ?><br />
                                				<?php if(osc_user_username()==osc_user_id()) { ?>
                                    			<a href="<?php echo osc_change_user_username_url(); ?>"><?php _e('Modify username', 'alterego'); ?></a>
                                				<?php }; ?>
                            				</span>
										</p>
                        			</div>
									<div class="row">
                            	        <p>
										    <label for="email"><?php _e('E-mail', 'alterego'); ?></label>
                            				<span class="update">
                                	    	    <?php echo osc_user_email(); ?><br />
                                				<a href="<?php echo osc_change_user_email_url(); ?>"><?php _e('Ubah e-mail', 'alterego'); ?></a> <a href="<?php echo osc_change_user_password_url(); ?>" ><?php _e('Modify password', 'alterego'); ?></a>
                            				</span>
										</p>
                        			</div>
                        			<div class="row">
                            	        <p>
										    <label for="user_type"><?php _e('Tipe User', 'alterego'); ?></label>
                            				<?php UserForm::is_company_select(osc_user()); ?>
										</p>
                        			</div>
                        			<div class="row">
                            	        <p>   
										    <label for="phoneMobile"><?php _e('Telpon', 'alterego'); ?></label>
                            	    	    <?php UserForm::mobile_text(osc_user()); ?>
										</p>
                        			</div>
                        			<div class="row">
                            	        <p>        
											<label for="phoneLand"><?php _e('Telpon lainya', 'alterego'); ?></label>
                            	            <?php UserForm::phone_land_text(osc_user()); ?>
										</p>
                        			</div>
                        			<div class="row">
                            	        <p> 
										    <label for="country"><?php _e('Negara', 'alterego'); ?> *</label>
                            	        	<?php UserForm::country_select(osc_get_countries(), osc_user()); ?>
										</p>
                        			</div>
                        			<div class="row">
                            	        <p>
										    <label for="region"><?php _e('Provinsi', 'alterego'); ?> *</label>
                            	            <?php UserForm::region_select(osc_get_regions(), osc_user()); ?>
										</p>
                        		    </div>
                        			<div class="row">
                            	        <p>
										    <label for="city"><?php _e('Kota', 'alterego'); ?> *</label>
                            	    		<?php UserForm::city_select(osc_get_cities(), osc_user()); ?>
										</p>
                        			</div>
                        			<div class="row">
                            	        <p>
										    <label for="city_area"><?php _e('Area Kota', 'alterego'); ?></label>
                            	    		<?php UserForm::city_area_text(osc_user()); ?>
										</p>
                        			</div>
                        			<div class="row">
                            	        <p>
										    <label for="address"><?php _e('Alamat', 'alterego'); ?></label>
                            	    		<?php UserForm::address_text(osc_user()); ?>
										</p>
                        			</div>
                        			<div class="row">
                            	        <p>
										    <label for="webSite"><?php _e('Website', 'alterego'); ?></label>
                            	            <?php UserForm::website_text(osc_user()); ?>
										</p>
                        			</div>
                        			<div class="row">
                            	        </p>
										    <?php UserForm::multilanguage_info($locales, osc_user()); ?>
										</p>
                        			</div>
                        			<div class="row">
                            	        </p>
										    <button id="profile-btn" type="submit"><?php _e('Update', 'alterego'); ?></button>
                            	    		<button id="delete_account" type="button"><?php _e('Hapus akun', 'alterego'); ?></button>
										</p>
                        			</div>
                        		<?php osc_run_hook('user_form'); ?>
								</fieldset>
                			</form>
            			</div>
						<!-- User profile END --> 
        				<div id="dialog-delete-account" title="<?php _e('Hapus Akun', 'alterego'); ?>" class="has-form-actions hide">
            			    <div class="form-horizontal">
                		        <div class="form-row">
                    			    <p><?php _e('Semua data anda akan terhapus, anda yakin?.', 'alterego');?></p>
                				</div>
            			    </div>
        				</div>
					</div>
					<!-- Right sidebar -->
					<div class="right_sidebar" style="margin-top:-76px">
            		    <div id="sidebar">
						    <h2 style="text-align:center;"><?php echo sprintf(__('Selamat Datang %s', 'alterego') ,osc_logged_user_name()); ?></h2>
							<div id="company_logos">
	    					    <form action="<?php echo osc_base_url(true);?>" method="post" enctype="multipart/form-data">
                		    	    <?php company_logos_upload(); ?>
								</form>
							</div>
							<h2 style="text-align:center;"><?php _e('Kontrol Panel', 'alterego'); ?></h2>
							<div class="right_account_element shadow" style="width:295px">
        					    <?php echo osc_private_user_menu(); ?>
    						</div>
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

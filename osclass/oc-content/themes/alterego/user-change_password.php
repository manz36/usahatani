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
					<!-- Content middle -->
					<div class="mid_content">
            		    <!-- Change password -->
						<h1>
                		    <strong><?php _e('Manager akun', 'alterego'); ?></strong>
            			</h1>
            			<div id="main" class="modify_profile">
                		    <h2><?php _e('Ubah password', 'alterego'); ?></h2>
                			<form action="<?php echo osc_base_url(true); ?>" method="post">
                    		    <input type="hidden" name="page" value="user" />
                    			<input type="hidden" name="action" value="change_password_post" />
                    			<fieldset>
                        		    <p>
                            		    <label for="password"><?php _e('Password Lama', 'alterego'); ?> *</label>
                            			<input type="password" name="password" id="password" value="" />
                        			</p>
                        			<p>
                            		    <label for="new_password"><?php _e('Password baru', 'alterego'); ?> *</label>
                            			<input type="password" name="new_password" id="new_password" value="" />
                        			</p>
                        			<p>
                            		    <label for="new_password2"><?php _e('Ulangi password baru', 'alterego'); ?> *</label>
                            			<input type="password" name="new_password2" id="new_password2" value="" />
                        			</p>
                        			<div style="clear:both;"></div>
                        			<button id="deafult-btn" type="submit"><?php _e('Update', 'alterego'); ?></button>
                    			</fieldset>
                			</form>
            			</div>
						<!-- Change password END -->
        			</div>
					<!-- Content middle END -->
					<!-- Right sidebar -->
					<div class="right_sidebar">
            		    <div id="sidebar" style="margin-top:-76px">
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

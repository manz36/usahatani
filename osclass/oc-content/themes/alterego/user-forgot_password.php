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
        			<div class="content user_forms">
            		    <div class="inner">
                		    <h1><?php _e('Reset Password', 'alterego'); ?></h1>
                			<form action="<?php echo osc_base_url(true); ?>" method="post" >
                    		    <input type="hidden" name="page" value="login" />
                    			<input type="hidden" name="action" value="forgot_post" />
                    			<input type="hidden" name="userId" value="<?php echo osc_esc_html(Params::getParam('userId')); ?>" />
                    			<input type="hidden" name="code" value="<?php echo osc_esc_html(Params::getParam('code')); ?>" />
                    			<fieldset>
                        		    <p>
                            		    <label for="new_email"><?php _e('Password baru', 'alterego'); ?></label><br />
                            			<input type="password" name="new_password" value="" />
                        			</p>
                        			<p>
                            		    <label for="new_email"><?php _e('Ulangi Password baru', 'alterego'); ?></label><br />
                            			<input type="password" name="new_password2" value="" />
                        			</p>
                        			<button type="submit"><?php _e('Ubah Password', 'alterego'); ?></button>
                    			</fieldset>
                			</form>
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
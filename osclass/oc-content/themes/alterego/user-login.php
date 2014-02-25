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
					<!-- Login form -->
        			<div class="content user_forms">
            		    <div class="inner">
                	    <h1><?php _e('Masuk ke akun', 'alterego'); ?></h1>
                			<form action="<?php echo osc_base_url(true); ?>" method="post" >
                    			<input type="hidden" name="page" value="login" />
                    			<input type="hidden" name="action" value="login_post" />
                    			<p><label for="email"><?php _e('E-mail', 'alterego'); ?></label> <?php UserForm::email_login_text(); ?></p>
                    			<p><label for="password"><?php _e('Password', 'alterego'); ?></label> <?php UserForm::password_login_text(); ?></p>
                    			<p class="checkbox"><?php UserForm::rememberme_login_checkbox();?> <label for="remember"><?php _e('Ingatkan', 'alterego'); ?></label></p>
                    			<div class="more-login">
                        			<p><a href="<?php echo osc_register_account_url(); ?>"><?php _e("Daftar gratis", 'alterego'); ?></a> · <a href="<?php echo osc_recover_user_password_url(); ?>"><?php _e("Lupa password?", 'alterego'); ?></a></p>
                    			</div>
								<button id="login-btn" type="submit"><?php _e("Log in", 'alterego');?></button>
                			</form>
            			</div>
        			</div>
					<!-- Login form END -->
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

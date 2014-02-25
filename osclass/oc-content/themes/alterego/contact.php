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
					<!-- Contact form -->
					<div class="content user_forms">
            		    <div class="inner">
                		    <h1><?php _e('Hubungi Kami', 'alterego'); ?></h1>
                			<ul id="error_list"></ul>
                			<form action="<?php echo osc_base_url(true); ?>" method="post" name="contact_form">
                    		    <input type="hidden" name="page" value="contact" />
                    			<input type="hidden" name="action" value="contact_post" />
                    			<p><label for="subject"><?php _e('Subject', 'alterego'); ?> (<?php _e('optional', 'alterego'); ?>)</label> <?php ContactForm::the_subject(); ?></p>
                        		<p><label for="message"><?php _e('Pesan', 'alterego'); ?></label> <?php ContactForm::your_message(); ?></p>
                        		<p><label for="yourName"><?php _e('Nama', 'alterego'); ?> (<?php _e('optional', 'alterego'); ?>)</label> <?php ContactForm::your_name(); ?></p>
                        		<p><label for="yourEmail"><?php _e('Alamat email', 'alterego'); ?></label> <?php ContactForm::your_email(); ?></p>
                        		<?php osc_run_hook('contact_form'); ?>
                        		<?php osc_show_recaptcha(); ?>
                        		<button id="contact-btn" type="submit"><?php _e('Kirim', 'alterego'); ?></button>
                        		<?php osc_run_hook('admin_contact_form'); ?>
                    		</form>
            			</div>
        			</div>
        			<?php ContactForm::js_validation(); ?>
					<!-- Contact form END -->
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
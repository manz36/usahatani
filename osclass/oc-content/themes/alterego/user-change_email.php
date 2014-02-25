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
        <script type="text/javascript">
            $(document).ready(function() {
                $('form#change-email').validate({
                    rules: {
                        new_email: {
                            required: true,
                            email: true
                        }
                    },
                    messages: {
                        new_email: {
                            required: '<?php echo osc_esc_js(__("Email: harus di isi", "alterego")); ?>.',
                            email: '<?php echo osc_esc_js(__("Email tidak valid", "alterego")); ?>.'
                        }
                    },
                    errorLabelContainer: "#error_list",
                    wrapper: "li",
                    invalidHandler: function(form, validator) {
                        $('html,body').animate({ scrollTop: $('h1').offset().top }, { duration: 250, easing: 'swing'});
                    },
                    submitHandler: function(form){
                        $('button[type=submit], input[type=submit]').attr('disabled', 'disabled');
                        form.submit();
                    }
                });
            });
        </script>
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
            		    <!-- Change e-mail -->
            			<h1>
                		    <strong><?php _e('Manager akun', 'alterego'); ?></strong>
            			</h1>
            			<div id="main" class="modify_profile">
                		    <h2><?php _e('Ubah e-mail', 'alterego'); ?></h2>
                			<form id="change-email" action="<?php echo osc_base_url(true); ?>" method="post">
                    		    <ul style="float:none;" id="error_list"></ul>
								<input type="hidden" name="page" value="user" />
                    			<input type="hidden" name="action" value="change_email_post" />
                    			<fieldset>
                        		    <p>
                            		    <label for="email"><?php _e('E-mail saat ini', 'alterego'); ?></label>
                            			<span><?php echo osc_logged_user_email(); ?></span>
                        			</p>
                        			<p>
                            		    <label for="new_email"><?php _e('E-mail baru', 'alterego'); ?> *</label>
                            			<input type="text" name="new_email" id="new_email" value="" />
                        			</p>
                        			<div style="clear:both;"></div>
                        			<button id="deafult-btn" type="submit"><?php _e('Update', 'alterego'); ?></button>
                    			</fieldset>
                			</form>
            			</div>
        				<!-- Change e-mail END -->
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
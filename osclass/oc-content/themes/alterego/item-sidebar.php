<?php
    /*
     *      Osclass – software for creating and publishing online classified
     *                           advertising platforms
     *
     *                        Copyright (C) 2013 OSCLASS
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
<div id="sidebar">
    <?php if(!osc_is_web_user_logged_in() || osc_logged_user_id()!=osc_item_user_id()) { ?>
        <form action="<?php echo osc_base_url(true); ?>" method="post" name="mask_as_form" id="mask_as_form">
            <input type="hidden" name="id" value="<?php echo osc_item_id(); ?>" />
            <input type="hidden" name="as" value="spam" />
            <input type="hidden" name="action" value="mark" />
            <input type="hidden" name="page" value="item" />
        </form>
    <?php } ?>
    <div id="company_logos">
	<?php if( osc_images_enabled_at_items() ) { ?>
        <?php if( osc_count_item_resources() > 0 ) { ?>
        <div id="photos">
            <?php for ( $i = 0; osc_has_item_resources(); $i++ ) { ?>
            <a href="<?php echo osc_resource_url(); ?>" rel="image_group" title="<?php _e('Image', 'modern'); ?> <?php echo $i+1;?> / <?php echo osc_count_item_resources();?>">
            <?php if( $i == 0 ) { ?>
                <img src="<?php echo osc_resource_url(); ?>" width="315" alt="<?php echo osc_item_title(); ?>" title="<?php echo osc_item_title(); ?>" />
            <?php } else { ?>
                <img src="<?php echo osc_resource_thumbnail_url(); ?>" width="75" alt="<?php echo osc_item_title(); ?>" title="<?php echo osc_item_title(); ?>" />
            <?php } ?>
            </a>
            <?php } ?>
        </div>
        <?php } ?>
    <?php } ?>
	</div>
	<div id="contact" class="widget-box form-container form-vertical">
        <h2><?php _e("Hubungi Penjual", 'alterego'); ?></h2>
        <?php if( osc_item_is_expired () ) { ?>
            <p>
                <?php _e("Iklan Sudah kadaluarsa, penjual tidak bisa dihubungi.", 'alterego'); ?>
            </p>
        <?php } else if( ( osc_logged_user_id() == osc_item_user_id() ) && osc_logged_user_id() != 0 ) { ?>
            <p>
                <?php _e("Ini Iklan Anda", 'alterego'); ?>
            </p>
        <?php } else if( osc_reg_user_can_contact() && !osc_is_web_user_logged_in() ) { ?>
            <p>
                <?php _e("Anda harus log-in apabila ingin menghubungi penjual", 'alterego'); ?>
            </p>
            <p class="contact_button">
                <strong><a href="<?php echo osc_user_login_url(); ?>"><?php _e('Login', 'alterego'); ?></a></strong>
                <strong><a href="<?php echo osc_register_account_url(); ?>"><?php _e('Daftar baru', 'alterego'); ?></a></strong>
            </p>
        <?php } else { ?>
            <?php if( osc_item_user_id() != null ) { ?>
                <p class="name"><?php _e('Nama', 'alterego') ?>: <a href="<?php echo osc_user_public_profile_url( osc_item_user_id() ); ?>" ><?php echo osc_item_contact_name(); ?></a></p>
            <?php } else { ?>
                <p class="name"><?php printf(__('Nama: %s', 'alterego'), osc_item_contact_name()); ?></p>
            <?php } ?>
            <?php if( osc_item_show_email() ) { ?>
                <p class="email"><?php printf(__('E-mail: %s', 'alterego'), osc_item_contact_email()); ?></p>
            <?php } ?>
            <?php if ( osc_user_phone() != '' ) { ?>
                <p class="phone"><?php printf(__("Telpon: %s", 'alterego'), osc_user_phone()); ?></p>
            <?php } ?>
            <ul id="error_list"></ul>
            <form action="<?php echo osc_base_url(true); ?>" method="post" name="contact_form" id="contact_form" enctype="multipart/form-data" >
                <?php osc_prepare_user_info(); ?>
                 <input type="hidden" name="action" value="contact_post" />
                    <input type="hidden" name="page" value="item" />
                    <input type="hidden" name="id" value="<?php echo osc_item_id(); ?>" />
                <div class="control-group">
                    <label class="control-label" for="yourName"><?php _e('Nama Anda', 'alterego'); ?>:</label>
                    <div class="controls"><?php ContactForm::your_name(); ?></div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="yourEmail"><?php _e('E-mail', 'alterego'); ?>:</label>
                    <div class="controls"><?php ContactForm::your_email(); ?></div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="phoneNumber"><?php _e('Telpon', 'alterego'); ?> (<?php _e('Tambahan', 'alterego'); ?>):</label>
                    <div class="controls"><?php ContactForm::your_phone_number(); ?></div>
                </div>
				<div class="control-group">
                    <label class="control-label" for="message"><?php _e('Pesan', 'alterego'); ?>:</label>
                    <div class="controls textarea"><?php ContactForm::your_message(); ?></div>
                </div>
		   <!-- <div class="control-group">
                   <label class="control-label" for="attachment"><?php _e('Kirim file', 'alterego'); ?>: <span><?php _e('(Hanya PDF)', 'alterego'); ?></span></label>
                   <div class="controls"><?php ContactForm::your_attachment(); ?></div>
                </div> -->
                <div class="control-group">
                    <div class="controls">
                        <?php osc_run_hook('item_contact_form', osc_item_id()); ?>
                        <?php if( osc_recaptcha_public_key() ) { ?>
                        <script type="text/javascript">
                            var RecaptchaOptions = {
                                theme : 'custom',
                                custom_theme_widget: 'recaptcha_widget'
                            };
                        </script>
                        <style type="text/css"> div#recaptcha_widget, div#recaptcha_image > img { width:280px; } </style>
                        <div id="recaptcha_widget">
                            <div id="recaptcha_image"><img /></div>
                            <span class="recaptcha_only_if_image"><?php _e('Ketikan tulisan diatas','alterego'); ?>:</span>
                            <input type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
                            <div><a href="javascript:Recaptcha.showhelp()"><?php _e('Bantuan', 'alterego'); ?></a></div>
                        </div>
                        <?php } ?>
                        <?php osc_show_recaptcha(); ?>
                        <button style="margin-top:20px;" type="submit" id="contact-btn"><?php _e("Kirim", 'alterego');?></button>
                    </div>
                </div>
            </form>
            <?php ContactForm::js_validation(); ?>
        <?php } ?>
    </div>
</div>
<!-- Sidebar END -->
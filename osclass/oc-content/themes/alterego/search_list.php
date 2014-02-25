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

    osc_get_premiums();
    if(osc_count_premiums() > 0) {
?>
<table border="0" cellspacing="0">
     <tbody style="-moz-box-shadow:0px 0px 5px orange;-webkit-box-shadow:0px 0px 5px orange;-o-box-shadow:0px 0px 5px orange;box-shadow:0px 0px 5px orange;-moz-border-radius:10px;-webkit-border-radius:10px;-o-border-radius:10px;border-radius:10px">
        <?php $class = "even"; ?>
        <?php while(osc_has_premiums()) { ?>
            <tr class="premium_<?php echo $class; ?>">
                 <td class="photo">
                    <?php if(osc_count_premium_resources()) { ?>
                        <a href="<?php echo osc_premium_url(); ?>"><img src="<?php echo osc_resource_thumbnail_url(); ?>" width="85" title="<?php echo osc_item_title(); ?>" alt="<?php echo osc_item_title(); ?>" /></a>
                    <?php } else { ?>
                        <img src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" title="" alt="" />
                    <?php } ?>
                 </td>
                 <td class="text">
                     <div class="ad_info"></div>
				         <h4><a href="<?php echo osc_premium_url(); ?>"><?php echo osc_highlight( strip_tags( osc_premium_title() ) ); ?></a><span style="float:right;"><?php _e("Iklan sponsor", "alterego"); ?></span></h4>
                         <p><span class="date"><?php echo osc_format_date(osc_item_pub_date()); ?></span></p>
					     <div class="description">
							 <p><?php echo osc_highlight( strip_tags( osc_premium_description() ) ); ?></p>
							 <!-- <a class="reply" href="javascript:void(0)" onclick="displaymessage(2414);"><?php _e('Balas Iklan', 'alterego'); ?></a> -->
							 <div class="more_info">
								 <a href="<?php echo osc_premium_url(); ?>" title="<?php echo osc_item_title(); ?>" class="button more_info"><?php _e('Info Lebih lanjut', 'alterego'); ?></a>
							 </div>
						 </div>
						 <div class="price">
							 <span class="price"><?php echo osc_premium_formated_price()?></span>
						 </div>
						 <div class="quick_reply"></div>
						 <ul class="q_body">
						     <div class="q_form">
							     <ul id="error_list"></ul>
                        		 <form action="<?php echo osc_base_url(true); ?>" method="post" name="contact_form" id="contact_form">
                            <!-- <div class="q_close"></div> -->
								 <?php osc_prepare_user_info(); ?>
                            	 <fieldset style="border:none;">
                                     <label for="yourName"><?php _e('Nama', 'alterego'); ?>:</label> <?php ContactForm::your_name(); ?>
                                	 <label for="yourEmail"><?php _e('E-mail', 'alterego'); ?>:</label> <?php ContactForm::your_email(); ?>
                                	 <label for="phoneNumber"><?php _e('Telpon', 'alterego'); ?>:</label> <?php ContactForm::your_phone_number(); ?>
                                	 <?php osc_run_hook('item_contact_form', osc_item_id()); ?>
                                	 <label for="message"><?php _e('Pesan', 'alterego'); ?>:</label> <?php ContactForm::your_message(); ?>
                                	 <input type="hidden" name="action" value="contact_post" />
                                	 <input type="hidden" name="page" value="item" />
                                	 <input type="hidden" name="id" value="<?php echo osc_item_id(); ?>" />
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
                                    	 <span class="recaptcha_only_if_image"><?php _e('Ketikan Tulisan Diatas','alterego'); ?>:</span>
                                    	 <input type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
                                    	 <div><a href="javascript:Recaptcha.showhelp()"><?php _e('Bantuan', 'alterego'); ?></a></div>
                                	 </div>
                                	 <?php } ?>
                                	 <?php osc_show_recaptcha(); ?>
                                	 <button style="margin-top:20px;" type="submit" id="contact-btn"><?php _e('Kirim', 'alterego'); ?></button>
                            	 </fieldset>
                        	 	 </form>
							 </div>
						 </ul>
                     </div>
                     </div>
				 </td>
             </tr>
            <?php $class = ($class == 'even') ? 'odd' : 'even'; ?>
        <?php } ?>
    </tbody>
</table>
<?php } ?>
<table border="0" cellspacing="0">
    <tbody>
        <?php $class = "even"; ?>
        <?php while(osc_has_items()) { ?>
            <tr class="<?php echo $class; ?>">
                 <td class="photo">
                    <?php if(osc_count_item_resources()) { ?>
                        <a href="<?php echo osc_item_url(); ?>"><img src="<?php echo osc_resource_thumbnail_url(); ?>" width="85" title="<?php echo osc_item_title(); ?>" alt="<?php echo osc_item_title(); ?>" /></a>
                    <?php } else { ?>
                        <img src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" title="" alt="" />
                    <?php } ?>
                 </td>
                 <td class="text">
                     <div class="ad_info"></div>
				         <h4><a href="<?php echo osc_item_url(); ?>"><?php echo osc_item_title(); ?></a></h4>
                         <p><span class="date"><?php echo osc_format_date(osc_item_pub_date()); ?></span></p>
					     <div class="description">
							 <p><?php echo osc_highlight( strip_tags( osc_item_description() ) ); ?></p>
							 <!-- <a class="reply" href="javascript:void(0)" onclick="displaymessage(2414);"><?php _e('Balas Iklan', 'alterego'); ?></a> -->
							 <div class="more_info">
								 <a href="<?php echo osc_item_url(); ?>" title="<?php echo osc_item_title(); ?>" class="button more_info"><?php _e('Info Lebih Lanjut', 'alterego'); ?></a>
							 </div>
						 </div>
						 <div class="price">
							 <span class="price"><?php echo osc_item_formated_price()?></span>
						 </div>
						 <div class="quick_reply"></div>
						 <ul class="q_body">
						     <div class="q_form">
							     <ul id="error_list"></ul>
                        		 <form action="<?php echo osc_base_url(true); ?>" method="post" name="contact_form" id="contact_form">
                            <!-- <div class="q_close"></div> -->
								 <?php osc_prepare_user_info(); ?>
                            	 <fieldset style="border:none;">
                                     <label for="yourName"><?php _e('Nama', 'alterego'); ?>:</label> <?php ContactForm::your_name(); ?>
                                	 <label for="yourEmail"><?php _e('E-mail', 'alterego'); ?>:</label> <?php ContactForm::your_email(); ?>
                                	 <label for="phoneNumber"><?php _e('Telpon', 'alterego'); ?>:</label> <?php ContactForm::your_phone_number(); ?>
                                	 <?php osc_run_hook('item_contact_form', osc_item_id()); ?>
                                	 <label for="message"><?php _e('Pesan', 'alterego'); ?>:</label> <?php ContactForm::your_message(); ?>
                                	 <input type="hidden" name="action" value="contact_post" />
                                	 <input type="hidden" name="page" value="item" />
                                	 <input type="hidden" name="id" value="<?php echo osc_item_id(); ?>" />
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
                                    	 <span class="recaptcha_only_if_image"><?php _e('Ketikan Tulisan Diatas','alterego'); ?>:</span>
                                    	 <input type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
                                    	 <div><a href="javascript:Recaptcha.showhelp()"><?php _e('Bantuan', 'alterego'); ?></a></div>
                                	 </div>
                                	 <?php } ?>
                                	 <?php osc_show_recaptcha(); ?>
                                	 <button style="margin-top:20px;" type="submit" id="contact-btn"><?php _e('Kirim', 'alterego'); ?></button>
                            	 </fieldset>
                        	 	 </form>
							 </div>
						 </ul>
                     </div>
				 </td>
             </tr>
            <?php $class = ($class == 'even') ? 'odd' : 'even'; ?>
        <?php } ?>
    </tbody>
</table>

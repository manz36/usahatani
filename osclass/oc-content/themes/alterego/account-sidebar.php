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
	<h2 style="text-align:center;"><?php echo sprintf(__('Selamat Datang %s', 'alterego') ,osc_logged_user_name()); ?></h2>
	<div id="company_logos">
	    <a href="<?php echo osc_user_public_profile_url('osc_item_user_id()'); ?>" ><?php company_logos_show(); ?></a>
	</div>
	<h2 style="text-align:center;"><?php _e('Kontrol Panel', 'alterego'); ?></h2>
	<div class="right_account_element shadow" style="width:295px">
        <?php echo osc_private_user_menu(); ?>
    </div>
</div>
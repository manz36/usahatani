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
<!-- Header -->
<div class="header">
    <!-- Wrapper -->
	<div class="wrapper">
	    <!-- Logo -->
	    <div class="logo">
	        <h1>
			    <a href="<?php echo osc_base_url(); ?>"><?php echo logo_header(); ?></a>
	        </h1>
		</div>
		<!-- Logo END -->
	    <!-- Menu -->
		<div class="top_menu">
        	<!-- Menu left side -->
			<div class="top_menu_left"></div>
			<!-- Left side END -->
			<!-- Menu main -->
            <div class="top_menu_main">
            	<ul>
                	<li><a href="<?php echo osc_base_url(); ?>"><?php _e('Utama', 'alterego') ; ?></a></li>
                    <li><a href="<?php echo osc_item_post_url_in_category() ; ?>"><?php _e('Pasang Iklan', 'alterego') ; ?><span class="Gratis"></span></a></li>
                    <li><a href="<?php echo osc_search_url(); ?>"><?php _e('Cari', 'alterego') ; ?></a></li>
					<li>
					    <?php osc_get_static_page('faq'); ?>
						<a href="<?php echo osc_static_page_url(); ?>"><?php _e('FAQ', 'alterego') ; ?></a>
					</li>
                    <li>
					    <?php osc_get_static_page('Cara Kerja'); ?>
						<a href="<?php echo osc_static_page_url(); ?>"><?php _e('Cara Kerja', 'alterego') ; ?></a></li>
                    <li class="last-child"><a href="<?php echo osc_contact_url();?>"><?php _e('Kontak Kami', 'alterego') ; ?></a></li>
                </ul>
            </div> 
			<!-- Menu main END -->
			<!-- Menu right side -->
            <div class="top_menu_right"></div>
			<!-- Right side END -->
        </div>
		<!-- Menu END -->
	    <!-- Quote -->
		<div class="quote">
		    <?php _e('"Tempat Jual-beli petani Indonesia"', 'alterego') ; ?>
		</div>
		<!-- Quote END -->
    </div>
	<!-- Wrapper END -->
</div>
<!-- Header END -->
<!-- Flash message -->
<div class="forcemessages-inline">
    <?php osc_show_flash_message(); ?>
</div>
<script type="text/javascript">
    $(".flashmessage .ico-close").click(function(){$(this).parent().hide();});
</script>
<!-- Flash message END -->
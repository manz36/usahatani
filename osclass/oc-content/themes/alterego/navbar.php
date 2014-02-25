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
<!-- Navbar -->
<div class="nav_bar">
	<!-- Wrapper -->
    <div class="wrapper">
		<!-- Navbar menu --> 
	    <div class="navbar_menu">
		    <a class="active" href="#"><?php _e('Pencarian, ', 'alterego') ; ?><span class="drop"><?php _e('Kategori', 'alterego') ; ?></span></a>
			<ul class="subcat shadow">
			    <?php if ( osc_count_categories() > 0 ) { ?>
				<?php while ( osc_has_categories() ) { ?>
				<li><a class="category <?php echo osc_category_slug() ; ?>" href="<?php echo osc_search_category_url() ; ?>"><?php echo osc_category_name() ; ?> <span>(<?php echo osc_category_total_items() ; ?>)</span></a>
				    <ul class="shadow">
					<?php if ( osc_count_subcategories() > 0 ) { if (osc_count_subcategories() > $count_max) { $count_max = osc_count_subcategories();} ?>                
                        <?php while ( osc_has_subcategories() ) { ?>
                           <li><a class="category cat_<?php echo osc_category_id(); ?>" href="<?php echo osc_search_category_url(); ?>"><?php echo osc_category_name(); ?></a></li>
                        <?php } ?>
                     <?php } ?>
					</ul>
				</li>
				<?php } ?> 
                <?php } ?>
			</ul>
		</div>
		<!-- nav category ends -->
        <div class="navbar_search">
            <form action="<?php echo osc_base_url(true); ?>" method="get" onsubmit="return doSearch()" class="nocsrf">
                <input type="hidden" name="page" value="search" />
                <input type="hidden" name="sOrder" value="<?php echo osc_esc_html(osc_search_order()); ?>" />
                <input type="hidden" name="iOrderType" value="<?php $allowedTypesForSorting = Search::getAllowedTypesForSorting(); echo osc_esc_html($allowedTypesForSorting[osc_search_order_type()]); ?>" />
                <?php foreach(osc_search_user() as $userId) { ?>
                    <input type="hidden" name="sUser[]" value="<?php echo osc_esc_html($userId); ?>" />
                <?php } ?>
				<!-- <div class="category-selector">
		            <?php osc_categories_select('sCategory', null, __('Semua', 'alterego')); ?>
				</div> -->
        		<input type="text" class="text" placeholder="Ketik disni untuk pencarian" name="sPattern" id="query" value="<?php echo osc_esc_html( osc_search_pattern() ); ?>" />
                <div id="search-example"></div>
				<div style="-moz-user-select: none;" id="uniform-undefined" class="button">
					<span>Search<button style="opacity: 0;" class="submit" type="submit">Search</button></span>
				</div>
			</form>
        </div>
		<!-- nav search ends -->
        <div class="navbar_menu fleft">
        	<ul>
            <?php if(osc_users_enabled()) { ?>
            <?php if( osc_is_web_user_logged_in() ) { ?>
                <li class="first logged">
                    <a href="<?php echo osc_user_dashboard_url(); ?>"><?php echo sprintf(__('Hello %s', 'alterego'), osc_logged_user_name() . '!'); ?><span class="rtarrow"><?php _e('Akun Saya', 'alterego'); ?></span></a>
                </li>
				<li>
					<a href="<?php echo osc_user_logout_url(); ?>"><?php _e('Terima Kasih!', 'alterego'); ?><span class="rtarrow"><?php _e('Keluar', 'alterego'); ?></span></a>
                </li>
            <?php } else { ?>
                <li class="first">
                    <a id="login_open" href="<?php echo osc_user_login_url(); ?>"><?php _e('Hallo! Masuk disini', 'alterego'); ?><span class="drop"><?php _e('Account Anda', 'alterego'); ?></span></a>
                    <?php if(osc_user_registration_enabled()) { ?>
                        <li>
						<a href="<?php echo osc_register_account_url(); ?>"><?php _e('Daftar Baru', 'alterego'); ?><span class="rtarrow"><?php _e('Daftar Baru', 'alterego'); ?></span></a>
                        </li>
					<?php }; ?>
                    <form id="login" class="shadow" action="<?php echo osc_base_url(true); ?>" method="post">
                        <input type="hidden" name="page" value="login" />
                        <input type="hidden" name="action" value="login_post" />
                        <label for="email"><?php _e('E-mail', 'alterego'); ?></label><br/>
                        <?php UserForm::email_login_text(); ?><br/>
                        <label for="password"><?php _e('Password', 'alterego'); ?></label><br/>
                        <?php UserForm::password_login_text(); ?>
                        <p class="checkbox"><?php UserForm::rememberme_login_checkbox();?> <label style="float:none;" for="remember"><?php _e('Ingatkan', 'alterego'); ?></label></p>
                        <button id="login-btn" style="opacity:0" type="submit"><?php _e('Masuk', 'alterego'); ?></button>
                        <div class="forgot">
                            <a href="<?php echo osc_recover_user_password_url(); ?>"><?php _e("Lupa password?", 'alterego');?></a>
                        </div>
                    </form>
                </li>
            <?php } ?>
            <?php } ?>
			</ul>
        </div>
    </div><!-- .wrapper ends -->
</div><!-- Nav-Bar Ends -->
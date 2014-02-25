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

    define('ALTEREGO_THEME_VERSION', '1.0');

    if( !OC_ADMIN ) {
        if( !function_exists('add_close_button_action') ) {
            function add_close_button_action(){
                echo '<script type="text/javascript">';
                    echo '$(".flashmessage .ico-close").click(function(){';
                        echo '$(this).parent().hide();';
                    echo '});';
                echo '</script>';
            }
            osc_add_hook('footer', 'add_close_button_action');
        }
    }

    function theme_alterego_actions_admin() {
        if( Params::getParam('file') == 'oc-content/themes/alterego/admin/settings.php' ) {
            if( Params::getParam('donation') == 'successful' ) {
                osc_set_preference('donation', '1', 'alterego_theme');
                osc_reset_preferences();
            }
        }

        switch( Params::getParam('action_specific') ) {
            case('settings'):
                $footerLink  = Params::getParam('footer_link');
                $defaultLogo = Params::getParam('default_logo');
                osc_set_preference('keyword_placeholder', Params::getParam('keyword_placeholder'), 'alterego_theme');
                osc_set_preference('footer_link', ($footerLink ? '1' : '0'), 'alterego_theme');
                osc_set_preference('default_logo', ($defaultLogo ? '1' : '0'), 'alterego_theme');

                osc_add_flash_ok_message(__('Theme settings updated correctly', 'alterego'), 'admin');
                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/alterego/admin/settings.php'));
            break;
            case('upload_logo'):
                $package = Params::getFiles('logo');
                if( $package['error'] == UPLOAD_ERR_OK ) {
                    if( move_uploaded_file($package['tmp_name'], WebThemes::newInstance()->getCurrentThemePath() . "images/logo.jpg" ) ) {
                        osc_add_flash_ok_message(__('The logo image has been uploaded correctly', 'alterego'), 'admin');
                    } else {
                        osc_add_flash_error_message(__("An error has occurred, please try again", 'alterego'), 'admin');
                    }
                } else {
                    osc_add_flash_error_message(__("An error has occurred, please try again", 'alterego'), 'admin');
                }
                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/alterego/admin/header.php'));
            break;
            case('remove'):
                if(file_exists( WebThemes::newInstance()->getCurrentThemePath() . "images/logo.jpg" ) ) {
                    @unlink( WebThemes::newInstance()->getCurrentThemePath() . "images/logo.jpg" );
                    osc_add_flash_ok_message(__('The logo image has been removed', 'alterego'), 'admin');
                } else {
                    osc_add_flash_error_message(__("Image not found", 'alterego'), 'admin');
                }
                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/alterego/admin/header.php'));
            break;
        }
    }
    osc_add_hook('init_admin', 'theme_alterego_actions_admin');
    osc_admin_menu_appearance(__('Header logo', 'alterego'), osc_admin_render_theme_url('oc-content/themes/alterego/admin/header.php'), 'header_alterego');
    osc_admin_menu_appearance(__('Theme settings', 'alterego'), osc_admin_render_theme_url('oc-content/themes/alterego/admin/settings.php'), 'settings_alterego');

    if( !function_exists('logo_header') ) {
        function logo_header() {
            $html = '<img border="0" alt="' . osc_page_title() . '" src="' . osc_current_web_theme_url('images/logo.jpg') . '" />';
            if( file_exists( WebThemes::newInstance()->getCurrentThemePath() . "images/logo.jpg" ) ) {
                return $html;
            } else if( osc_get_preference('default_logo', 'alterego_theme') && (file_exists( WebThemes::newInstance()->getCurrentThemePath() . "images/default-logo.jpg")) ) {
                return '<img border="0" alt="' . osc_page_title() . '" src="' . osc_current_web_theme_url('images/default-logo.jpg') . '" />';
            } else {
                return osc_page_title();
            }
        }
    }

    // install update options
    if( !function_exists('alterego_theme_install') ) {
        function alterego_theme_install() {
            osc_set_preference('keyword_placeholder', __('ie. PHP Programmer', 'alterego'), 'alterego_theme');
            osc_set_preference('version', alterego_THEME_VERSION, 'alterego_theme');
            osc_set_preference('footer_link', true, 'alterego_theme');
            osc_set_preference('donation', '0', 'alterego_theme');
            osc_set_preference('default_logo', '1', 'alterego_theme');
            osc_reset_preferences();
        }
    }

    if(!function_exists('check_install_alterego_theme')) {
        function check_install_alterego_theme() {
            $current_version = osc_get_preference('version', 'alterego_theme');
            //check if current version is installed or need an update<
            if( !$current_version ) {
                alterego_theme_install();
            }
        }
    }
    check_install_alterego_theme();

?>
<?php

    

    function chosen_region_select() {
        View::newInstance()->_exportVariableToView('list_regions', Search::newInstance()->listRegions('%%%%', '>=', 'region_name ASC') ) ;
        
        if( osc_count_list_regions() > 0 ) {
            echo '<select name="sRegion" data-placeholder="' . __('Choose Your City...', 'carmaster') . '" style="" class="region-select"">' ;
            echo '<option value="">Choose Your City</option>' ;
            while( osc_has_list_regions() ) {
                echo '<option value="' . osc_list_region_name() . '">' . osc_list_region_name() . '</option>' ;
            }
            echo '</select>' ;
        }
        
        View::newInstance()->_erase('list_regions') ;
    }

    if( !function_exists('item_detail_location') ) {
        /*
         * @return array the list of location: starting with the address and finishing with the country
         */
        function item_detail_location() {
            $location = array() ;
            if( osc_item_address() != '' ) {
                $location[] = osc_item_address() ;
            }
            if( osc_item_city_area() != '' ) {
                $location[] = osc_item_city_area() ;
            }
            if( osc_item_city() != '' ) {
                $location[] = osc_item_city() ;
            }
            if( osc_item_region() != '' ) {
                $location[] = osc_item_region() ;
            }
            if( osc_item_country() != '' ) {
                $location[] = osc_item_country() ;
            }
            
            return $location ;
        }
    }

?>
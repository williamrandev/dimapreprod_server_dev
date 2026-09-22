{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
<div id="_desktop_language_selector">
  <div class="language-selector-wrapper">
    <div class="language-selector dropdown js-dropdown">
      <button data-toggle="dropdown" class="langs hidden-sm-down btn-unstyle" aria-haspopup="true" aria-expanded="false">
        <img src="{$smarty.const._PS_BASE_URL_SSL_}/img/l/{$current_language.id_lang}.jpg" 
             alt="{$current_language.iso_code}" class="language-flag">
      </button>
      <ul class="dropdown-menu">
        {foreach from=$languages item=language}
          <li {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
            {if isset($urls.alternative_langs) && isset($urls.alternative_langs[$language.language_code])}
              <a href="{$urls.alternative_langs[$language.language_code]}" class="dropdown-item" rel="nofollow">
            {else}
              <a href="{url entity='language' id=$language.id_lang}" class="dropdown-item" rel="nofollow">
            {/if}
              <img src="{$smarty.const._PS_BASE_URL_SSL_}/img/l/{$language.id_lang}.jpg" 
                   alt="{$language.iso_code}" class="language-flag">
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
  </div>
</div>


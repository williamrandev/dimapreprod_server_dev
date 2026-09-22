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
<div id="_desktop_cart">
  <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}"
       data-refresh-url="{$refresh_url}">

    <div class="header">
      {if $cart.products_count > 0}
        <a rel="nofollow"
           aria-label="{l s='Shopping cart link containing %nbProducts% product(s)' sprintf=['%nbProducts%' => $cart.products_count] d='Shop.Theme.Checkout'}"
           href="{$cart_url}">
      {/if}

        <img src="/themes/default-bootstrap/img/header/panier.png" alt="Panier"
             class="cart-icon" width="30" height="30">

        <span class="hidden-sm-down">
          {if $language.iso_code=='fr'}Mon panier{else}My cart{/if}
        </span>

        <span class="cart-products-count">{$cart.products_count}</span>

      {if $cart.products_count > 0}
        </a>
      {/if}
    </div>

    {if $cart.products_count > 0}
    <div class="body cart-dropdown">
      <ul class="cart-products">
        {foreach from=$cart.products item=product}
          <li class="blockcart-list-products">
            {include 'module:ps_shoppingcart/ps_shoppingcart-product-line.tpl' product=$product}
          </li>
          <br>
        {/foreach}
      </ul>
      <div class="cart-separator"></div>
      <div style="height: 30px;">
        {if isset($cart.subtotals.shipping)}
            <span class="cart-shipping-label">
                {$cart.subtotals.shipping.label}
            </span>
            <span class="cart-shipping-value">
                {$cart.subtotals.shipping.value}
            </span>
        {/if}
      </div>
      <div class="cart-separator"></div>
      <div class="cart-total" style="height: 40px;">
        <span style="float: left;font-size: 13px;text-transform: none;font-family: Arial, Helvetica, sans-serif;">{$cart.totals.total.label}</span>
        <span style="float: right;font-family: Arial, Helvetica, sans-serif;font-size: 13px;color: #777;">{$cart.totals.total.amount} €</span>
      </div>

      <div class="cart-buttons">
        {* <a href="{$cart_url}" class="btn btn-primary btn-block"> *}
        <a href="{url entity='order'}" class="btn btn-primary btn-block" style="text-transform: none;">
          {if $language.iso_code=='fr'}Commander{else}Order{/if}
        </a>
      </div>
    </div>
    {/if}

  </div>
</div>

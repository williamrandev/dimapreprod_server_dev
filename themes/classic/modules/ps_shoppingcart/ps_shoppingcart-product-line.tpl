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
<img src="{$product.cover.bySize.cart_default.url}" alt="{$product.name|escape:'html'}" loading="lazy" style="height: max-content;">
<div style="position: relative;top: -5px;">
    <span style="font-size: 16px;">{$product.quantity}</span>
    <span style="font-size: 10px;"> x</span>
</div>
    <span class="product-name" style="flex: 1;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"><a href="{$product.url}" style="color: inherit;">{$product.name}</a>
    <br>
    {if isset($product.attributes) && is_array($product.attributes)}
        {foreach from=$product.attributes item=value}
            <span class="product-attributes-cart-preview"><a href="{$product.url}" style="color: inherit;">{$value}</a></span>
        {/foreach}
    {/if}
    <br>
    <span style="height: auto;font-size: 13px;color: #777;white-space: nowrap;">{$product.price}</span>
    </span>
<a class="remove-from-cart"
    rel="nofollow"
    href="{$product.remove_from_cart_url}"
    data-link-action="remove-from-cart"
    title="{l s='remove from cart' d='Shop.Theme.Actions'}">
    <button style="border: none;out" class="remove-from-cart-button">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
        viewBox="0 0 24 24" fill="none" stroke="currentColor"
        stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <polyline points="3 6 5 6 21 6"/>
        <path d="M19 6l-1 14a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2L5 6"/>
        <path d="M10 11v6"/>
        <path d="M14 11v6"/>
        <path d="M9 6V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/>
        </svg>
    </button>
</a>

{if $product.customizations|count}
    <div class="customizations">
        <ul>
            {foreach from=$product.customizations item='customization'}
                <li>
                    <span class="product-quantity">{$customization.quantity}</span>
                    <a href="{$customization.remove_from_cart_url}" title="{l s='remove from cart' d='Shop.Theme.Actions'}" class="remove-from-cart" rel="nofollow"></a>
                    <ul>
                        {foreach from=$customization.fields item='field'}
                            <li>
                                <span>{$field.label}</span>
                                {if $field.type == 'text'}
                                    <span>{$field.text nofilter}</span>
                                {elseif $field.type == 'image'}
                                    <img src="{$field.image.small.url}" loading="lazy">
                                {/if}
                            </li>
                        {/foreach}
                    </ul>
                </li>
            {/foreach}
        </ul>
    </div>
{/if}

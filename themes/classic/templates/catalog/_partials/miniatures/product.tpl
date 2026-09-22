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
{block name='product_miniature_item'}
<div class="js-product product{if !empty($productClasses)} {$productClasses}{/if}">
  <article class="product-miniature js-product-miniature" style=" height: 100%;
    display: flex;
    flex-direction: column;" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
    <div class="thumbnail-container" style="  display: flex;
    flex-direction: column;
    flex-grow: 1;
    justify-content: space-between;">

      <div class="ProductName" style="display: flex;
    flex-direction: column;">
      {block name='product_name'}
        {if $page.page_name == 'index'}
          <h3 class="h3 product-title"><a href="{$product.url}" content="{$product.url}">{$product.name}</a></h3>
        {else}
          <h2 class="h3 product-title"><a href="{$product.url}" content="{$product.url}">{$product.name}</a></h2>
        {/if}
      {/block}

      </div>
      <div class="thumbnail-top">
      {block name='product_thumbnail'}
        {if $product.cover}
          <a href="{$product.url}" class="thumbnail product-thumbnail">
            <!-- Conteneur des images -->
            <div class="product-images-container">
              <!-- Image principale -->
              <picture class="main-image">
                {if !empty($product.cover.bySize.home_default.sources.avif)}<source srcset="{$product.cover.bySize.home_default.sources.avif}" type="image/avif">{/if}
                {if !empty($product.cover.bySize.home_default.sources.webp)}<source srcset="{$product.cover.bySize.home_default.sources.webp}" type="image/webp">{/if}
                <img
                  src="{$product.cover.bySize.home_default.url}"
                  alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name}{/if}"
                  loading="lazy"
                  data-full-size-image-url="{$product.cover.large.url}"
                  width="{$product.cover.bySize.home_default.width}"
                  height="{$product.cover.bySize.home_default.height}"
                  class="img-fluid primary-img"
                />
              </picture>
    
              <!-- Deuxième image (si elle existe) -->
              {if count($product.images) > 1}
                {assign var="secondImage" value=$product.images[1]}
                <picture class="second-image">
                  {if !empty($secondImage.bySize.home_default.sources.avif)}<source srcset="{$secondImage.bySize.home_default.sources.avif}" type="image/avif">{/if}
                  {if !empty($secondImage.bySize.home_default.sources.webp)}<source srcset="{$secondImage.bySize.home_default.sources.webp}" type="image/webp">{/if}
                  <img
                    src="{$secondImage.bySize.home_default.url}"
                    alt="{if !empty($secondImage.legend)}{$secondImage.legend}{else}{$product.name}{/if}"
                    loading="lazy"
                    data-full-size-image-url="{$secondImage.large.url}"
                    width="{$secondImage.bySize.home_default.width}"
                    height="{$secondImage.bySize.home_default.height}"
                    class="img-fluid secondary-img"
                  />
                </picture>
              {/if}
            </div>
          </a>
        {else}
          <!-- ... (votre code existant pour les produits sans image) ... -->
        {/if}
      {/block}
    
      <!-- ... (le reste de votre code existant) ... -->
    </div>
    <form action="{$urls.pages.cart}" method="post" class="add-to-cart-or-refresh AddPanier">
      <input type="hidden" name="token" value="{$static_token}">
      <input type="hidden" name="id_product" value="{$product.id_product}">
      <input type="hidden" name="id_product_attribute" value="0">
      <input type="hidden" name="qty" value="1">
      <input type="hidden" name="add" value="1">
      <div class="product-description" style=" margin-top: auto;align-self: flex-end;width: 100%;position: absolute; margin-left: -15px !important;">
        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="LittleDescription">
              <span>{if $language.iso_code == 'fr'}
                    à partir de
                {else}
                    from
                {/if}</span>
            </div>
            <div class="product-price-and-shipping">
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                
                {if $product.discount_type === 'percentage'}
                  <span class="discount-percentage discount-product" style="color: #dc3545 !important; margin: 0 4px !important; display: inline-block;">{$product.discount_percentage}</span>
                {elseif $product.discount_type === 'amount'}
                  <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                {/if}
              {/if}

              {hook h='displayProductPriceBlock' product=$product type="before_price"}

              <span class="price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
                {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
                {if '' !== $smarty.capture.custom_price}
                  {$smarty.capture.custom_price nofilter}
                {else}
                  {$product.price}
                {/if}
              </span>

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

              {hook h='displayProductPriceBlock' product=$product type='weight'}
            </div>
          {/if}
        {/block}

        {block name='product_reviews'}
          {hook h='displayProductListReviews' product=$product}
        {/block}
      </div>

      {include file='catalog/_partials/product-flags.tpl'}
      <div>
        <button
          class="btn btn-primary add-to-cart"
          data-button-action="add-to-cart"
          type="submit">
          <img src="/img/ajout_panier.png" alt="ajoutpanier">
        </button>
      </div>
    </form>
    </div>
  </article>
</div>
{/block}


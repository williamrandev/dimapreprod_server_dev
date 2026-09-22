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
{extends file=$layout}

{block name='head' append}
  <meta property="og:type" content="product">
  {if $product.cover}
    <meta property="og:image" content="{$product.cover.large.url}">
  {/if}

  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
    <meta property="product:weight:value" content="{$product.weight}">
    <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='head_microdata_special'}
  {include file='_partials/microdata/product-jsonld.tpl'}
{/block}

{block name='content'}

  <section id="main">
    <meta content="{$product.url}">

    <div class="row product-container js-product-container">
  
      <div class="pb-left-column col-md-5 ">
        
        {*  affichage des logos produits *}
        <div class="hidden-print" style="width: 18.5%; float: left;">
          {hook h='displayProductleftsideimagesPosition' product=$product}
        </div>
        {*fin  d'affichage des logos produits*}
        

        {block name='page_content_container'}
          <section class="page-content" col-md-10 id="content">
            {block name='page_content'}
              {include file='catalog/_partials/product-flags.tpl'}

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
              <div class="scroll-box-arrows">
                <i class="material-icons left">&#xE314;</i>
                <i class="material-icons right">&#xE315;</i>
              </div>

            {/block}
          </section>
        {/block}
      </div>
      <div class="col-md-7">
        <div class="col-md-8">
          {*assign var="mots" value=" "|explode:$product.name}
          {assign var="nb_mots" value=$mots|@count}
          {assign var="index_milieu" value=($nb_mots/2)|ceil}
          {assign var="partie_1" value=$mots|array_slice:0:$index_milieu}
          {assign var="partie_2" value=$mots|array_slice:$index_milieu}
          {assign var="nom_final" value=(" "|implode:$partie_1)|cat:"<br>"|cat:(" "|implode:$partie_2)*}

          {block name='page_header_container'}
            {block name='page_header'}
              <h1 class="h1">
                {block name='page_title'}
                  {$product.name nofilter}
                {/block}
              </h1>
            {/block}
          {/block}

          {block name='product_details'}
            {include file='catalog/_partials/product-details.tpl'}
          {/block}
          <div class="product-information">
            {block name='product_description_short'}
              {hook h='displayDimaDescription' product=$product}
              <div id="product-description-short-{$product.id}" class="product-description">
                {$product.description_short nofilter}</div>
            {/block}

            {if $product.is_customizable && count($product.customizations.fields)}
              {block name='product_customization'}
                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
              {/block}
            {/if}

            <div class="product-actions js-product-actions">
              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}"
                    id="product_customization_id" class="js-product-customization-id">

                  {block name='product_prices'}
                    {include file='catalog/_partials/product-prices.tpl'}
                  {/block}

                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                          {/block}
                        {/foreach}
                      </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}

                  {* {block name='product_attributes_selection'}
                      {include file='catalog/_partials/product-attributes-selection.tpl'}
                    {/block} *}

                  {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                  {/block}

                  {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                  {/block}

                  {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                  {block name='product_refresh'}{/block}
                </form>
              {/block}

            </div>

            {block name='hook_display_reassurance'}
              {hook h='displayReassurance'}
            {/block}
          </div>
        </div>
        <div class="col-md-4">
          <div class="colonne-pictos-produit">
          {block name='product_attachments'}
              {if $product->show_price }
                <div class="row vertical-align">
                  <div class="col-md-3 ligne-picto blocpicto">
                    <img src="{$urls.img_url}ppicto1.png" alt="image ppicto" />
                  </div>

                  
                  {if $language.iso_code == 'fr'}
                    <div class="col-md-9 ligne-picto">
                        <span id="printFichePrice" onclick='printToPDF()'>{l s='Fiche Produit ( Avec Prix)'}</span>
                    </div>

                  {elseif $language.iso_code == 'en'}
                    <div class="col-md-9 ligne-picto">
                        <span id="printFichePrice" onclick='printToPDF()'>{l s='data Sheet ( with Price)'}</span>
                    </div>
                  {/if}
                  

                </div>
              {/if}
              <div class="row vertical-align">
                <div class="col-md-3 ligne-picto blocpicto">
                  <img src="{$urls.img_url}ppicto1.png" alt="image ppicto" />
                </div>
                <div class="col-md-9 ligne-picto">
                {if $language.iso_code == 'fr'}
                  <span id="printFiche" onclick='printToPDF1()'>{l s='Fiche Produit  ( Sans Prix)'}</span>
                  {elseif $language.iso_code == 'en'}
                    <span id="printFiche" onclick='printToPDF1()'>{l s='Data  ( Without Prix)'}</span>
                    {/if}
                </div>
              </div>
{hook h='displayProductDocuments' product=$product}
              <!-- Affichage des listes pdf via ajax
              <div id="resultats">

              </div>
              fin d'Affichage des listes pdf via ajax -->
              
              {if isset($product.reference_to_display)}
                <script>
                  var productReference = '{$product.reference_to_display|escape:'htmlall':'UTF-8'}';
                </script>
                {else}
                <script>
                  var productReference = '';
                </script>
              {/if}

            {/block}
            {*END FICHE PRODUIT*}
          </div>
            <div class="footerPrint">
            </div>
        </div>
      </div>
    </div>

    
    {block name='product_tabs'}
      <div class="tabs">
        {*<ul class="nav nav-tabs" role="tablist">
          {if $product.description}
            <li class="nav-item">
              <a class="nav-link{if $product.description} active js-product-nav-active{/if}" data-toggle="tab"
                href="#description" role="tab" aria-controls="description" {if $product.description} aria-selected="true"
                {/if}>{l s='Description' d='Shop.Theme.Catalog'}</a>
            </li>
          {/if}
          <li class="nav-item">
            <a class="nav-link{if !$product.description} active js-product-nav-active{/if}" data-toggle="tab"
              href="#product-details" role="tab" aria-controls="product-details" {if !$product.description}
              aria-selected="true" {/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
          </li>
          {if $product.attachments}
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#attachments" role="tab"
                aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
            </li>
          {/if}
          {foreach from=$product.extraContent item=extra key=extraKey}
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#extra-{$extraKey}" role="tab"
                aria-controls="extra-{$extraKey}">{$extra.title}</a>
            </li>
          {/foreach}
        </ul>*}

        <div class="tab-content" id="tab-content">
          <div class="tab-pane fade in{if $product.description} active js-product-tab-active{/if}" id="description"
            role="tabpanel" style="padding-top: 0;">
            {block name='product_description'}
              <div class="product-description">{$product.description nofilter}</div>
            {/block}
          </div>

          {block name='product_details'}
            {include file='catalog/_partials/product-details.tpl'}
          {/block}

          {block name='product_attachments'}
            {if $product.attachments}
              <div class="tab-pane fade in" id="attachments" role="tabpanel">
                <section class="product-attachments">
                  <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                  {foreach from=$product.attachments item=attachment}
                    <div class="attachment">
                      <h4><a
                          href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a>
                      </h4>
                      <p>{$attachment.description}</p>
                      <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                        {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                      </a>
                    </div>
                  {/foreach}
                </section>
              </div>
            {/if}
          {/block}

          {foreach from=$product.extraContent item=extra key=extraKey}
            <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel"
              {foreach $extra.attr as $key => $val} {$key}="{$val}" {/foreach}>
              {$extra.content nofilter}
            </div>
          {/foreach}
        </div>
      </div>
    {/block}

    







<div class="customized-product-addons-block">
    {if isset($accessories) && $accessories}
      <div class="produits-similaires produits-similaires-container col-md-6 pr-0 pl-0">
        <div class="row">
          <div class="col-md-12">
            <h2 class="accessoire-block-tittle">{if $language.iso_code == 'fr'}Produits complémentaires{else}Complementary Products{/if}</h2>
          </div>
        </div>
        {foreach from=$accessories item=accessory}
          <div class="accessoire product-miniature col-md-4 ps-accessoire" data-id-product="{$accessory.id_product}">
            <a href="{$link->getProductLink($accessory.id_product)}" class="accessoire-link">
            <h5 class="accessoire-name">{$accessory.name}</h5>
              <img src="{$link->getImageLink($accessory.link_rewrite, $accessory.id_image, 'home_default')}" alt="" />

              <div class="price_container prod_price">
                {if $accessory.show_price}
                  {if isset($accessory.specific_prices.reduction) && $accessory.specific_prices.reduction > 0}
                    <span class="reduce">{$accessory.price_without_reduction_formatted}</span>
                  {/if}
                  <span class="price">
                    {if !$priceDisplay}
                      {$accessory.price_formatted}
                    {else}
                      {$accessory.price_tax_exc_formatted}
                    {/if}
                  </span>
                {/if}
              </div>
            </a>

            <form action="{$urls.pages.cart}" method="post" class="ajax-add-to-cart product-miniature-cart accessoire-form">
              <input type="hidden" name="token" value="{$static_token}">
              <input type="hidden" name="id_product" value="{$accessory.id_product}">
              <input type="hidden" name="qty" value="1">
              <input type="hidden" name="add" value="1">

              <button
                class="btn btn-primary add-to-cart-btn"
                type="submit"
                data-button-action="add-to-cart"
                data-id-product="{$accessory.id_product}">
                <img src="/img/ajout_panier.png" alt="{l s='Add to cart' mod='suggestedproducts'}">
              </button>
            </form>
          </div>
        {/foreach}
      </div>
    {/if}

    {literal}
      <script>
        $(document).ready(function() {
          $('.sameHeight').matchHeight();
        });
      </script>

    {/literal}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}
</div>

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>

{/block}
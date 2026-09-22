{*
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
      <div class="col-md-6">

      {* Logo produit start *}
      {* <div class="col-md-2 hidden-print">
				<div class="logos-produit">

					{foreach from=$logo_produits item=logo_produit}
						<div>
							<img src="{$logo_produit}" />
						</div>
					{/foreach}

					{* mmsb *}
					{* <div id="obsAttrDescs">
					{foreach from=$imglg key=idAttr item=imglgi}
							<div style="display:none" id="obsAttrLg_{$idAttr}">{$imglgi}</div>
					{/foreach}
					</div>
					<script>

					function obsShowDesc10(select, text) {
						if($('.obsAttrRadio').length == 0) {
							if($('#obsAttrLgGroup_'+$(select).attr('name')).length)
								$('#obsAttrLgGroup_'+$(select).attr('name')).html(text);
							else
								//$(select).after('<div id="obsAttrDescGroup_'+$(select).attr('name')+'" class="obsDescElement">'+text+'</div>');
								$('.logos-produit').append('<div id="obsAttrLgGroup_'+$(select).attr('name')+'" class="obsDescElement">'+text+'</div>');
						}
					}

					function obsHideDesc10(select) {
						if($('#obsAttrLgGroup_'+$(select).attr('name')).length)
							$('#obsAttrLgGroup_'+$(select).attr('name')).html('');
					}

					$('document').ready( function() {
						$('#attributes select').change(function() {
							value = $(this).val();
							if($('#obsAttrLg_'+value).length) {
								text = $('#obsAttrLg_'+value).html();
								if(text != ''){
									obsShowDesc10(this, text);
								}else{
									obsHideDesc10(this);
								}
							}

							$( '#obsAttrImgs > div' ).hide();

							$( '#obsAttrImgs > div[data-id="'+value+'"]' ).slideDown(800);

						});

						$('#attributes select').trigger('change');
					});


					</script> *}

					{*
					<ul class="bxslider-vertical">
					{if $product->id==1}
						<li><div><img src="{$img_dir}logo1.png" /></div><div><img src="{$img_dir}logo2.png" /></div><div><img src="{$img_dir}logo3.png" /></div><div><img src="{$img_dir}logo4.png" /></div><div><img src="{$img_dir}pictobas1.png" /></div><div><img src="{$img_dir}pictobas2.png" /></div></li>
						<li><div><img src="{$img_dir}pictobas3.png" /></div><div><img src="{$img_dir}fournisseur.jpg" /></div><div></div><div></div><div></div><div></div></li>
					{/if}
					</ul>
					*}
				{* </div>

			</div>  *}
      {* Logo produit end *}
        {block name='page_content_container'}
          <section class="page-content" id="content">
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
        <div class="col-md-6 product-text" style="float: none;
        background: #fff;">
  <div class="box1">
    <p class="paraText" style="color: red;">Exclusivité web !</p>
      {block name='page_header_container'}
        {block name='page_header'}
          <h1 class="title-h1">{block name='page_title'}{$product.name}{/block}</h1>
        {/block}
      {/block}
      <div class="product-information">
        {block name='product_description_short'}
          <div id="product-description-short-{$product.id}" class="descprod" style="margin-top:15px;">
            {$product.description_short nofilter}
          </div>
        {/block}
          <p id="reference-product">
            <label class="reference" style="font-weight:bold;">REF :</label>
            <span class="edites">COM00010</span>
          </p>
          <p style="font-weight:bold; color:red;">EXCLUSIVITÉ INTERNET - LE TAPIS LE MOINS CHER DU MARCHÉ</p>

        <p style="margin-top:20px;">
          <a href="#" style="color: blue !important;!i;!;text-decoration: none;">Fabriqué en France par Dima</a>
        </p>

        {block name='product_prices'}
          <div class="product-prices" style="display:flex; font-size:24px; font-weight:bold; margin-top:15px;">
            <div class="ttc">
              <span id="our_price_display" class="prices" itemprop="price" content="546">546,00 €</span>
              <sup class="supttc"> TTC</sup>
            </div>
            <div class="ht">
              <span class="priceht"> 455,00 € </span>
              <sup class="supht">HT</sup>
            </div>
          </div>
        {/block}

        <div class="product-actions js-product-actions" style="margin-top:20px;">
          {block name='product_buy'}
            <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
              <input type="hidden" name="token" value="{$static_token}">
              <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
              <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id" class="js-product-customization-id">

              <div class="product-quantity">
                <label for="quantity_wanted">Quantité :</label>
                <input type="number" name="qty" id="quantity_wanted" value="1" min="1" style="/* width: 65px; *//* margin-left: 10px; */displa;/* display: block; */width: 78px;height: 27px;padding: 0 6px;float: left;border: 1px solid #d6d4d4;line-height: 27px;">
              </div>

              {block name='product_variants'}
                {include file='catalog/_partials/product-variants.tpl'}
              {/block}

              {block name='product_add_to_cart'}
                <div class="product-buttons" style="margin-top:20px;display: flex;;">
                  <button type="submit" class="btn btn-primary" style="font-weight: 600;
                    font-size: 15px;
                    line-height: 22px;
                    padding: 12px 36px 14px 36px;
                    color: #fff;
                    background: #d50c1c;
                    display: block !important;
                    font-family: &quot;Open Sans&quot;, sans-serif;
                    text-transform: uppercase;
                    -moz-transition: all 0.3s ease;
                    -o-transition: all 0.3s ease;
                    -webkit-transition: all 0.3s ease;
                    transition: all 0.3s ease;">
                    AJOUTER AU PANIER
                  </button>
                </div>
              {/block}

              {block name='product_pack'}
                {if $packItems}
                  <section class="product-pack">
                    {foreach from=$packItems item="product_pack"}
                      {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                    {/foreach}
                  </section>
                {/if}
              {/block}

              {block name='product_discounts'}
                {include file='catalog/_partials/product-discounts.tpl'}
              {/block}

              {block name='product_additional_info'}
                {include file='catalog/_partials/product-additional-info.tpl'}
              {/block}

            </form>
          {/block}
        </div>

        {block name='hook_display_reassurance'}
          {hook h='displayReassurance'}
        {/block}
      </div>
  </div>

        <div class="box2">
            
        </div>
      </div>
    </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix">
          <p class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
          <div class="products row">

          <div> <h1 class="h1">{$category.name}</h1></div>
            {foreach from=$accessories item="product_accessory" key="position"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position productClasses="col-xs-12 col-sm-6 col-lg-4 col-xl-3"}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

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

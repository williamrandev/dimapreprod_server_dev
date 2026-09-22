{*
 * This file allows you to customize your search page.
 * You can safely remove it if you want it to appear exactly like all other product listing pages
 *}
{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
  <div class="search-header-flex" style="display: flex; justify-content: space-between; align-items: baseline; border-bottom: 1px solid #ddd; padding-bottom: 10px; margin-bottom: 60px; margin-top: 20px;">
    <h1 id="js-product-list-header" class="h2" style="margin: 0;">
      {if $language.iso_code == 'en'}Search results{else}Résultats de la recherche{/if}
    </h1>
    <div class="total-results" style="font-size: 0.9rem; color: #333; font-weight: 600;">
      {$listing.pagination.total_items} {if $language.iso_code == 'en'}results were found.{else}résultats ont été trouvés.{/if}
    </div>
  </div>
{/block}

{block name="error_content"}
  <h4 id="product-search-no-matches">{l s='No matches were found for your search' d='Shop.Theme.Catalog'}</h4>
  <p>{l s='Please try other keywords to describe what you are looking for.' d='Shop.Theme.Catalog'}</p>
{/block}

{block name='product_list'}
  {include file='catalog/_partials/products.tpl' listing=$listing productClass="col-xs-12 col-sm-6 col-xl-3"}
{/block}

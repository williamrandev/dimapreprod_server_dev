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
<div id="js-product-list" {if $page.page_name == 'search'}style="left:0 !important; width: 100% !important;"{/if}>
{if $page.page_name != 'search'}
  <div id="Categorie_tittle"> <h1 class="h1">{$category.name}</h1></div>
{/if}

<div>
{*<div class="row sort-by-row">
      {block name='sort_by'}
        {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
      {/block}
      {if !empty($listing.rendered_facets)}
        <div class="col-xs-4 col-sm-3 hidden-md-up filter-button">
          <button id="search_filter_toggler" class="btn btn-secondary js-search-toggler">
            {l s='Filter' d='Shop.Theme.Actions'}
          </button>
        </div>
      {/if}
    </div>*}
    <div>
   {block name='pagination'}
    {include file='_partials/pagination.tpl' pagination=$listing.pagination}
  {/block}
   </div> 
</div>
  {include file="catalog/_partials/productlist.tpl" products=$listing.products cssClass="row"}

  {block name='pagination'}
    {include file='_partials/pagination.tpl' pagination=$listing.pagination}
  {/block}

  <div class="hidden-md-up text-xs-right up">
    <a href="#header" class="btn btn-secondary">
      {l s='Back to top' d='Shop.Theme.Actions'}
      <i class="material-icons">&#xE316;</i>
    </a>
  </div>
</div>

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

 <span class="col-sm-3 col-md-5 hidden-sm-down sort-by">
 {l s='Sort by:' d='Shop.Theme.Global'}
</span>

<div class="{if !empty($listing.rendered_facets)}col-xs-8 col-sm-7{else}col-xs-12 col-sm-12{/if} col-md-9 products-sort-order dropdown">

 {* Déterminer le label personnalisé du tri sélectionné *}
{assign var="sort_selected_label" value=''}

{foreach from=$listing.sort_orders item=sort_order}
  {if $sort_order.current}
    {assign var="url" value=$sort_order.url}

    {if $language.iso_code == 'fr'}
      {if strpos($url, 'order=product.price.asc') !== false}
        {assign var="sort_selected_label" value="Le moins cher"}
      {elseif strpos($url, 'order=product.price.desc') !== false}
        {assign var="sort_selected_label" value="Le plus cher"}
      {elseif strpos($url, 'order=product.name.asc') !== false}
        {assign var="sort_selected_label" value="De A à Z"}
      {elseif strpos($url, 'order=product.name.desc') !== false}
        {assign var="sort_selected_label" value="De Z à A"}
      {else}
        {assign var="sort_selected_label" value=$sort_order.label}
      {/if}
    {else}
      {if strpos($url, 'order=product.price.asc') !== false}
        {assign var="sort_selected_label" value="Price: lowest first"}
      {elseif strpos($url, 'order=product.price.desc') !== false}
        {assign var="sort_selected_label" value="Price: highest first"}
      {elseif strpos($url, 'order=product.name.asc') !== false}
        {assign var="sort_selected_label" value="Product Name: A to Z"}
      {elseif strpos($url, 'order=product.name.desc') !== false}
        {assign var="sort_selected_label" value="Product Name: Z to A"}
      {else}
        {assign var="sort_selected_label" value=$sort_order.label}
      {/if}
    {/if}

  {/if}
{/foreach}



<button
class="btn-unstyle select-title"
rel="nofollow"
data-toggle="dropdown"
aria-label="{l s='Sort by selection' d='Shop.Theme.Global'}"
aria-haspopup="true"
aria-expanded="false"
>
{if $sort_selected_label}{$sort_selected_label}{else}{l s='Choisir' d='Shop.Theme.Actions'}{/if}
<i class="material-icons float-xs-right" {if $page.page_name == 'search'}style="position: absolute !important; left: 12em !important;"{/if}>&#xE5C5;</i>
</button>


 <div class="dropdown-menu">

   {* Déclaration des tableaux temporaires *}
   {assign var="price_sorts" value=[]}
   {assign var="name_sorts" value=[]}

{foreach from=$listing.sort_orders item=sort_order}
  {assign var="url" value=$sort_order.url}
  {assign var="label" value=$sort_order.label}

  {* Virer les tris inutiles *}
  {if 
    strpos($url, 'order=product.reference.asc') !== false ||
    strpos($url, 'order=product.reference.desc') !== false ||
    strpos($url, 'order=product.sales.desc') !== false ||
    strpos($url, 'order=product.position.asc') !== false
  }
    {continue}
  {/if}

  {* Labels traduits *}
  {if $language.iso_code == 'fr'}

    {if strpos($url, 'order=product.price.asc') !== false}
      {assign var="label" value="Le moins cher"}
      {assign var="price_sorts" value=$price_sorts|@array_merge:[['url'=>$url,'label'=>$label,'current'=>$sort_order.current]]}

    {elseif strpos($url, 'order=product.price.desc') !== false}
      {assign var="label" value="Le plus cher"}
      {assign var="price_sorts" value=$price_sorts|@array_merge:[['url'=>$url,'label'=>$label,'current'=>$sort_order.current]]}

    {elseif strpos($url, 'order=product.name.asc') !== false}
      {assign var="label" value="De A à Z"}
      {assign var="name_sorts" value=$name_sorts|@array_merge:[['url'=>$url,'label'=>$label,'current'=>$sort_order.current]]}

    {elseif strpos($url, 'order=product.name.desc') !== false}
      {assign var="label" value="De Z à A"}
      {assign var="name_sorts" value=$name_sorts|@array_merge:[['url'=>$url,'label'=>$label,'current'=>$sort_order.current]]}

    {/if}

  {else}

    {if strpos($url, 'order=product.price.asc') !== false}
      {assign var="label" value="Price: lowest first"}
      {assign var="price_sorts" value=$price_sorts|@array_merge:[['url'=>$url,'label'=>$label,'current'=>$sort_order.current]]}

    {elseif strpos($url, 'order=product.price.desc') !== false}
      {assign var="label" value="Price: highest first"}
      {assign var="price_sorts" value=$price_sorts|@array_merge:[['url'=>$url,'label'=>$label,'current'=>$sort_order.current]]}

    {elseif strpos($url, 'order=product.name.asc') !== false}
      {assign var="label" value="Product name: A to Z"}
      {assign var="name_sorts" value=$name_sorts|@array_merge:[['url'=>$url,'label'=>$label,'current'=>$sort_order.current]]}

    {elseif strpos($url, 'order=product.name.desc') !== false}
      {assign var="label" value="Product name: Z to A"}
      {assign var="name_sorts" value=$name_sorts|@array_merge:[['url'=>$url,'label'=>$label,'current'=>$sort_order.current]]}

    {/if}

  {/if}
{/foreach}


   {* Affichage dans l’ordre désiré *}
   {foreach from=$price_sorts item=sort}
     <a rel="nofollow" href="{$sort.url}" class="select-list {['current' => $sort.current, 'js-search-link' => true]|classnames}">
       {$sort.label}
     </a>
   {/foreach}
   {foreach from=$name_sorts item=sort}
     <a rel="nofollow" href="{$sort.url}" class="select-list {['current' => $sort.current, 'js-search-link' => true]|classnames}">
       {$sort.label}
     </a>
   {/foreach}

 </div>
</div>

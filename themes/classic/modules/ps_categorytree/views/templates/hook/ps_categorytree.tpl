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

{function name="categories" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
      <ul class="category-sub-menu">
        {foreach from=$nodes item=node}
          <li data-depth="{$depth}">
            {if $depth===0 || $depth===1}
              {*{$node|@var_dump}*}
              <a href="{$node.link|escape:'html':'UTF-8'}" title="{$node.desc|strip_tags|trim|truncate:255:'...'|escape:'html':'UTF-8'}">{$node.name|escape:'html':'UTF-8'}</a>
              {if $node.children}
                <div class="navbar-toggler collapse-icons" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="material-icons add">&#xE145;</i>
                  <i class="material-icons remove">&#xE15B;</i>
                </div>
                <div class="collapse" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {else}
              <a class="category-sub-link" href="{$node.link|escape:'html':'UTF-8'}" title="{$node.desc|strip_tags|trim|truncate:255:'...'|escape:'html':'UTF-8'}"><i class="fa fa-chevron-right" aria-hidden="true"></i>{$node.name|escape:'html':'UTF-8'}</a>

              {if $node.children}
                <span class="arrows" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="material-icons arrow-right">&#xE315;</i>
                  <i class="material-icons arrow-down">&#xE313;</i>
                </span>
                <div class="collapse" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {/if}
          </li>
        {/foreach}
      </ul>
    {/if}
  {/strip}
{/function}

<div class="block-categories">
  <ul class="category-top-menu">
    {*<li><a class="text-uppercase h6" href="{$categories.link nofilter}">{$categories.name}</a></li>*}
    <li>{categories nodes=$categories.children}</li>
    {literal}
      <script type="text/javascript">
        function relief()
        {
          var pageurl = location.href;
          var dnl = document.getElementsByTagName("a");
          //alert(dnl.length);
          for(i = 0; i < dnl.length;i++)
          {
            var x = dnl.item(i);
  
            if(x.href == pageurl)
            {
              x.style.color = "#d5292f";
              x.style.fontWeight = "bold";
              x.style.background = "#f6f6f6";
            }
          }
        }
        window.onload=relief;
        //alert("ok");
      </script>
      {/literal}
  </ul>
</div>

{* CUSTOM ADDITIONAL DESCRIPTION START *}


{* CUSTOM ADDITIONAL DESCRIPTION END *}



{if $category.description2}
  <div class="seo-categorie-colonne" style="padding: 20px;background: #FFF;font-size: 13px; color: #000;">
    {$category.description2 nofilter}
  </div>
{/if}


<style type="text/css">
  .seo-categorie-colonne p {
    color: #000 !important;
  }
  #left-column .block-categories .category-top-menu #exCollapsingNavbar{$category.id},
  #left-column .block-categories .category-top-menu #exCollapsingNavbar{$category.id_parent}
  {
    display: block;
  }
</style>


{*$category|@var_dump*}

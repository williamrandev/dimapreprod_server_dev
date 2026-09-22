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
{extends file='customer/page.tpl'}

{block name='breadcrumb'}
  {assign var="last_index" value=$breadcrumb.count-1}
  {capture assign="breadcrumb_title"}
    {if $language.iso_code == 'fr'}
      {l s='Mes factures' d='Shop.Theme.Customeraccount'}
    {else}
      {l s='My invoices' d='Shop.Theme.Customeraccount'}
    {/if}
  {/capture}
  {$breadcrumb.links.$last_index.title = $breadcrumb_title}
  {$smarty.block.parent}
{/block}

{block name='page_title'}
  {if $language.iso_code == 'fr'}
    {l s='Mes factures' d='Shop.Theme.Customeraccount'}
  {else}
    {l s='My invoices' d='Shop.Theme.Customeraccount'}
  {/if}
{/block}

{block name='page_content'}

  {if $credit_slips}
    <table class="table table-striped table-bordered hidden-sm-down">
      <thead class="thead-default">
        <tr>
          <th>{l s='Order' d='Shop.Theme.Customeraccount'}</th>
          <th>{l s='Credit slip' d='Shop.Theme.Customeraccount'}</th>
          <th>{l s='Date issued' d='Shop.Theme.Customeraccount'}</th>
          <th>{l s='View credit slip' d='Shop.Theme.Customeraccount'}</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$credit_slips item=slip}
          <tr>
            <td><a href="{$slip.order_url_details}" data-link-action="view-order-details">{$slip.order_reference}</a></td>
            <td scope="row">{$slip.credit_slip_number}</td>
            <td>{$slip.credit_slip_date}</td>
            <td class="text-sm-center">
              <a href="{$slip.url}"><i class="material-icons">&#xE415;</i></a>
            </td>
          </tr>
        {/foreach}
      </tbody>
    </table>
    <div class="credit-slips hidden-md-up">
      {foreach from=$credit_slips item=slip}
        <div class="credit-slip">
          <ul>
            <li>
              <strong>{l s='Order' d='Shop.Theme.Customeraccount'}</strong>
              <a href="{$slip.order_url_details}" data-link-action="view-order-details">{$slip.order_reference}</a>
            </li>
            <li>
              <strong>{l s='Credit slip' d='Shop.Theme.Customeraccount'}</strong>
              {$slip.credit_slip_number}
            </li>
            <li>
              <strong>{l s='Date issued' d='Shop.Theme.Customeraccount'}</strong>
              {$slip.credit_slip_date}
            </li>
            <li>
              <a href="{$slip.url}">{l s='View credit slip' d='Shop.Theme.Customeraccount'}</a>
            </li>
          </ul>
        </div>
      {/foreach}
    </div>
  {else}
    <div class="alert alert-info">
    {if $language.iso_code == 'fr'}
      {l s='Pour vos factures d\'achat, veuillez consulter votre' d='Shop.Theme.Customeraccount'} 
      <a href="{$urls.pages.history}" style="text-decoration: underline; font-weight: bold;">{l s='historique de commandes' d='Shop.Theme.Customeraccount'}</a>.
      <br>
      {l s='Ci-dessous vous trouverez vos factures d\'annulation ou de retour (avoirs).' d='Shop.Theme.Customeraccount'}
    {else}
      {l s='For your purchase invoices, please consult your' d='Shop.Theme.Customeraccount'} 
      <a href="{$urls.pages.history}" style="text-decoration: underline; font-weight: bold;">{l s='order history' d='Shop.Theme.Customeraccount'}</a>.
      <br>
      {l s='Below you will find your invoices for cancellations or returns (credit slips).' d='Shop.Theme.Customeraccount'}
    {/if}
  </div>
  {/if}
{/block}

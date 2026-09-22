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

{block name='page_title'}
  {l s='Order history' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <h6>{l s='Here are the orders you\'ve placed since your account was created.' d='Shop.Theme.Customeraccount'}</h6>

  {if $orders}
    <div class="orders-count-summary" style="background-color: #f4fafd; border: 1px solid #d4edf7; border-left: 4px solid #2fb5d2; padding: 12px 18px; margin: 15px 0 20px 0; border-radius: 4px; display: flex; align-items: center; justify-content: start; flex-wrap: wrap; gap: 10px;">
      <div style="display: flex; align-items: center; gap: 8px;">
        <i class="material-icons" style="color: #2fb5d2; font-size: 24px; vertical-align: middle;">shopping_cart</i>
        <span style="font-weight: 600; font-size: 15px; color: #232323;">
          {if (isset($lang_iso) && $lang_iso == 'fr') || (isset($language) && $language.iso_code == 'fr')}
            Nombre total de commandes envoyées :
          {else}
            {l s='Total orders placed:' d='Shop.Theme.Customeraccount'}
          {/if}
        </span>
      </div>
      <div>
        <span class="badge badge-primary tag tag-primary" style="background-color: #2fb5d2; color: #ffffff; font-size: 14px; font-weight: 700; padding: 6px 14px; border-radius: 20px;">
          {count($orders)} {if count($orders) > 1}{if (isset($lang_iso) && $lang_iso == 'fr') || (isset($language) && $language.iso_code == 'fr')}commandes{else}{l s='orders' d='Shop.Theme.Checkout'}{/if}{else}{if (isset($lang_iso) && $lang_iso == 'fr') || (isset($language) && $language.iso_code == 'fr')}commande{else}{l s='order' d='Shop.Theme.Checkout'}{/if}{/if}
        </span>
      </div>
    </div>

    <table class="table table-striped table-bordered table-labeled hidden-sm-down">
      <thead class="thead-default">
        <tr>
          <th>{l s='Order reference' d='Shop.Theme.Checkout'}</th>
          <th>{l s='Date' d='Shop.Theme.Checkout'}</th>
          <th>{l s='Total price' d='Shop.Theme.Checkout'}</th>
          <th class="hidden-md-down">{l s='Payment' d='Shop.Theme.Checkout'}</th>
          <th class="hidden-md-down">{l s='Status' d='Shop.Theme.Checkout'}</th>
          {* <th>{l s='Invoice' d='Shop.Theme.Checkout'}</th> *}
          <th>&nbsp;</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$orders item=order}
          <tr>
            <th scope="row">{$order.details.reference}</th>
            <td>{$order.details.order_date}</td>
            <td class="text-xs-right">{$order.totals.total.value}</td>
            <td class="hidden-md-down">{$order.details.payment}</td>
            <td>
              <span
                class="label label-pill {$order.history.current.contrast}"
                style="background-color:{$order.history.current.color}"
              >
                {$order.history.current.ostate_name}
              </span>
            </td>
            {* <td class="text-sm-center hidden-md-down"> 
              {if $order.details.invoice_url}
                <a href="{$order.details.invoice_url}"><i class="material-icons">&#xE415;</i></a>
              {else}
                -
              {/if}
            </td>*}
            <td class="text-sm-center order-actions">
              <a class="view-order-details-link" href="{$order.details.details_url}" data-link-action="view-order-details">
                {l s='Details' d='Shop.Theme.Customeraccount'}
              </a>
              {if $order.details.reorder_url}
                <a class="reorder-link" href="{$order.details.reorder_url}">{l s='Reorder' d='Shop.Theme.Actions'}</a>
              {/if}
            </td>
          </tr>
        {/foreach}
      </tbody>
    </table>

    <div class="orders hidden-md-up">
      {foreach from=$orders item=order}
        <div class="order">
          <div class="row">
            <div class="col-xs-10">
              <a href="{$order.details.details_url}"><h3>{$order.details.reference}</h3></a>
              <div class="date">{$order.details.order_date}</div>
              <div class="total">{$order.totals.total.value}</div>
              <div class="status">
                <span
                  class="label label-pill {$order.history.current.contrast}"
                  style="background-color:{$order.history.current.color}"
                >
                  {$order.history.current.ostate_name}
                </span>
              </div>
            </div>
            <div class="col-xs-2 text-xs-right">
                <div>
                  <a href="{$order.details.details_url}" data-link-action="view-order-details" title="{l s='Details' d='Shop.Theme.Customeraccount'}">
                    <i class="material-icons">&#xE8B6;</i>
                  </a>
                </div>
                {if $order.details.reorder_url}
                  <div>
                    <a href="{$order.details.reorder_url}" title="{l s='Reorder' d='Shop.Theme.Actions'}">
                      <i class="material-icons">&#xE863;</i>
                    </a>
                  </div>
                {/if}
            </div>
          </div>
        </div>
      {/foreach}
    </div>
  {else}
    <div class="alert alert-info" role="alert" data-alert="info">{l s='You have not placed any orders.' d='Shop.Notifications.Warning'}</div>
  {/if}
{/block}

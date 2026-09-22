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
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <ul class="ps-alert-success">
    {foreach $successes as $success}
      <li class="item">
        <i>
          <svg viewBox="0 0 24 24">
            <path fill="#fff" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
          </svg>
        </i>
        <p>{$success}</p>
      </li>
    {/foreach}
  </ul>
{/block}

{block name='page_footer'}
  <style>
    /* Page footer - Back to login link */
  .page-footer,
  #content-wrapper .page-footer {
    margin-top: 25px !important;
    padding: 0 !important;
  }

  .page-footer .account-link,
  #back-to-login,
  a.account-link {
    font-family: Arial, Helvetica, sans-serif !important;
    font-size: 13px !important;
    font-weight: 400 !important;
    color: #fff !important;
    background-color: #2765ad !important;
    border-radius: 4px !important;
    padding: 9px 16px !important;
    text-decoration: none !important;
    align-items: center !important;
    gap: 5px !important;
    transition: background-color 0.2s ease, box-shadow 0.2s ease !important;
    box-shadow: 0 1px 2px rgba(0,0,0,0.15) !important;
  }

  .page-footer .account-link:hover,
  #back-to-login:hover,
  a.account-link:hover {
    background-color: #1f4565 !important;
    border-color: #163550 !important;
    color: #fff !important;
    text-decoration: none !important;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2) !important;
  }

  .page-footer .account-link .material-icons,
  #back-to-login .material-icons {
    font-size: 16px !important;
    color: #fff !important;
  }
</style>
  <a id="back-to-login" href="{$urls.pages.authentication}" class="account-link">
    <i class="material-icons">&#xE5CB;</i>
    <span>{l s='Back to login' d='Shop.Theme.Actions'}</span>
  </a>
{/block}
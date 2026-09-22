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

{block name='page_header_container'}
<style>
  /* ========== PAGE RESET MOT DE PASSE - INLINE CSS ========== */

    #content.page-content{
    background-color: #fff !important;
    border-radius: 0 !important;
    padding: 18px !important;
    box-shadow: none !important;
  }


  /* Page title */
  .page-header h1,
  #content-wrapper .page-header h1 {
    font-family: 'Noto Sans', Arial, Helvetica, sans-serif !important;
    font-size: 18px !important;
    font-weight: 700 !important;
    color: #333 !important;
    text-transform: uppercase !important;
    letter-spacing: 0.5px !important;
    border-bottom: none !important;
    margin-bottom: 0 !important;
    padding-bottom: 0 !important;
  }

  /* Main content card */
  /* Remove duplicate backgrounds */
  .page-content.card {
    border: none !important;
    box-shadow: none !important;
    padding: 0 !important;
  }

  /* Description text */
  .forgotten-password .send-renew-password-link,
  .forgotten-password header p {
    font-family: Arial, Helvetica, sans-serif !important;
    font-size: 13px !important;
    color: #555 !important;
    margin-bottom: 20px !important;
    line-height: 1.5 !important;
    padding: 0;
  }

  /* Error list hidden when empty */
  .ps-alert-error:empty,
  .ps-alert-error {
    display: none;
  }
  .ps-alert-error:not(:empty) {
    display: block !important;
  }
  .ps-alert-error .item {
    background-color: #f2dede !important;
    border: 1px solid #ebccd1 !important;
    color: #d5292f !important;
    padding: 10px 15px !important;
    margin-bottom: 15px !important;
    border-radius: 0 !important;
    list-style: none !important;
  }

  /* Form fields section */
  .forgotten-password .form-fields {
    margin-bottom: 0 !important;
  }

  .forgotten-password .center-email-fields {
    display: flex !important;
    flex-direction: column !important;
    align-items: flex-start !important;
    gap: 0 !important;
    margin-bottom: 0;
  }

  /* Label "Adresse e-mail" */
  .forgotten-password .form-control-label,
  .forgotten-password label {
    font-family: Arial, Helvetica, sans-serif !important;
    font-size: 14px !important;
    font-weight: 700 !important;
    color: #333 !important;
    text-transform: none !important;
    margin-bottom: 6px !important;
    padding: 0 !important;
    width: auto !important;
    text-align: left !important;
  }

  /* Required asterisk style */
  .forgotten-password .form-control-label::after {
    content: '' !important;
  }

  /* Email input field */
  .forgotten-password .email,
  .forgotten-password .col-md-5.email {
    padding: 0 !important;
    width: auto !important;
    margin-bottom: 18px !important;
  }

  .forgotten-password input[type="email"],
  .forgotten-password .form-control {
    font-family: Arial, Helvetica, sans-serif !important;
    font-size: 14px !important;
    width: 280px !important;
    max-width: 100% !important;
    height: 34px !important;
    padding: 6px 10px !important;
    border: 1px solid #aaa !important;
    border-radius: 0 !important;
    background-color: #fff !important;
    color: #333 !important;
    box-shadow: inset 0 1px 2px rgba(0,0,0,0.075) !important;
    outline: none !important;
    transition: border-color 0.2s ease !important;
  }

  .forgotten-password input[type="email"]:focus {
    border-color: #66afe9 !important;
    box-shadow: inset 0 1px 2px rgba(0,0,0,0.075), 0 0 6px rgba(102,175,233,0.6) !important;
  }

  /* Submit button "Récupérer" */
  .forgotten-password .btn-primary,
  .forgotten-password .form-control-submit,
  .forgotten-password button[type="submit"] {
    font-family: Arial, Helvetica, sans-serif !important;
    font-size: 14px !important;
    font-weight: 400 !important;
    color: #fff !important;
    background-color: #d5292f !important;
    background-image: none !important;
    border-radius: 4px !important;
    padding: 8px 18px !important;
    cursor: pointer !important;
    text-transform: none !important;
    letter-spacing: 0 !important;
    line-height: 1.4 !important;
    align-items: center !important;
    gap: 6px !important;
    transition: background-color 0.2s ease, box-shadow 0.2s ease !important;
    box-shadow: 0 1px 2px rgba(0,0,0,0.15) !important;
    width: auto !important;
  }

  .forgotten-password .btn-primary:hover,
  .forgotten-password .form-control-submit:hover,
  .forgotten-password button[type="submit"]:hover {
    background-color: #a93226 !important;
    border-color: #922b21 !important;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2) !important;
  }

  .forgotten-password .btn-primary:active,
  .forgotten-password button[type="submit"]:active {
    background-color: #922b21 !important;
    box-shadow: inset 0 2px 3px rgba(0,0,0,0.2) !important;
  }

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

  /* Hide mobile-only button on desktop */
  .forgotten-password .hidden-xs-down {
    display: inline-flex !important;
  }
  .forgotten-password .hidden-sm-up {
    display: none !important;
  }

  /* Responsive adjustments */
  @media (max-width: 767px) {
    .forgotten-password input[type="email"],
    .forgotten-password .form-control {
      width: 100% !important;
    }

    .forgotten-password .hidden-xs-down {
      display: none !important;
    }
    .forgotten-password .hidden-sm-up {
      display: inline-flex !important;
    }

    .page-content,
    #content {
      padding: 15px !important;
    }
  }
  .page-subheading {
    font-family: "Open Sans", sans-serif;
    font-weight: 600;
    text-transform: uppercase;
    color: #555454;
    font-size: 18px;
    padding: 0 0 15px;
    line-height: normal;
    margin-bottom: 12px;
    border-bottom: 1px solid #d6d4d4;
    display: block;
    text-align: left;
}
</style>
{/block}

{block name='page_title'}
  {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <form action="{$urls.pages.password}" class="forgotten-password" method="post" style="padding: 0;">

    <ul class="ps-alert-error">
      {foreach $errors as $error}
        <li class="item">
          <i>
            <svg viewBox="0 0 24 24">
              <path fill="#fff" d="M11,15H13V17H11V15M11,7H13V13H11V7M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20Z"></path>
            </svg>
          </i>
          <p>{$error}</p>
        </li>
      {/foreach}
    </ul>
    <h1 class="page-subheading">Mot de passe oublié ?</h1>
    <header>
      <p class="send-renew-password-link">{l s='Please enter the email address you used to register. You will receive a temporary link to reset your password.' d='Shop.Theme.Customeraccount'}</p>
    </header>

    <section class="form-fields">
      <div class="form-group center-email-fields">
        <label class="col-md-3 form-control-label required">{l s='Email address' d='Shop.Forms.Labels'}</label>
        <div class="col-md-5 email">
          <input type="email" name="email" id="email" value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}" class="form-control" required>
        </div>
        <button id="send-reset-link" class="form-control-submit btn btn-primary hidden-xs-down" name="submit" type="submit">
          {l s='Send reset link' d='Shop.Theme.Actions'} &#10095;
        </button>
        <button class="form-control-submit btn btn-primary hidden-sm-up" name="submit" type="submit" style="margin: 0;">
          {l s='Send' d='Shop.Theme.Actions'}
        </button>
      </div>
    </section>

  </form>
{/block}

{block name='page_footer'}
  <a id="back-to-login" href="{$urls.pages.authentication}" class="account-link">
    <i class="material-icons">&#xE5CB;</i>
    <span>{l s='Back to login' d='Shop.Theme.Actions'}</span>
  </a>
{/block}

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
<div id="_desktop_contact_link">

  <div id="contact-link">
    {if $contact_infos.phone}
      {* [1][/1] is for a HTML tag. *}
      {l
        s='Call us: [1]%phone%[/1]'
        sprintf=[
          '[1]' => "<a href='tel:{$contact_infos['phone']|replace:' ':''}'>",
          '[/1]' => '</a>',
          '%phone%' => $contact_infos.phone
        ]
        d='Shop.Theme.Global'
      }
    {else}
      <img src="/themes/default-bootstrap/img/header/img1-aide.png" data-cmp-info="10"> <a href="{$urls.pages.contact}">{l s=' Puis-je vous aider ?' d='Shop.Theme.Global'}</a>
    {/if}
  </div>
  <div>
    <span class="conseiller-en-ligne"><img src="/themes/default-bootstrap/img/header/img2-aide.png" data-cmp-info="10">Conseiller en ligne</span>
  </div>
  <div>
  <span class="call_navbar"> 01.64.40.05.70 <i> Prix appel local</i> </span>
  </div>

</div>

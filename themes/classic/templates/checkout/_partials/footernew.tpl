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
 
<div class="container-footer">
  <div class="row">
    {block name='hook_footer_before'}
      {hook h='displayFooterBefore'}
    {/block}
  </div>
</div>
<div class="footer-container">

  <div class="container">
  <div class="row">
  {block name='hook_footer_after'}
    {hook h='displayFooterAfter'}
  {/block}
</div>
    <div class="row footerTexte">
    <div class="bloc-texte-footer">
    {if $language.iso_code == 'fr'}
        <img src="/themes/default-bootstrap/img/header/logo-dimasport.png" alt="Description de l'image" class="img-bloc-footer">
        <p class="texte">Découvrez l'excellence sportive avec DIMASPORT, équipementier sportif et spécialiste du tapis de gymnastique et du tapis de sport.</p>
        <p class="texte">Fabriqués en France depuis 1967, dans nos usines en Seine-et-Marne, nos produits sont dédiés au milieu scolaire, aux collectivités, clubs de sport et associations sportives...</p>
        <p class="texte">Le matériel DIMA est réputé pour son excellent rapport qualité / prix.</p>
        <p class="texte">Explorez notre gamme complète d’équipements sportifs pour l'athlétisme, le multisport, le sport scolaire, la gymnastique, le cirque, les sports de combats et raquettes, le milieu médical, etc. </p>
        <p class="texte">Découvrez les marques DIMA : DIMAKID pour le matériel d’éveil et motricité pour les enfants, DIMAFIT pour l’équipement fitness des athlètes, DIMACLIMB pour l'escalade.</p>
        <p class="texte">Une équipe d’experts est à votre service, pour vous conseiller et vous accompagner.</p>
        {else}
        <img src="/themes/default-bootstrap/img/header/logo-dimasport.png" alt="Description de l'image" class="img-bloc-footer">
        <p><span>Famous for its high-quality gymnastics mats and track and field equipment, Dimasport offers a large range of sport materials adapted to intensive collective use which perfectly fits in educational establishment, professional sports club or individual garage gym. Dimasport is selling to professional and individual and delivering worldwide made in France, safe, robust and elegant sport equipment. </span></p>
        <p><span>At Dima, you will find fitness equipment, track and field equipment, gymnastics equipment, combat sport, tennis table, badminton equipment and children’s sport equipment …</span></p>
    {/if}

      </div>
      {block name='hook_footer'}
        {hook h='displayFooter'}
      {/block}
    </div>

    <div class="row">
      <div class="col-md-12">
        <p class="text-sm-center">
          {block name='copyright_link'}
            <span style="text-align: center; color: #555555;font-family: 'Oswald', sans-serif; font-size: 13px; text-transform: uppercase; display: block; padding-top: 30px; padding-bottom: 30px;">{if $language.iso_code == 'fr'}© Tous droits réservés DIMASPORT 2026{else}© All rights reserved DIMASPORT 2026{/if}</span>
          {/block}
        </p>
      </div>
    </div>
  </div>
</div>


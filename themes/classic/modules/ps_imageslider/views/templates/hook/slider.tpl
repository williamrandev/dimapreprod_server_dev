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

{if $homeslider.slides}


    <div class="row">
        <div class="col-md-3" id="nos-produits-sportifs">
            <div id="nos-produits-sportifs-content">
                <h2>{if $language.iso_code == 'fr'}Nos produits SPORTIFS{else}Our products{/if}</h2>
                <ul style="list-style: none; padding: 0; margin: 0;">
                    {assign var="categories" value=[
                        ['fr' => '90-gymnastique', 'en' => '90-gymnastics', 'img' => 'gymnastique.png', 'fr_name' => 'gymnastique', 'en_name' => 'Gymnastics'],
                        ['fr' => '125-athletisme', 'en' => '125-track-and-field', 'img' => 'athletisme.png', 'fr_name' => 'Athlétisme', 'en_name' => 'Track and field'],
                        ['fr' => '216-dimakid-motricite-et-eveil', 'en' => '216-dimakid-infant-agility', 'img' => 'dimakid-motricite-et-eveil.png', 'fr_name' => 'Dimakid - motricité et éveil', 'en_name' => 'Dimakid - infant agility'],
                        ['fr' => '246-combat-sports', 'en' => '246-combat-sports', 'img' => 'sports-de-combat.png', 'fr_name' => 'Sports de combat', 'en_name' => 'Combat sports'],
                        ['fr' => '252-cirque-spectacle', 'en' => '252-circus-and-juggling', 'img' => 'plein-air-loisirs.png', 'fr_name' => 'Plein air - loisirs', 'en_name' => 'Outdoor - leisure'],
                        ['fr' => '253-dimaclimb-escalade', 'en' => '253-climbing', 'img' => 'escalade.png', 'fr_name' => 'Escalade', 'en_name' => 'Climbing'],
                        ['fr' => '254-sport-de-raquette', 'en' => '254-racket-sports', 'img' => 'sport-de-raquette.png', 'fr_name' => 'Sports de raquettes', 'en_name' => 'Racket sports'],
                        ['fr' => '258-le-sur-mesure', 'en' => '258-made-to-measure', 'img' => 'le-sur-mesure.png', 'fr_name' => ' Le-Sur-mesure', 'en_name' => 'Made to measure'],
                        ['fr' => '259-dimafit-equipement-fitness', 'en' => '259-dimafit-fitness-equipment', 'img' => 'dimafit-equipement-fitness.png', 'fr_name' => 'Dimafit - équipement fitness', 'en_name' => 'Dimafit - fitness equipment'],
                        ['fr' => '293-sport-sante-et-reeducation', 'en' => '293-sport-and-health-rehabilitation', 'img' => 'sport-sante-reeducation.png', 'fr_name' => 'Sport santé - rééducation', 'en_name' => 'Sport, health and rehabilitation']
                    ]}

                    {foreach from=$categories item=cat}
                        {assign var="lang" value=$language.iso_code}
                        {assign var="url" value="/`$lang`/`$cat[$lang]`"}
                        <li style="margin-bottom: 0;">
                            <a href="{$url}" style="display: flex; align-items: center;">
                                <img src="/themes/default-bootstrap/img/picto-category/{$cat.img}">
                                {if $lang == 'fr'}{$cat.fr_name}{else}{$cat.en_name}{/if}
                            </a>
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>





        <div id="carousel" data-ride="carousel" class="carousel slide col-md-9" data-interval="{$homeslider.speed}"
            data-wrap="{(string)$homeslider.wrap}" data-pause="{$homeslider.pause}" data-touch="true">

            <div class="bx-wrapper" style="max-width: 100%;">
                <div class="bx-viewport" style="width: 100%; overflow: hidden; position: /*relative; height: 466px; */">
                    <ol class="carousel-indicators">
                        {foreach from=$homeslider.slides item=slide key=idxSlide name='homeslider'}
                            <li data-target="#carousel" data-slide-to="{$idxSlide}" {if $idxSlide == 0} class="active" {/if}><span></span>
                            </li>
                        {/foreach}
                    </ol>
                    <ul class="carousel-inner" role="listbox" aria-label="{l s='Carousel container' d='Shop.Theme.Global'}">
                        {foreach from=$homeslider.slides item=slide name='homeslider'}
                            <li class="carousel-item {if $smarty.foreach.homeslider.first}active{/if}" role="option"
                                aria-hidden="{if $smarty.foreach.homeslider.first}false{else}true{/if}">
                                {if !empty($slide.url)}<a href="{$slide.url}">{/if}
                                    <figure>
                                        <img src="{$slide.image_url}" alt="{$slide.legend|escape}" loading="lazy" width="1110"
                                            height="436">
                                        {if $slide.title || $slide.description}
                                            <figcaption class="caption">
                                                <h2 class="display-1 text-uppercase">{$slide.title}</h2>
                                                <div class="caption-description">{$slide.description nofilter}</div>
                                            </figcaption>
                                        {/if}
                                    </figure>
                                    {if !empty($slide.url)}
                                </a>{/if}
                            </li>
                        {/foreach}
                    </ul>
                    <div class="direction" aria-label="{l s='Carousel buttons' d='Shop.Theme.Global'}">
                        <a class="left carousel-control" href="#carousel" role="button" data-slide="prev"
                            aria-label="{l s='Previous' d='Shop.Theme.Global'}">
                            <span class="icon-prev hidden-xs" aria-hidden="true">
                                <i class="material-icons">&#xE5CB;</i>
                            </span>
                        </a>
                        <a class="right carousel-control" href="#carousel" role="button" data-slide="next"
                            aria-label="{l s='Next' d='Shop.Theme.Global'}">
                            <span class="icon-next" aria-hidden="true">
                                <i class="material-icons">&#xE5CC;</i>
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>


    </div>
{/if}
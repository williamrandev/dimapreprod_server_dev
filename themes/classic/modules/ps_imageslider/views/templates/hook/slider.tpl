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
    <div class="row interactive-ad-zone">
        <div id="carousel" data-ride="carousel" class="carousel slide col-md-8" data-interval="{$homeslider.speed}"
            data-wrap="false" data-pause="{$homeslider.pause}" data-touch="true">

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
                </div>
            </div>
        </div>

        <aside class="col-md-4 interactive-ad-sidebar" aria-label="{if $language.iso_code == 'fr'}Offres commerciales{else}Commercial offers{/if}">
            <a class="side-ad side-ad-album side-ad-image" href="https://www.dimapreprod.omega-connect.tech/fr/content/50-catalogues">
                <img src="/themes/classic/assets/img/pages-annexes/fournitures.jpg"
                    alt="{if $language.iso_code == 'fr'}DIMA Sport vous accompagne, découvrez notre offre pour les clubs{else}DIMA Sport supports you, discover our club offer{/if}">
                <span class="side-ad-promotion-label">
                    <strong>{if $language.iso_code == 'fr'}CATALOGUES{else}CLUB OFFER{/if}</strong>
                    <span class="side-ad-action">{if $language.iso_code == 'fr'}Découvrir{else}Discover{/if} <span aria-hidden="true">&rarr;</span></span>
                </span>
            </a>
            <a class="side-ad side-ad-promotion" href="https://www.dimapreprod.omega-connect.tech/fr/blog-dimasport.html/post/32-offre-exceptionnelle-tapis-de-gym">
                <img src="https://www.dimapreprod.omega-connect.tech/modules/ps_imageslider/images/9c3a249542cd5beec967f48001e7b2d9b5377475_SLIDER PROMO TAPIS FR 2025.png"
                    alt="{if $language.iso_code == 'fr'}Découvrez nos promotions sur les équipements sportifs{else}Discover our sports equipment promotions{/if}">
                <span class="side-ad-promotion-label">
                    <strong>{if $language.iso_code == 'fr'}LES PROMOTIONS{else}PROMOTIONS{/if}</strong>
                    <span class="side-ad-action">{if $language.iso_code == 'fr'}Découvrir{else}Discover{/if} <span aria-hidden="true">&rarr;</span></span>
                </span>
            </a>
        </aside>
    </div>
{/if}
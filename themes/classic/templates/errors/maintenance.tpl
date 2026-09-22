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
{extends file='layouts/layout-error.tpl'}

{block name='content'}

  <section id="main">

    {block name='page_header_container'}
      <header class="page-header">
        {block name='page_header_logo'}
        <div class="logo"><img src="{$shop.logo}" alt="logo" loading="lazy"></div>
        {/block}

        {block name='hook_maintenance'}
          {$HOOK_MAINTENANCE nofilter}
        {/block}

        {block name='page_header'}
          <h1>{block name='page_title'}{l s='We\'ll be back soon.' d='Shop.Theme.Global'}{/block}</h1>
        {/block}
      </header>
    {/block}

    {block name='page_content_container'}
      <section id="content" class="page-content page-maintenance">
        {block name='page_content'}
          {*$maintenance_text nofilter*}
                    <style>
  body { text-align: center; padding: 50px; }
  h1 { font-size: 31px; }
  body { font: 20px Helvetica, sans-serif; color: #333; }
  article { display: block; text-align: left; width: 700px; margin: 0 auto; position: relative; }
  a { color: #2364B0; text-decoration: none; }
  a:hover { color: #D72527; text-decoration: none; }
  img { max-width: 75%; }
  .logo { text-align: center; margin-bottom: 20px; }
  .lang-selector {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 30px;
  }
  .lang-btn {
    cursor: pointer;
    opacity: 0.6;
    transition: opacity 0.3s;
  }
  .lang-btn:hover, .lang-btn.active {
    opacity: 1;
  }
  .lang-btn img {
    width: 32px;
    height: 20px;
    border-radius: 4px;
  }
  [data-lang] {
    display: none;
  }
  [data-lang].active {
    display: block;
  }
  @media (min-width: 992px) {
    #layout-error {
        width: 60%;
    }
}
</style>
<article>
    <div data-lang="fr">
        <h1>Une petite pause technique chez DIMASPORT,</h1>
        <div>
            <p>Nous vous prions de nous excuser pour la g&ecirc;ne occasionn&eacute;e, mais nous effectuons actuellement des travaux de maintenance.</p>  
            <p>En attendant, notre &eacute;quipe reste disponible par t&eacute;l&eacute;phone au 01 64 40 05 70 ou par email &agrave; <a href="mailto:info@dimasport.fr">info@dimasport.fr</a></p>
            <p>&mdash; L&quot;&eacute;quipe DIMASPORT</p>
        </div>
    </div>

    <div data-lang="en">
        <h1>A short technical break at DIMASPORT,</h1>
        <div>
            <p>We apologize for the inconvenience, but our website is currently undergoing maintenance.</p>
            <p>In the meantime, our team remains available by phone at +33 (0)1 64 40 05 70 or by email at <a href="mailto:info@dimasport.fr">info@dimasport.fr</a></p>
            <p>&mdash; The DIMASPORT Team</p>
        </div>
    </div>

    <div class="lang-selector">
        <div class="lang-btn" data-select-lang="fr">
            <img src="https://flagcdn.com/32x24/fr.png" alt="Français">
        </div>
        <div class="lang-btn" data-select-lang="en">
            <img src="https://flagcdn.com/32x24/gb.png" alt="English">
        </div>
    </div>
</article>
{literal}
<script>
function setLanguage(lang) {
    // Hide all language versions
    document.querySelectorAll('[data-lang]').forEach(el => {
        el.classList.remove('active');
    });
    // Show selected language
    document.querySelector(`[data-lang="${lang}"]`).classList.add('active');
    // Update buttons state
    document.querySelectorAll('.lang-btn').forEach(btn => {
        btn.classList.remove('active');
    });
    document.querySelector(`[data-select-lang="${lang}"]`).classList.add('active');
    // Store the language preference
    localStorage.setItem('preferred-language', lang);
}

function detectLanguage() {
    // Check stored preference first
    const stored = localStorage.getItem('preferred-language');
    if (stored) {
        return stored;
    }
    
    // Get browser language
    const browserLang = navigator.language || navigator.userLanguage;
    return browserLang.startsWith('fr') ? 'fr' : 'en';
}

// Add click handlers to language buttons
document.querySelectorAll('.lang-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        const lang = btn.getAttribute('data-select-lang');
        setLanguage(lang);
    });
});

// Set initial language
document.addEventListener('DOMContentLoaded', () => {
    const initialLang = detectLanguage();
    setLanguage(initialLang);
});
</script>
{/literal}

        {/block}
      </section>
    {/block}

    {block name='page_footer_container'}

    {/block}

  </section>

{/block}

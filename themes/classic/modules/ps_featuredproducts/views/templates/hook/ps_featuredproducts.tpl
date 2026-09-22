<section class="featured-products-container">
  <div class="fond-titre-conseil">
    <h2 class="h2 products-section-title text-uppercase" style="font-family: Arial, Helvetica, sans-serif;">
      {if isset($language) && $language.iso_code == 'en'}
        CURRENT SELECTION
      {else}
        Découvrez les produits du moment
      {/if}
    </h2>
  </div>

  <!-- Tabs -->
  <div class="product-tabs">
    <button class="tabfirst tab active">
      <span>
        {if isset($language) && $language.iso_code == 'en'}
          DIMA.COM CAPSULE
        {else}
          LES PRODUITS DIMA.COM.
        {/if}
      </span>
      <span>
        <img src="/themes/default-bootstrap/img/fleche-active.png">
      </span>
    </button>

    <button class="tabsecond tab">
      <span>
        {if isset($language) && $language.iso_code == 'en'}
          PROMOTIONS
        {else}
          LES PROMOTIONS
        {/if}
      </span>
      <span>
        <img src="/themes/default-bootstrap/img/fleche-active.png">
      </span>
    </button>
  </div>

  <!-- Slider DIMA -->
  <div class="product-slider" id="produits-dima">
    <div class="slider-wrapper">
      <button class="prev">&lt;</button>
      <div class="slider-container">
        {foreach from=$category84_products item=product}
          <div class="slider-item">
            <div class="product-card">
              <a href="{$product.link}" class="product-link">
                <h3 class="product-name">{$product.name}</h3>
              </a>
              <div class="product-image">
                <a href="{$product.link}">
                  <img src="{$product.cover.bySize.home_default.url}" alt="{$product.name}" />
                </a>
              </div>
              <p class="product-price">
                <span class="price-text">{if isset($language) && $language.iso_code == 'en'}From{else}À partir de{/if}</span>
                <span class="price">{$product.price}<sup>{if isset($language) && $language.iso_code == 'en'}tax incl.{else}T.T.C{/if}</sup></span>
              </p>
            </div>
          </div>
        {/foreach}
      </div>
      <button class="next">&gt;</button>
    </div>
  </div>

  <!-- Slider Promotions -->
  <div class="product-slider" id="promotions">
    <div class="slider-wrapper">
      <button class="prev">&lt;</button>
      <div class="slider-container">
        {foreach from=$category85_products item=product}
          <div class="slider-item">
            <div class="product-card">
              <a href="{$product.link}" class="product-link">
                <h3 class="product-name">{$product.name}</h3>
              </a>
              <div class="product-image">
                <a href="{$product.link}">
                  <img src="{$product.cover.bySize.home_default.url}" alt="{$product.name}" />
                </a>
              </div>
              <p class="product-price">
                <span class="price-text">{if isset($language) && $language.iso_code == 'en'}From{else}À partir de{/if}</span>
                <span class="price">{$product.price}<sup>{if isset($language) && $language.iso_code == 'en'}tax incl.{else}T.T.C{/if}</sup></span>
              </p>
            </div>
          </div>
        {/foreach}
      </div>
      <button class="next">&gt;</button>
    </div>
  </div>
</section>

<!-- Styles -->
<style>
.slider-wrapper { position: relative; overflow: hidden; width: 100%; }
.slider-container { display: flex; gap: 20px; transition: transform 0.5s ease; }
.slider-item { flex: 0 0 327px; aspect-ratio: 8 / 9; }

.product-card { background: #fff; padding: 10px; text-align: center; }
.product-image img { width: 100%; height: auto; object-fit: cover; }

.prev, .next {
  position: absolute; top: 50%; transform: translateY(-50%);
  background: rgba(0,0,0,0.5); color: #fff; border: none;
  font-size: 18px; padding: 10px; cursor: pointer; z-index: 10;
}
.prev { left: 0; } .next { right: 0; }

.product-tabs { display: flex; gap: 10px; margin-bottom: 10px; }
.tab { padding: 5px 10px; cursor: pointer; }
.tab.active { color: #fff; }
</style>

<!-- JS -->
{literal}
<script>
document.addEventListener('DOMContentLoaded', () => {

  // Tabs
  const tabProduits = document.querySelector('.tabfirst');
  const tabPromos = document.querySelector('.tabsecond');
  const produits = document.getElementById('produits-dima');
  const promotions = document.getElementById('promotions');

  produits.style.display = 'block';
  promotions.style.display = 'none';

  tabProduits.addEventListener('click', () => {
    produits.style.display = 'block';
    promotions.style.display = 'none';
    tabProduits.classList.add('active');
    tabPromos.classList.remove('active');
    initSlider(produits);
  });

  tabPromos.addEventListener('click', () => {
    produits.style.display = 'none';
    promotions.style.display = 'block';
    tabPromos.classList.add('active');
    tabProduits.classList.remove('active');
    initSlider(promotions);
  });

  // Fonction pour initialiser un slider
  function initSlider(container) {
    const wrapper = container.querySelector('.slider-wrapper');
    const slider = wrapper.querySelector('.slider-container');
    const prev = wrapper.querySelector('.prev');
    const next = wrapper.querySelector('.next');
    const items = wrapper.querySelectorAll('.slider-item');
    const itemWidth = items[0].offsetWidth + 20;
    let scrollAmount = 0;
    const itemsPerClick = 2;
    const maxScroll = Math.max(slider.scrollWidth - wrapper.offsetWidth, 0);

    const updateButtons = () => {
      prev.style.visibility = scrollAmount > 0 ? 'visible' : 'hidden';
      next.style.visibility = scrollAmount >= maxScroll ? 'hidden' : 'visible';
    };

    // Supprimer anciens listeners
    prev.replaceWith(prev.cloneNode(true));
    next.replaceWith(next.cloneNode(true));

    const newPrev = wrapper.querySelector('.prev');
    const newNext = wrapper.querySelector('.next');

    newNext.addEventListener('click', () => {
      scrollAmount += itemsPerClick * itemWidth;
      if(scrollAmount > maxScroll) scrollAmount = maxScroll;
      slider.style.transform = `translateX(-${scrollAmount}px)`;
      updateButtons();
    });

    newPrev.addEventListener('click', () => {
      scrollAmount -= itemsPerClick * itemWidth;
      if(scrollAmount < 0) scrollAmount = 0;
      slider.style.transform = `translateX(-${scrollAmount}px)`;
      updateButtons();
    });

    updateButtons();
  }

  // Initialiser le slider DIMA au chargement
  initSlider(produits);

});
</script>
{/literal}

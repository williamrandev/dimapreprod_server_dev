document.addEventListener('DOMContentLoaded', function () {
  // Menu principal mobile
  const menuIcon = document.getElementById('menu-icon-mobile');
  const mobileMenu = document.getElementById('mobile_menu_custom');
  const closeTriggers = document.querySelectorAll('.close_menu_mobile, .close_menu_mobile *');

  menuIcon.addEventListener('click', function () {
    mobileMenu.classList.toggle('open');
    document.getElementById('gray_background').style.display = 'block';
  });

  closeTriggers.forEach(el => {
    el.addEventListener('click', function () {
      mobileMenu.classList.remove('open');
      document.getElementById('gray_background').style.display = 'none';
    });
  });

  // Ouverture sous-menu mobile
  document.querySelectorAll('.custom_sub_menu_0 li.custom-category').forEach(function (item) {
    item.addEventListener('click', function () {
      this.classList.toggle('opening');
    });
  });

  // Remplacement texte liens mobiles
  const mobileLinks = [
    ['#custom_lnk-dimakid-motricite-et-eveil > a.custom-dropdown-item', 'DIMAKID', 'DIMAKID<br>'],
    ['#custom_lnk-dimafit-equipement-fitness > a.custom-dropdown-item', 'DIMAFIT', 'DIMAFIT<br>'],
    ['#custom_lnk-le-sur-mesure > a.custom-dropdown-item', 'LE SUR', 'LE SUR<br>'],
    ['#custom_lnk-supports-pedagogiques > a.custom-dropdown-item', 'SUPPORTS', 'SUPPORTS<br>'],
    ['#custom_lnk-amenagement-d-un-stade-d-athletisme > a.custom-dropdown-item', 'AMENAGEMENT D\'UN', 'AMENAGEMENT D\'UN<br>']
  ];

  mobileLinks.forEach(([selector, searchText, replaceText]) => {
    const el = document.querySelector(selector);
    if (el) {
      el.innerHTML = el.textContent.replace(searchText, replaceText);
    }
  });

  // 👇 Code pour le slide du sous-menu custom
  const category2 = document.getElementById('custom_category-2');
  if (category2) {
    const submenuMobile = category2.querySelector('.new_submenu_custom_mobile');
    if (submenuMobile) {
      category2.addEventListener('click', function () {
        submenuMobile.classList.toggle('open-submenu');
      });
    }
  }
});

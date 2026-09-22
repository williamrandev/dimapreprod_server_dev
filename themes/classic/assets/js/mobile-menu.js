document.addEventListener("DOMContentLoaded", () => {
  const menuIcon = document.getElementById("menu-icon-mobile");
  const headerTop = document.querySelector(".header-top");

  if (menuIcon && headerTop && headerTop.parentNode) {
    headerTop.parentNode.insertBefore(menuIcon, headerTop.nextSibling);
  }
});
document.addEventListener('DOMContentLoaded', function () {
  // Menu principal mobile
  const menuIcon = document.getElementById('menu-icon-mobile');
  const mobileMenu = document.getElementById('mobile_menu_custom');
  const closeTriggers = document.querySelectorAll('.close_menu_mobile, .close_menu_mobile *');
  const grayBg = document.getElementById('gray_background');
  
  // Ouvrir menu
  menuIcon.addEventListener('click', () => {
    mobileMenu.classList.toggle('open');
    grayBg.style.display = 'block';
  });
  
  // Fermer via boutons existants
  closeTriggers.forEach(el => {
    el.addEventListener('click', () => {
      mobileMenu.classList.remove('open');
      grayBg.style.display = 'none';
    });
  });
  
  // Fermer en cliquant en dehors du menu
  document.addEventListener('click', (e) => {
    // si menu est ouvert
    if (!mobileMenu.classList.contains('open')) return;
  
    // si clic **dans le menu** ou sur l'icône → ne rien faire
    if (mobileMenu.contains(e.target) || menuIcon.contains(e.target)) return;
  
    // sinon clic en dehors → fermer
    mobileMenu.classList.remove('open');
    grayBg.style.display = 'none';
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
});
document.addEventListener('DOMContentLoaded', () => {
  const maincat2 = document.getElementById('custom_category-2');
  if (!maincat2) return;
  
  const submenuMobile = maincat2.querySelector('.new_submenu_custom_mobile');
  if (!submenuMobile) return;
  
  // Valeur fixe pour le slide
  const FIXED_HEIGHT = '2500px';
  
  maincat2.addEventListener('click', (e) => {
    if (e.target.closest('.new_submenu_custom_mobile')) return;
  
    maincat2.classList.toggle('opening');
  
    const isOpen = submenuMobile.classList.contains('open-submenu');
    if (isOpen) {
      submenuMobile.style.maxHeight = null;
      submenuMobile.classList.remove('open-submenu');
    } else {
      submenuMobile.style.maxHeight = FIXED_HEIGHT;
      submenuMobile.classList.add('open-submenu');
    }
  });

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".custom_sub_menu_1 > li").forEach((item) => {
    const submenu = item.querySelector(".collapse_custom_1");
    if (!submenu) return;

    // clic sur le <li>
    item.addEventListener("click", (e) => {
      const liRect = item.getBoundingClientRect();
      const arrowSize = 16; // taille de la flèche
      const arrowZone = {
        left: liRect.right - arrowSize - 10,
        top: liRect.top,
        right: liRect.right,
        bottom: liRect.bottom,
      };

      // Vérifie si le clic est DANS la flèche (::before)
      const inArrow =
        e.clientX >= arrowZone.left &&
        e.clientX <= arrowZone.right &&
        e.clientY >= arrowZone.top &&
        e.clientY <= arrowZone.bottom;

      if (inArrow) {
        // clic sur la flèche → toggle sous-menu
        e.preventDefault(); // empêche la redirection SEULEMENT pour la flèche
        item.classList.toggle("opening");
        submenu.classList.toggle("open");

        // animation smooth
        if (submenu.classList.contains("open")) {
          submenu.style.height = submenu.scrollHeight + "px";
          submenu.addEventListener("transitionend", function handler() {
            submenu.style.height = "";
            submenu.removeEventListener("transitionend", handler);
          });
        } else {
          submenu.style.height = submenu.scrollHeight + "px";
          void submenu.offsetWidth;
          submenu.style.height = "0";
          submenu.addEventListener("transitionend", function handler() {
            submenu.style.height = "";
            submenu.removeEventListener("transitionend", handler);
          });
        }
      }
      // sinon clic normal → le lien fonctionne
    });
  });
});

});
document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".custom_sub_menu_2 > li.has-collapse_custom").forEach((item) => {
    const submenu = item.querySelector(".custom_sub_menu_3");
    if (!submenu) return;
  
    item.addEventListener("click", (e) => {
      const liRect = item.getBoundingClientRect();
      const arrowSize = 16;
      const arrowZone = {
        left: liRect.right - arrowSize - 10,
        top: liRect.top,
        right: liRect.right,
        bottom: liRect.bottom,
      };
  
      if (
        e.clientX >= arrowZone.left &&
        e.clientX <= arrowZone.right &&
        e.clientY >= arrowZone.top &&
        e.clientY <= arrowZone.bottom
      ) {
        e.preventDefault();
  
        const isOpen = submenu.style.display === "block";
  
        if (isOpen) {
          submenu.style.display = "none";
          item.classList.remove("open"); // ferme
        } else {
          submenu.style.display = "block";
          item.classList.add("open"); // ouvre
        }
      }
    });
  });
  document.querySelectorAll(".custom_sub_menu_1 > li").forEach((item) => {
    const submenu = item.querySelector(".collapse_custom_1");
  
    if (!submenu) return;
  
    item.addEventListener("click", (e) => {
      // Vérifie que le clic est bien sur le LI lui-même (pas un enfant)
      if (e.target !== item) return;
  
      const liRect = item.getBoundingClientRect();
      const arrowSize = 16;
      const arrowZone = {
        left: liRect.right - arrowSize - 10,
        top: liRect.top,
        right: liRect.right,
        bottom: liRect.bottom,
      };
  
      // si clic dans la zone flèche → toggle
      if (
        e.clientX >= arrowZone.left &&
        e.clientX <= arrowZone.right &&
        e.clientY >= arrowZone.top &&
        e.clientY <= arrowZone.bottom
      ) {
        e.preventDefault();
        item.classList.toggle("opening");
        submenu.classList.toggle("open");
      }
    });
  });
  
  document.addEventListener("DOMContentLoaded", function() {
    // Sélectionner tous les items du menu qui ont un sous-menu
    var menuItems = document.querySelectorAll(".custom-category");

    menuItems.forEach(function(menuItem) {
      var menuLink = menuItem.querySelector("a.custom-dropdown-item");
      var submenu = menuItem.querySelector("div.collapse_custom_2");

      if (menuLink && submenu) {
        menuLink.addEventListener("click", function(e) {
          e.preventDefault();

          // Fermer tous les autres sous-menus ouverts au même niveau
          menuItems.forEach(function(item) {
            if (item !== menuItem) {
              item.classList.remove("open");
            }
          });

          // Ouvrir/fermer le sous-menu cliqué
          menuItem.classList.toggle("open");
        });
      }
    });
  });
});
document.addEventListener('DOMContentLoaded', () => {

  // Fonction pour marquer tous les LI qui contiennent un collapse
  const markCollapseItems = (container) => {
    container.querySelectorAll('li').forEach(li => {
      if (li.querySelector('.collapse_custom_2')) {
        li.classList.add('has-collapse_custom');
      }
    });
  };

  // On parcourt tous les UL custom_sub_menu_2
  const allSubMenus2 = document.querySelectorAll('.custom_sub_menu_2');
  allSubMenus2.forEach(ul => {
    markCollapseItems(ul);

    // Délégation click sur chaque UL custom_sub_menu_2
    ul.addEventListener('click', (e) => {
      const li = e.target.closest('li.has-collapse_custom');
      if (!li || !ul.contains(li)) return;

      // Zone cliquable de la flèche ::before
      const liRect = li.getBoundingClientRect();
      const ARROW_SIZE = 16;
      const CLICK_PAD  = 10;
      const zoneLeft   = liRect.right - (ARROW_SIZE + CLICK_PAD);
      const inX = e.clientX >= zoneLeft && e.clientX <= liRect.right;
      const inY = e.clientY >= liRect.top && e.clientY <= liRect.bottom;
      if (!inX || !inY) return;

      e.preventDefault();

      const submenu = li.querySelector('.custom_sub_menu_3');
      if (!submenu) return;

      const isOpen = li.classList.toggle('open');
      submenu.style.display = isOpen ? 'block' : 'none';
    });
  });
});



document.addEventListener("DOMContentLoaded", function () {
    const container = document.querySelector("#contact-infos");
    if (!container) return;

    container.childNodes.forEach(node => {
        if (node.nodeType === 3) { // text node
            node.nodeValue = node.nodeValue.replace(/dimasport/gi, "");
        }
    });
});


document.addEventListener("DOMContentLoaded", function () {
    if (window.innerWidth > 768) return;

    const block = document.querySelector("#left-column > div.block-categories");
    if (!block) return;

    const toggleBtn = document.createElement("button");
    toggleBtn.className = "toggle-categories";
    toggleBtn.setAttribute("aria-label", "Afficher / cacher les catégories");

    block.style.display = "none";
    block.parentNode.insertBefore(toggleBtn, block);

    toggleBtn.addEventListener("click", function () {
        const isHidden = block.style.display === "none";

        block.style.display = isHidden ? "block" : "none";
        toggleBtn.classList.toggle("open", isHidden);
    });
});







document.addEventListener("DOMContentLoaded", function () {

    if (!window.matchMedia("(max-width: 768px)").matches) return;

    const container = document.querySelector(
        '#footer > div.footer-container > div > div.row.footerTexte'
    );

    if (!container) return;

    const contact = container.querySelector('#contactinfos');
    const reseaux = container.querySelector('div.para1.block-social.resaux');

    if (!contact || !reseaux) return;

    container.insertBefore(reseaux, contact);
});






// document.addEventListener("DOMContentLoaded", function () {

//   // Vérifie que le module pricequote est présent
//   const module = document.querySelector('#module-pricequote-pricequote');
//   if (!module) return;

//   // Cible la navigation
//   const nav = module.querySelector('#wrapper > div > nav');
//   if (!nav) return;

//   // Nouveau contenu HTML
//   nav.innerHTML = `
//     <ol>
//       <li>
//         <a href="https://www.dimasport.omega-connect.com/">
//           Accueil
//         </a>
//         <span>Accueil</span>
//       </li>

//       <li>
//         <a href="https://www.dimasport.omega-connect.com/connexion?back=https%3A%2F%2Fwww.dimasport.omega-connect.com%2Fconnexion%3Fback%3Dhttps%253A%252F%252Fwww.dimasport.omega-connect.com%252Findex.php%253Ffc%253Dmodule%2526module%253Dpricequote%2526controller%253Dpricequote">
//           <span>Mon compte</span>
//         </a>
//       </li>

//       <li>
//         <span>DEMANDE DE DEVIS</span>
//       </li>
//     </ol>
//   `;
// });


// document.addEventListener("DOMContentLoaded", function () {

//   const module = document.querySelector('#module-pricequote-pricequote');
//   if (!module) return;

//   const nav = module.querySelector('#wrapper > div > nav');
//   if (!nav) return;

//   nav.innerHTML = `
//     <ol>
//       <li>
//         <a href="https://www.dimasport.omega-connect.com/">
//           Accueil
//         </a>
//       </li>

//       <li>
//         <a href="https://www.dimasport.omega-connect.com/connexion?back=https%3A%2F%2Fwww.dimasport.omega-connect.com%2Fconnexion%3Fback%3Dhttps%253A%252F%252Fwww.dimasport.omega-connect.com%252Findex.php%253Ffc%253Dmodule%2526module%253Dpricequote%2526controller%253Dpricequote">
//           <span>Mon compte</span>
//         </a>
//       </li>

//       <li>
//         <span>DEMANDE DE DEVIS</span>
//       </li>
//     </ol>
//   `;
// });


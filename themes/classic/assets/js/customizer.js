window.addEventListener("DOMContentLoaded", () => {
  const ul = document.getElementById("top-menu");
  const div = document.querySelector(".new_submenu_designe9");
  const ulStyles = getComputedStyle(ul);
  const marginLeft = ulStyles.marginLeft;
  div.style.marginLeft = marginLeft;
});
document.addEventListener("DOMContentLoaded", function () {
  const questionReponse = document.querySelector(".row.questionReponse");
  const productContainer = document.querySelector(
    ".customized-product-addons-block",
  );

  if (questionReponse && productContainer) {
    productContainer.insertAdjacentElement("afterend", questionReponse);
  }
});

document.addEventListener("DOMContentLoaded", () => {
  const menuConfigs = [
    {
      ids: [
        "category-132",
        "category-216",
        "category-259",
        "category-125",
        "category-90",
        "category-252",
        "category-253",
        "category-246",
        "category-254",
        "category-100",
        "category-83",
      ],
      class: "collapse_1",
    },
    {
      ids: [
        "category-217",
        "category-218",
        "category-220",
        "category-653",
        "category-652",
        "category-221",
        "category-260",
        "category-264",
        "category-266",
        "category-263",
        "category-262",
        "category-267",
        "category-268",
        "category-269",
        "category-600",
        "category-127",
        "category-128",
        "category-134",
        "category-135",
        "category-136",
        "category-131",
        "category-130",
        "category-183",
        "category-92",
        "category-93",
        "category-94",
        "category-91",
        "category-293",
        "category-650",
        "category-261",
        "category-393",
        "category-20",
        "category-21",
        "category-22",
        "category-23",
        "category-247",
        "category-248",
        "category-25",
        "category-256",
        "category-257",
        "category-249",
        "category-26",
        "category-258",
        "category-84",
        "category-85",
      ],
      class: "collapse_2",
    },
  ];

  const allTargetsByLevel = {};

  menuConfigs.forEach((config) => {
    if (!allTargetsByLevel[config.class]) {
      allTargetsByLevel[config.class] = [];
    }

    config.ids.forEach((id) => {
      const trigger = document.getElementById(id);
      const target = trigger?.querySelector("." + config.class);

      if (trigger && target) {
        allTargetsByLevel[config.class].push(target);
        target.classList.add("fade-menu");

        trigger.addEventListener("mouseenter", () => {
          allTargetsByLevel[config.class].forEach((t) => {
            if (t !== target) t.classList.remove("show");
          });
          target.classList.add("show");
        });

        let timer;
        const hideMenu = () => {
          timer = setTimeout(() => {
            target.classList.remove("show");
          }, 1500);
        };

        const clearTimer = () => {
          clearTimeout(timer);
        };

        trigger.addEventListener("mouseleave", hideMenu);
        target.addEventListener("mouseleave", hideMenu);
        trigger.addEventListener("mouseenter", clearTimer);
        target.addEventListener("mouseenter", clearTimer);
      }
    });
  });
});
document.querySelectorAll(".sub_menu_edit2 li").forEach(function (li) {
  if (li.querySelector(".collapse_2")) {
    li.classList.add("arrow_down_submenu");
  }
});
const topMenu = document.querySelector("#top-menu");
const submenu = document.querySelector(".sub_menu_edit1");

submenu.addEventListener("mouseenter", () => {
  topMenu.classList.add("hovering-submenu");
});
submenu.addEventListener("mouseleave", () => {
  topMenu.classList.remove("hovering-submenu");
});
const header = document.getElementById("header");
const menu = document.getElementById("_desktop_top_menu");
if (header && menu) {
  const stickyPoint = header.offsetHeight - menu.offsetHeight;
  window.addEventListener("scroll", () => {
    if (window.scrollY >= stickyPoint) {
      menu.classList.add("fixedtopmenue");
    } else {
      menu.classList.remove("fixedtopmenue");
    }
  });
}
const link = document.querySelector(
  "#lnk-dimakid-motricite-et-eveil > a.dropdown-item",
);
if (link) {
  link.innerHTML = link.textContent.replace("DIMAKID", "DIMAKID<br>");
}
const link1 = document.querySelector(
  "#lnk-dimafit-equipement-fitness > a.dropdown-item",
);
if (link1) {
  link1.innerHTML = link1.textContent.replace("DIMAFIT", "DIMAFIT<br>");
}
const link2 = document.querySelector("#lnk-le-sur-mesure > a.dropdown-item");
if (link2) {
  link2.innerHTML = link2.textContent.replace("LE SUR", "LE SUR<br>");
}
const link3 = document.querySelector(
  "#lnk-teaching-fact-sheets > a.dropdown-item",
);
if (link3) {
  link3.innerHTML = link3.textContent.replace(
    "TEACHING FACT",
    "TEACHING FACT<br>",
  );
}
const link4 = document.querySelector(
  "#lnk-track-and-field-facilities > a.dropdown-item",
);
if (link4) {
  link4.innerHTML = link4.textContent.replace(
    "TRACK AND FIELD",
    "TRACK AND FIELD<br>",
  );
}
const link5 = document.querySelector("#lnk-made-to-measure > a.dropdown-item");
if (link5) {
  link5.innerHTML = link5.textContent.replace("MADE TO", "MADE TO<br>");
}
const link6 = document.querySelector(
  "#lnk-dimakid-infant-agility > a.dropdown-item",
);
if (link6) {
  link6.innerHTML = link6.textContent.replace("DIMAKID", "DIMAKID<br>");
}
const link7 = document.querySelector(
  "#lnk-dimafit-fitness-equipment > a.dropdown-item",
);
if (link7) {
  link7.innerHTML = link7.textContent.replace("DIMAFIT", "DIMAFIT<br>");
}

function moveHeader() {
  const header = document.getElementById("js-product-list-header");
  const leftColumn = document.getElementById("left-column");

  if (header && leftColumn) {
    if (window.innerWidth < 768) {
      leftColumn.parentNode.insertBefore(header, leftColumn);
    } else {
      // Remets le header à sa place d’origine si besoin
      const productList = document.querySelector("#products");
      if (
        productList &&
        !productList.previousElementSibling?.id === "js-product-list-header"
      ) {
        productList.parentNode.insertBefore(header, productList);
      }
    }
  }
}

document.addEventListener("DOMContentLoaded", moveHeader);
window.addEventListener("resize", moveHeader);

document.addEventListener("DOMContentLoaded", function () {
  if (window.innerWidth < 768) {
    const toggleParagraph = document.querySelector(
      ".toggle-catalogue-mobile-p",
    );
    const toggleSpan = toggleParagraph?.querySelector(
      ".toggle-catalogue-mobile",
    );
    const catalogue = document.getElementById("catalogue-content");

    if (toggleParagraph && toggleSpan && catalogue) {
      toggleParagraph.addEventListener("click", function () {
        if (catalogue.classList.contains("open")) {
          catalogue.style.height = catalogue.scrollHeight + "px"; // force reflow
          requestAnimationFrame(() => {
            catalogue.style.height = "0px";
            catalogue.classList.remove("open");
          });
          toggleSpan.textContent = "+";
        } else {
          catalogue.style.height = "0px";
          catalogue.classList.add("open");
          requestAnimationFrame(() => {
            catalogue.style.height = catalogue.scrollHeight + "px";
          });
          toggleSpan.textContent = "−";
        }
      });

      catalogue.addEventListener("transitionend", () => {
        if (catalogue.classList.contains("open")) {
          catalogue.style.height = "auto"; // fixe la hauteur après l'anim
        }
      });
    }
  }
});
function updateSubmenuPosition() {
  const header = document.querySelector(".header-nav");
  const headerTop = document.querySelector(".header-top");
  const headerMenu = document.querySelector("#_desktop_top_menu");
  const submenu = document.querySelector(".new_submenu_designe9");

  if (!submenu || !headerMenu) return;

  let total = 0;

  const headerVisible =
    header &&
    header.offsetHeight > 0 &&
    getComputedStyle(header).display !== "none";
  const headerTopVisible =
    headerTop &&
    headerTop.offsetHeight > 0 &&
    getComputedStyle(headerTop).display !== "none";

  if (headerMenu.classList.contains("fixedtopmenue")) {
    // Mode sticky: seul le menu fixe est visible
    total = headerMenu.offsetHeight + 1;
  } else {
    // Mode normal: les 3 blocs doivent être pris en compte si visibles
    const h = headerVisible ? header.offsetHeight : 0;
    const ht = headerTopVisible ? headerTop.offsetHeight : 0;
    const hm = headerMenu.offsetHeight;
    total = h + ht + hm + 1;
  }

  submenu.style.top = total + "px";
}

window.addEventListener("load", updateSubmenuPosition);
window.addEventListener("scroll", updateSubmenuPosition);
window.addEventListener("resize", updateSubmenuPosition);

document.querySelectorAll(".product-images-container").forEach((el) => {
  if (el.querySelector(".second-image")) {
    el.classList.add("has-second");
  }
});
function updateQuoteButtonPosition() {
  const addToCart = document.querySelector(".add-to-cart");
  const quoteBtn = document.querySelector(".lpqt-add-to-quote");

  if (!addToCart || !quoteBtn) return;

  if (addToCart.disabled) {
    quoteBtn.style.left = "0px";
  } else {
    quoteBtn.style.left = "240px";
  }
}

// observer les changements dans le bloc produit
const target = document.querySelector("#add-to-cart-or-refresh");

if (target) {
  const observer = new MutationObserver(() => {
    updateQuoteButtonPosition();
  });

  observer.observe(target, {
    childList: true,
    subtree: true,
  });
}

// initial
updateQuoteButtonPosition();
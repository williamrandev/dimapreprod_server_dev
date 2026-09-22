
let printContainer = document.querySelector('.footerPrint');
let pricePrint = document.querySelector('.product-prices.js-product-prices');

console.log('script ok')

function printToPDF() {
  if (pricePrint) {
    pricePrint.classList.remove('hiden-print');
    pricePrint.classList.add('show-print');
    window.print();
  }
}


// function printToPDF1() {
//   if(pricePrint){
//   pricePrint.classList.remove('show-print');
//   pricePrint.classList.add('hiden-print');
//   window.print();
//   }
// }
const btn = document.getElementById("printFiche");
if (btn) {
  btn.addEventListener('click', function (e) {
    // ...
    e.preventDefault();
    window.print();
  });
}


if (printContainer) {
  printContainer.innerHTML = `1 BIS RUE LOUIS ARMAND BP 91 77834 OZOIR-LA-FERRIERE CEDEX FRANCE<br>TEL 01 64 40 05 70 - FAX 01 64 40 00 37 - MAIL : INFO@DIMASPORT.FR`;
}

document.addEventListener("DOMContentLoaded", function () {
  // Vérifie si la référence est bien définie
  if (typeof productReference !== 'undefined' && productReference !== '') {
    // Envoi AJAX
    $.ajax({
      url: '/recupfilepdf/recuppdf.php', //  script PHP dans la racine
      type: 'POST',
      data: { reference: productReference },
      success: function (response) {
        // Injecter le HTML reçu dans la div #resultats
        document.getElementById('resultats').innerHTML = response;
      },
      error: function () {
        document.getElementById('resultats').innerHTML =
          '<p style="color:red;">❌ Erreur lors du chargement des fichiers PDF.</p>';
      }
    });
  }
});

/*================BEGIN POP-IN===========================*/
/*================END===========================*/

// debut js deroulant cart and quotation

$('#_desktop_cart').mouseenter(function () {
  $('#_desktop_cart .cart_block').css('display', 'block');
});
$('#_desktop_cart').mouseleave(function () {
  $('#_desktop_cart .cart_block').css('display', 'none');
});


// fin js deroulant cart and quotation


// Auto-remplissage : "Nom de votre organisation" → "Société"
$(document).ready(function () {
  // Sélecteur du champ "Nom de votre organisation" (attribut name)
  var $org = $('[name="organisation"]');

  // Sélecteur du champ "Société" — on essaie plusieurs variantes
  var $soc = $('#field-company').length ? $('#field-company')
    : $('#field_company').length ? $('#field_company')
      : $('[name="company"]');

  if ($org.length && $soc.length) {
    $org.on('input', function () {
      $soc.val($(this).val());
    });
  }
});

// Auto-remplissage : "Nom de votre organisation" → "Société"
$(document).ready(function () {
  // Sélecteur du champ "Nom de votre organisation" (attribut name)
  var $siret = $('[name="num_siret"]');

  // Sélecteur du champ "Société" — on essaie plusieurs variantes
  var $sir = $('#field-siret').length ? $('#field-siret')
    : $('#field_siret').length ? $('#field_siret')
      : $('[name="siret"]');

  if ($siret.length && $sir.length) {
    $siret.on('input', function () {
      $sir.val($(this).val());
    });
  }
});

// Masquer visuellement "Societe" et "SIRET" dans "Vos informations personnelles"
// Les champs restent dans le DOM : leurs valeurs sont toujours soumises et enregistrees
$(document).ready(function () {
  var $soc = $('#field-company').length ? $('#field-company')
    : $('#field_company').length ? $('#field_company')
      : $('[name="company"]');

  var $sir = $('#field-siret').length ? $('#field-siret')
    : $('#field_siret').length ? $('#field_siret')
      : $('[name="siret"]');

  $soc.closest('.form-group').hide();
  $sir.closest('.form-group').hide();
});





// Sécurité : S'assurer que le bouton commander est actif après une mise à jour du panier
if (typeof prestashop !== 'undefined') {
  prestashop.on('updatedCart', function (event) {
    // Petit délai pour laisser passer les autres scripts
    setTimeout(function () {
      const checkoutBtn = document.querySelector('.js-cart-detailed-actions a');
      if (checkoutBtn) {
        checkoutBtn.classList.remove('disabled');
      }
    }, 100);
  });
}

//taille police trop petit 


document.querySelectorAll('.product-description span').forEach(span => {
  const currentSize = parseFloat(span.style.fontSize);

  if (currentSize) {
    // ≥ 14pt → 17pt (gros titre type "-30%")
    // < 14pt → 12pt (corps de texte)
    span.style.fontSize = currentSize >= 14 ? '19pt' : '14pt';
  }

  // Uniformisation police
  span.style.fontFamily = 'Calibri';
});
//-------------




// Interligne entre les lignes de texte
document.querySelectorAll('.product-description span').forEach(span => {
  span.style.lineHeight = '1.2';
});

// Espace entre les paragraphes
document.querySelectorAll('.product-description p').forEach(p => {
  // p.style.marginBottom = '6px';
});




document.addEventListener('DOMContentLoaded', function () {
  if (window.innerWidth <= 768) {
    var social = document.querySelector('.para1.block-social.resaux');
    var target = document.querySelector('.h4.block-contact-title.hidden-sm-down');

    if (social && target) {
      target.parentNode.insertBefore(social, target);
    }
  }
});
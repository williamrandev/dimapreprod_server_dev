// On vérifie d'abord si l'élément existe avant de lui donner un ordre
const btnToggle = document.getElementById('seo-toggle-texte');

if (btnToggle) {  // "if (btnToggle)" veut dire : seulement si le bouton existe vraiment
    btnToggle.addEventListener('click', function () {
        const box = document.getElementById('seo-content-texte');
        if (box) {
            box.classList.toggle('open');
            this.classList.toggle('open');
        }
    });

    // Masquer le bouton si le texte ne dépasse pas la limite (150px)
    window.addEventListener('load', function() {
        const box = document.getElementById('seo-content-texte');
        if (box) {
            // On vérifie si la hauteur réelle (scrollHeight) est supérieure à la hauteur affichée (150px)
            if (box.scrollHeight <= 150) {
                btnToggle.style.display = 'none';
            }
        }
    });
}
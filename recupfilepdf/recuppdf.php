<?php
// Début de récupération via AJAX


$referenceproduct = trim($_POST['reference']);
$referenceproduct1 = $referenceproduct;

// Supprimer le préfixe de lettres pour comparaison
$prefix_length1 = strlen(preg_replace('/[^A-Za-z]/', '', $referenceproduct1));
$referenceproduct1 = substr($referenceproduct1, $prefix_length1);

// Chemin du dossier contenant les PDF
$chemin_dossier = __DIR__ . '/../ERP/IN/';

if (!is_dir($chemin_dossier)) {
    exit('? Dossier introuvable.');
}

if ($handle = opendir($chemin_dossier)) {
    while (false !== ($file = readdir($handle))) {
        if (strtolower(substr($file, -4)) !== ".pdf") continue;

        $nom_fichier = explode("_", $file);
        if (count($nom_fichier) < 2) continue;

        $refepdf = substr($nom_fichier[1], 1); // Sans la première lettre
        $refepdft = $nom_fichier[1];
        $prefix_length = strlen(preg_replace('/[^A-Za-z]/', '', $refepdft));
        $refepdft = substr($refepdft, $prefix_length);

        $filename = end($nom_fichier);
        $filepart = substr($filename, 0, -4); // Retirer ".pdf"

        $libelles = [
            'TOUT'     => ['label' => 'DIMENSION HORS TOUT',    'img' => 'ppicto4.png'],
            'TOUT.PDF'     => ['label' => 'DIMENSION HORS TOUT',    'img' => 'ppicto4.png'],
            'MONTAGE'  => ['label' => 'PLAN DE MONTAGE',        'img' => 'ppicto7.png'],
            'MONTAGE.PDF'  => ['label' => 'PLAN DE MONTAGE',        'img' => 'ppicto7.png'],
            'DIMA'     => ['label' => 'CERTIFICATION',          'img' => 'ppicto2.png'],
            'SCELLEMENT'     => ['label' => 'PLAN DE SCELLEMENT','img' => 'ppicto6.png'],
            '150CM'    => ['label' => 'PLAN D\'ENVIRONEMENT DU PRODUIT',   'img' => 'ppicto5.png'],
            'ENVIRONNEMENT'  => ['label' => 'PLAN D\'ENVIRONEMENT DU PRODUIT',   'img' => 'ppicto5.png'],
            'DIMAKID'  => ['label' => 'CONSEIL D\'ENTRETIEN',   'img' => 'ppicto9.png']
        ];

        // Condition : reference correspondante et partie fichier reconnue
        if (($referenceproduct === $refepdf || $referenceproduct1 === $refepdft) && isset($libelles[$filepart])) {
            $label = $libelles[$filepart]['label'];
            $img   = $libelles[$filepart]['img'];

            echo '
            <div class="row vertical-align">
              <div class="col-md-3 ligne-picto blocpicto">
                <img src="/themes/classic/assets/img/' . $img . '" alt="">
              </div>
              <div class="col-md-9 ligne-picto">
                <span id="blank">
                  <a target="_blank" href="/ERP/IN/' . htmlspecialchars($file) . '">' . $label . '</a>
                </span>
              </div>
            </div>';
        }
    }
    closedir($handle);
}

// Fin récupération
?>

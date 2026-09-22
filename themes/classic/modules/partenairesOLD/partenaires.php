<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

class Partenaires extends Module
{
    public function __construct()
    {
        $this->name = 'partenaires';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'sahaza';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = ['min' => '1.7.0.0', 'max' => '8.2.0'];
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->trans('Nos Partenaires', [], 'Modules.Partenaires.Admin');
        $this->description = $this->trans('Affiche une liste de partenaires avec leurs logos et liens.', [], 'Modules.Partenaires.Admin');
    }

    public function install()
    {
        if (!parent::install() || 
            !$this->registerHook('displayHome') || 
            !$this->registerHook('displayFooter')) {
            return false;
        }
        return true;
    }

    public function uninstall()
    {
        if (!parent::uninstall()) {
            return false;
        }
        return true;
    }

    public function hookDisplayHome($params)
    {
        return $this->renderPartenaires();
    }

    public function hookDisplayFooter($params)
    {
        return $this->renderPartenaires();
    }

    private function renderPartenaires()
    {
        $partenaires = [
            [
                'url' => 'http://www.athle.fr/',
                'image' => '/themes/default-bootstrap/img/home/Logo_FFA.png',
                'width' => '8%'
            ],
            [
                'url' => 'http://www.fscf.asso.fr/',
                'image' => '/themes/default-bootstrap/img/home/fsc.jpg',
                'width' => '10%'
            ],
            [
                'url' => 'http://ugsel.org/',
                'image' => '/themes/default-bootstrap/img/home/LOGO-UGSEL-SLOGAN-2013.jpg',
                'width' => '7%'
            ],
            [
                'url' => 'http://unss.org/',
                'image' => '/themes/default-bootstrap/img/home/unss.jpg',
                'width' => '6%'
            ]
        ];

        $this->context->smarty->assign('partenaires', $partenaires);

        // V�rification des donn�es Smarty en mode debug
        if (_PS_MODE_DEV_) {
            dump($this->context->smarty->getTemplateVars());
        }

        // V�rifier si le fichier existe avant de le charger
        $templatePath = 'module:partenaires/partenaires.tpl';
        if (!file_exists(_PS_MODULE_DIR_ . 'partenaires/partenaires.tpl')) {
            return '<p>Erreur : Template non trouv�.</p>';
        }

        return $this->fetch($templatePath);
    }
}

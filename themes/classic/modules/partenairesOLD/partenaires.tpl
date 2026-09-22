
<div class="container-partenaire">
    <div class="col-md-12 partenaires">
        <div class="col-md-12">
            <div class="fond-titre-conseil">
                <h2>Nos partenaires</h2>
            </div>
        </div>
        <div class="col-md-12 partenaires-content">
            <ul>
                {foreach from=$partenaires item=partenaire}
                    <li>
                        <a target="_blank" href="{$partenaire.url}">
                            <img src="{$partenaire.image}" class="img-partner" style="width: {$partenaire.width};">
                        </a>
                    </li>
                {/foreach}
            </ul>
        </div>
        <div class="col-md-12 partenaires-content-mobile"><div class="bx-wrapper" style="max-width: 100%; margin: 0px auto;">
            <div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 110px;">
                <ul class="bxslider-partenaires" style="width: auto; position: relative;">
                    <li style="float: none; list-style: none; position: absolute; z-index: 50; display: block; width: 381px;"> 
                        <a target="_blank" href="http://www.athle.fr/"><img src="/themes/default-bootstrap/img/home/Logo_FFA.png" class="img-responisve" style="max-height: 100px;">
                        </a>
                    </li>
                    <li style="float: none; list-style: none; position: absolute; z-index: 0; display: none; width: 381px;"> 
                        <a target="_blank" href="http://www.fscf.asso.fr/"><img src="/themes/default-bootstrap/img/home/fsc.jpg" class="img-responisve" style="margin-top: 10px; max-height: 75px;">
                        </a>
                    </li><li style="float: none; list-style: none; position: absolute; z-index: 0; display: none; width: 381px;"> <a target="_blank" href="http://ugsel.org/"><img src="/themes/default-bootstrap/img/home/LOGO-UGSEL-SLOGAN-2013.jpg" class="img-responisve" style="max-height: 100px"></a></li><li style="float: none; list-style: none; position: absolute; z-index: 0; display: none; width: 381px;"> <a target="_blank" href="http://unss.org/"><img src="/themes/default-bootstrap/img/home/unss.jpg" class="img-responisve" style="max-height: 110px;"></a></li></ul></div><div class="bx-controls bx-has-controls-direction"><div class="bx-controls-direction"><a class="bx-prev" href="">Prev</a><a class="bx-next" href="">Next</a></div></div></div></div>
    </div>
</div>
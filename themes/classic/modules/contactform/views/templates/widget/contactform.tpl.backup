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
<section class="contact-form">
  <form action="{$urls.pages.contact}" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if}>
    {if $notifications}
      <div class="col-xs-12 alert {if $notifications.nw_error}alert-danger{else}alert-success{/if}">
        <ul>
          {foreach $notifications.messages as $notif}
            <li>{$notif}</li>
          {/foreach}
        </ul>
      </div>
    {/if}

    {if !$notifications || $notifications.nw_error}
      <section class="form-fields">
        <div class="row">
          <!-- Colonne gauche : tous les champs sauf le message -->
          <div class="col-md-4">
            <!-- Titre -->
            <div class="form-group row">
              <div class="col-md-12">
                <h3>{l s='Contact us' d='Shop.Theme.Global'}</h3>
              </div>
            </div>

            <!-- Vous êtes ? -->
            <div class="form-group row">
            <label class="col-md-3 form-control-label" for="you_are">{if $language.iso_code == 'en'}You are?{else}Vous-êtes?{/if}</label>
            <div class="col-md-9">
              <select name="you_are" id="you_are" class="form-control form-control-select" required>
                <option value="" selected disabled>{if $language.iso_code == 'en'}Select your profil{else}Vous-êtes?{/if}</option>
                <option value="Particuliers">{if $language.iso_code == 'en'}Individuals{else}Particuliers{/if}</option>
                <option value="Enfance/ enseignement">{if $language.iso_code == 'en'}Childhood /Education{else}Enfance/ enseignement{/if}</option>
                <option value="Institutions sportives/ Centres d\'entrainement">{if $language.iso_code == 'en'}Sports Institutions / Training Centers{else}Institutions sportives/ Centres d\'entrainement{/if}</option>
                <option value="Médical">{if $language.iso_code == 'en'}Medical{else}Médical{/if}</option>
                <option value="Entreprises">{if $language.iso_code == 'en'}ICompanies{else}Entreprises{/if}</option>
                <option value="Communes et collectivités">{if $language.iso_code == 'en'}Municipalities and Communities{else}Communes et collectivités{/if}</option>
                <option value="Clubs de sport / Associations">{if $language.iso_code == 'en'}Sports Clubs / Associations{else}Clubs de sport / Associations{/if}</option>
                <option value="Administration">{if $language.iso_code == 'en'}Administration{else}Administration{/if}</option>
                <option value="Loisir/ Tourisme">{if $language.iso_code == 'en'}Leisure / Tourism{else}Loisir/ Tourisme{/if}</option>
                <option value="Maître d\'œuvre/ architecte">{if $language.iso_code == 'en'}Architect / Project Manager{else}Maître d\'œuvre/ architecte{/if}</option>
                <option value="Revendeur">{if $language.iso_code == 'en'}Dealer{else}Revendeur{/if}</option>
              </select>
            </div>
            </div>

            <!-- Prénom -->
            <div class="form-group row">
            <label class="col-md-3 form-control-label" for="contact_prenom">
              {if $language.iso_code == 'en'}First name{else}Prénom{/if} : <sup>(*)</sup>
            </label>
            <div class="col-md-9">
              <input class="form-control grey" type="text" id="contact_prenom" name="contact_prenom" value="{$cprenom}" required />
            </div>
            </div>

            <!-- Nom -->
            <div class="form-group row">
            <label class="col-md-3 form-control-label" for="contact_nom">
              {if $language.iso_code == 'en'}name{else}Nom{/if} : <sup>(*)</sup>
            </label>
            <div class="col-md-9">
              <input class="form-control grey" type="text" id="contact_nom" name="contact_nom" value="{$cnom}" required />
            </div>
            </div>


            <!-- Sujet -->
            <div class="form-group row" style="display: none;">
              <label class="col-md-3 form-control-label" for="id_contact">{if $language.iso_code == 'en'}subject{else}Sujet{/if}</label>
              <div class="col-md-9">
                <select name="id_contact" id="id_contact" class="form-control form-control-select">
                  {foreach from=$contact.contacts item=contact_elt}
                    <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
                  {/foreach}
                </select>
              </div>
            </div>

            <!-- Email -->
            <div class="form-group row">
              <label class="col-md-3 form-control-label" for="email">{if $language.iso_code == 'en'}Adresse e-mail{else}Email{/if}</label>
              <div class="col-md-9">
                <input
                  id="email"
                  class="form-control"
                  name="from"
                  type="email"
                  value="{$contact.email}"
                  placeholder="{l s='your@email.com' d='Shop.Forms.Help'}"
                >
              </div>
            </div>

            <!-- Fonction -->
            <div class="form-group row">
            <label class="col-md-3 form-control-label" for="contact_fonction">
              {if $language.iso_code == 'en'}Function{else}Fonction{/if} :
            </label>
            <div class="col-md-9">
              <input class="form-control grey" type="text" id="contact_fonction" name="contact_fonction" value="{$cfonction}" />
            </div>
            </div>

            <!-- Téléphone -->
            <div class="form-group row">
              <label class="col-md-3 form-control-label" for="contact_telephone">
               {if $language.iso_code == 'en'}Phone{else}Téléphone{/if} : <sup>(*)</sup>
              </label>
              <div class="col-md-9">
                <input class="form-control grey" type="tel" id="contact_telephone" name="contact_telephone" value="{$ctel}" required />
              </div>
            </div>

            <!-- Adresse -->
            <div class="form-group row">
              <label class="col-md-3 form-control-label" for="contact_adresse">
               {if $language.iso_code == 'en'}Adress{else}Adresse{/if} :
              </label>
              <div class="col-md-9">
                <input class="form-control grey" type="text" id="contact_adresse" name="contact_adresse" value="{$cadresse}" />
              </div>
            </div>

            <!-- Référence de commande (facultatif) -->
            {if $contact.orders}
              <div class="form-group row">
                <label class="col-md-3 form-control-label" for="id-order">{if $language.iso_code == 'en'}Order Reference{else}Référence de commande{/if}</label>
                <div class="col-md-9">
                  <select id="id-order" name="id_order" class="form-control form-control-select">
                    <option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
                    {foreach from=$contact.orders item=order}
                      <option value="{$order.id_order}">{$order.reference}</option>
                    {/foreach}
                  </select>
                </div>
                {*<span class="col-md-3 form-control-comment">
                  {l s='optional' d='Shop.Forms.Help'}
                </span>*}
              </div>
            {/if}

            <!-- Pièce jointe (facultatif) -->
            {if $contact.allow_file_upload}
              <div class="form-group row">
                <label class="col-md-6 form-control-label" for="file-upload">{if $language.iso_code == 'en'}Attachment{else}Pièce jointe{/if}</label>
                <div class="col-md-6">
                  <input id="file-upload" type="file" name="fileUpload" class="filestyle" data-buttonText="{l s='Choose file' d='Shop.Theme.Actions'}">
                </div>
                {*<span class="col-md-3 form-control-comment">
                  {l s='optional' d='Shop.Forms.Help'}
                </span>*}
                </div>
            {/if}
          </div>

          <!-- Colonne droite : champ message -->
          <div class="col-md-8">
            <div class="form-group row">
              <label class="col-md-12 form-control-label text-right" for="contactform-message">
               {if $language.iso_code == 'en'}Message{else}Message{/if}
              </label>
              <div class="col-md-12">
                <textarea
                  id="contactform-message"
                  class="form-control w-100"
                  name="message"
                  placeholder="{l s='How can we help?' d='Shop.Forms.Help'}"
                  rows="10"
                >{if $contact.message}{$contact.message}{/if}</textarea>
              </div>
            </div>
          </div>
        </div>

        {if isset($id_module)}
          <div class="form-group row">
            <div class="offset-md-3">
              {hook h='displayGDPRConsent' id_module=$id_module}
            </div>
          </div>
        {/if}
      </section>

      <footer class="form-footer text-sm-left">
        <style>
          input[name=url] {
            display: none !important;
          }
        </style>
        <input type="text" name="url" value=""/>
        <input type="hidden" name="token" value="{$token}" />
        <input class="btn btn-primary" type="submit" name="submitMessage" value="{l s='Send' d='Shop.Theme.Actions'}">
      </footer>
    {/if}
  </form>
</section>

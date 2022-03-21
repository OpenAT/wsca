
Python Code inside mail_from and subject fields

mail_from
${'spendeninfo@vetmeduini.ac.at' if object.payment_tx_id.acquirer_id.ogonedadi_pspid == 'vemelive' else 'spenden@wolfscience.at' | safe }

subject
Betreff ${ 'Die Vetmeduni bedankt sich für Ihre Spende!' if object.payment_tx_id.acquirer_id.ogonedadi_pspid == 'vemelive' else 'Danke für Ihre Bezahlung!' | safe }

<div style="font-family: Arial, Verdana, sans-serif; font-size: 14px;">
    <p>
      % if object.partner_id.gender == 'male':
      Sehr geehrter Herr
      % elif object.partner_id.gender == 'female':
      Sehr geehrte Frau
      % elif object.partner_id.gender == 'other' or '':
      'Hallo'
      % endif
      ${object.partner_id.titel_web or ''} ${object.partner_id.firstname or ''} ${object.partner_id.lastname or ''},
      </p><br>
  % if object.payment_tx_id.acquirer_id.ogonedadi_pspid == 'vemelive':
    vielen Dank für Ihre Spende von <strong>${object.amount_total} ${object.pricelist_id.currency_id.name}</strong> und Ihre Unterstützung für die Veterinärmedizinische Universität Wien!<br>
    Sie leisten einen wichtigen Beitrag zur hohen Qualität unserer Projekte aus Wissenschaft, Bildung, Forschung und Tiermedizin und tragen somit zum Wohl der Tiere und Menschen bei.<p></p>
  % elif object.payment_tx_id.acquirer_id.ogonedadi_pspid != 'vemelive':
    vielen Dank für Ihre Spende von <strong>${object.amount_total} ${object.pricelist_id.currency_id.name}</strong> und Ihre Unterstützung für die Wölfe und<br>
    Hunde unserer weltweit einzigartigen Forschungseinrichtung!<br>
    Sie leisten einen wichtigen Beitrag zur hohen Qualität der Tierhaltung, zur <br>
    Weiterentwicklung unserer wichtigen Forschungsarbeit und zur ständigen<br>
        Verbesserung der Lebensqualität unserer Tiere des Wolfsforschungszentrums.<p></p>
  % endif

    <table style="table-layout:fixed; witdh:100%; border:0; font-family: Arial, Verdana, sans-serif; font-size: 14px;">
        <tbody><tr><th colspan="2" style="text-align:left;"><h3><br>Ihre Angaben zu Ihrer Unterstützung:</h3></th></tr>
        <tr><td>Nummer:&nbsp;</td><td style="text-align:left;"><strong>${object.name}</strong></td></tr>
        <tr><td>Spendenhöhe:&nbsp;</td><td style="text-align:left;"><strong>${object.amount_total} ${object.pricelist_id.currency_id.name}</strong></td></tr>
        <tr><td>Zahlungsmittel:&nbsp;</td><td style="text-align:left;"><strong>${object.payment_acquirer_id.name or ''}</strong></td></tr>
        <tr><td>Datum:&nbsp;</td><td style="text-align:left;"><strong>${format_tz(object.date_order, tz='Europe/Vienna', format='%Y-%m-%d %H:%M')}</strong></td></tr>
          <tr><td>Spendenzweck:&nbsp;</td><td style="text-align:left;"><strong>
                  % for line in object.order_line:
                    ${line.product_id.name or ''}&nbsp;
                  % endfor
                  </strong></td></tr>
          <tr><td>Spendenintervall:&nbsp;</td><td style="text-align:left;"><strong>
                  % for line in object.order_line:
                      %if line.payment_interval_name:
                        ${line.payment_interval_name or ''}&nbsp;
                      %endif
                  % endfor
                  </strong></td></tr>
        <tr><td>Status:&nbsp;</td><td style="text-align:left;"><strong style="text-transform:uppercase;">
          % if object.payment_tx_id.state == 'cancel':
            abgebrochen
          % elif object.payment_tx_id.state == 'draft' or '' or 'pending':
            in Bearbeitung
          % endif
          </strong></td></tr>
    </tbody></table>
    <p></p>
    <table style="table-layout:fixed; witdh:100%; border:0; font-family: Arial, Verdana, sans-serif; font-size: 14px;">
        <tbody><tr><th colspan="2" style="text-align:left;"><h3>Ihre Daten</h3></th></tr>
       <tr><td>Name:&nbsp;</td><td style="text-align:left;"><strong>
      % if object.partner_id.gender == 'male':
        Herr
      % elif object.partner_id.gender == 'female':
        Frau
      % elif object.partner_id.gender == 'other' or '':
        ''
      % endif
      % if object.partner_id.name:
        ${object.partner_id.titel_web or ''} ${object.partner_id.firstname or ''} ${object.partner_id.lastname or ''}
      % endif
      </strong></td></tr>
      <tr><td>Straße:&nbsp;</td><td style="text-align:left;"><strong>
      % if object.partner_id.street:
        ${object.partner_id.street} ${object.partner_id.street_number_web or ''}
      % endif
        </strong></td></tr>
      <tr><td>Stadt:&nbsp;</td><td style="text-align:left;"><strong>
      % if object.partner_id.city or object.partner_id.zip:
        ${object.partner_id.zip} ${object.partner_id.city}
      % endif
        </strong></td></tr>
      <tr><td>Email:&nbsp;</td><td style="text-align:left;"><strong>
      % if object.partner_id.email:
          <a href="mailto:${object.partner_id.email}">${object.partner_id.email}</a>
      % endif
          </strong></td></tr>
      <tr><td>Ursprung:&nbsp;</td><td style="text-align:left;"><strong>
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'na':
          keine Angabe
        % endif
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'WSCA_Webpage':
          WSCA Website
        % endif
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'Vetmeduni_Vienna_Website':
          Vetmeduni Vienna Website
        % endif
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'WSC_sponsor_infoflyer':
          WSC Patenschafts-Broschüre/Infoflyer
        % endif
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'visit_programm':
          Besucherprogramm WSC
        % endif
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'postal_call':
          Postalischer Spendenaufruf
        % endif
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'recommended_by_sponsor':
          Empfehlung bestehender Paten
        % endif
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'infosign':
          Anzeige/Inserat
        % endif
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'facebook':
          Facebook
        % endif
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'instagram':
          Instagram
        % endif
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'friends_related':
          Freunde/Bekannte/Verwandte
        % endif
        % if object.partner_id.x_HowYouHearBoutSponsorFriendship == 'others':
          Sonstiges
        % endif
        </strong></td></tr>
    </tbody></table>
<p></p>
% if object.giftee_partner_id.name:
    <table style="table-layout:fixed; witdh:100%; border:0; font-family: Arial, Verdana, sans-serif; font-size: 14px;">
        <tbody><tr><th colspan="2" style="text-align:left;"><h3>Ein Geschenk für:</h3></th></tr>
       <tr><td>Name:&nbsp;</td><td style="text-align:left;"><strong>
      % if object.giftee_partner_id.gender == 'male':
        Herr
      % elif object.giftee_partner_id.gender == 'female':
        Frau
      % elif object.giftee_partner_id.gender == 'other' or '':
        ''
      % endif
      % if object.giftee_partner_id.name:
        ${object.giftee_partner_id.titel_web or ''} ${object.giftee_partner_id.firstname or ''} ${object.giftee_partner_id.lastname or ''}
      % endif
      </strong></td></tr>
      <tr><td>Straße:&nbsp;</td><td style="text-align:left;"><strong>
      % if object.giftee_partner_id.street:
        ${object.giftee_partner_id.street} ${object.giftee_partner_id.street_number_web or ''}
      % endif
        </strong></td></tr>
      <tr><td>Stadt:&nbsp;</td><td style="text-align:left;"><strong>
      % if object.giftee_partner_id.city or object.giftee_partner_id.zip:
        ${object.giftee_partner_id.zip} ${object.giftee_partner_id.city}
      % endif
        </strong></td></tr>
      <tr><td>Geburtsdatum:&nbsp;</td><td style="text-align:left;"><strong>
      % if object.giftee_partner_id.birthdate_web:
          <a href="mailto:${object.giftee_partner_id.birthdate_web}">${object.giftee_partner_id.birthdate_web}</a>
      % endif
          </strong></td></tr>
      <tr><td>Telefonnummer:&nbsp;</td><td style="text-align:left;"><strong>
      % if object.giftee_partner_id.phone:
          <a href="mailto:${object.giftee_partner_id.phone}">${object.giftee_partner_id.phone}</a>
      % endif
          </strong></td></tr>
      <tr><td>Land:&nbsp;</td><td style="text-align:left;"><strong>
      % if object.giftee_partner_id.country:
          <a href="mailto:${object.giftee_partner_id.country}">${object.giftee_partner_id.country}</a>
      % endif
          </strong></td></tr>
      <tr><td>Email:&nbsp;</td><td style="text-align:left;"><strong>
      % if object.giftee_partner_id.email:
          <a href="mailto:${object.giftee_partner_id.email}">${object.giftee_partner_id.email}</a>
      % endif
          </strong></td></tr>
    </tbody></table>
% endif

    <p>Bleiben Sie auf dem Laufenden und folgen Sie uns auf
  % if object.payment_tx_id.acquirer_id.ogonedadi_pspid == 'vemelive':
<a href="https://www.facebook.com/Vetmeduni.Vienna" target="_blank">Facebook</a> oder <a href="https://www.instagram.com/vetmedunivienna/" target="_blank">Instagram</a>.<br>
</p><p>Bei Fragen zu Ihrer Spende kontaktieren Sie uns einfach per E-Mail unter mailto:spendeninfo@vetmeduni.ac.at oder telefonisch unter +43 1 25077-1154.
</p>
  % elif object.payment_tx_id.acquirer_id.ogonedadi_pspid != 'vemelive':
<a href="https://www.facebook.com/WolfScienceCenter/" target="_blank">Facebook</a> oder <a href="https://www.instagram.com/wolfscience" target="_blank">Instagram</a>.<br>
    Unterstützen Sie uns auch mit einer Spendenaktion auf <a href="https://www.facebook.com/fund/WolfScienceCenter/" target="_blank">Facebook</a>. Herzlichen Dank!<p></p>
    <p>Bei Fragen zu Ihrer Spende kontaktieren Sie uns einfach per E-Mail unter spenden@wolfscience.at oder telefonisch unter +43 1 25077-1154.
    </p>
  % endif


  % if object.payment_tx_id.acquirer_id.ogonedadi_pspid == 'vemelive':
    <p>Nochmals vielen Dank für Ihre wertvolle Unterstützung!<br>
    Herzliche Grüße,<br>
    Ihr Team der Vetmeduni
    </p>
    <table style="table-layout:fixed; witdh:100%; border:0; font-family: Arial, Verdana, sans-serif; font-size: 14px;">
        <tbody><tr><td style="width: 187px; overflow: hidden; text-overflow: ellipsis;">
              <div style="padding:5px; margin:0px;"><img src="https://spenden.vetmeduni.ac.at/wsca_config/static/src/css/veme/img/spendenabsetzbarkeit_vetmeduni.png/" width="187" style="width: 100%; height: auto; max-heigth: max-width:187px; display: block; border: 0px; outline: none;">
              </div></td><td><span style="color:#92a8a7;">Veterinärmedizinische Universität Wien (Vetmeduni)</span><br>
                Fundraising und Sponsoring<br>
                Veterinärplatz 1, 1220 Wien<br>
                Gebäude CB, Eingang im Hof<br>
                vetmeduni.ac.at<br><br>
                Datenschutz Vertraulichkeit</td>
                </tr>
        </tbody>
    </table>
  % elif object.payment_tx_id.acquirer_id.ogonedadi_pspid != 'vemelive':
    <p>Nochmals vielen Dank für Ihre wertvolle Unterstützung!<br>
    Herzliche Grüße,<br>
    Ihr Team des Wolfsforschungszentrum
    </p>

    <table style="table-layout:fixed; witdh:100%; border:0; font-family: Arial, Verdana, sans-serif; font-size: 14px;">
        <tbody><tr><td><span style="color:#92a8a7;">Wolf Science Center (WSC) | Wolfsforschungszentrum</span><br>
    eine Forschungseinrichtung der Vetmeduni Vienna<br>
    Dörfles 48, 2115 Ernstbrunn<br>
    T +43 1 25077-1154<br>
    M +43 664 60257-6750<br>
    <a href="mailto:spenden@wolfscience.at" style="background-color: rgb(255, 255, 255);">spenden@wolfscience.at</a><br>
    <a href="https://www.wolfscience.at" style="background-color: rgb(255, 255, 255);" target="_blank">https://www.wolfscience.at</a><br>
    <a href="https://www.facebook.com/WolfScienceCenter" style="background-color: rgb(255, 255, 255);" target="_blank">https://www.facebook.com/WolfScienceCenter</a>
            </td>
            <td style="width: 150px; overflow: hidden; text-overflow: ellipsis;">
              <div style="padding:5px; margin:0px;"><img src="https://spenden.wolfscience.at/website/image/ir.attachment/952_9a42ec3/datas" width="150" style="width: 100%; height: auto; max-heigth: max-width:150px; display: block; border: 0px; outline: none;">
              </div>
            </td>
        </tr>
    </tbody></table>
  % endif

</div>
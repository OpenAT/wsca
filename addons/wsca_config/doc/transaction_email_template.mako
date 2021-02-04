

<div style="font-family: Arial, Verdana, sans-serif; font-size: 14px;">
    <p>Sehr geehrte/r
      % if object.partner_id.gender == 'male':
      Herr
      % elif object.partner_id.gender == 'female':
      Frau
      % elif object.partner_id.gender == 'other' or '':
      ''
      % endif
      ${object.partner_id.titel_web or ''} ${object.partner_id.firstname or ''} ${object.partner_id.lastname or ''},
      </p><br>
    vielen Dank für Ihre Spende von <strong>${object.amount_total} ${object.pricelist_id.currency_id.name}</strong> und Ihre Unterstützung für die Wölfe und<br>
    Hunde unserer weltweit einzigartigen Forschungseinrichtung!<br>
    Sie leisten einen wichtigen Beitrag zur hohen Qualität der Tierhaltung, zur <br>
    Weiterentwicklung unserer wichtigen Forschungsarbeit und zur ständigen<br>
        Verbesserung der Lebensqualität unserer Tiere des Wolfsforschungszentrums.<p></p>

    <table style="table-layout:fixed; witdh:100%; border:0; font-family: Arial, Verdana, sans-serif; font-size: 14px;">
        <tbody><tr><th colspan="2" style="text-align:left;"><h3><br>Ihre Angaben zu Ihrer Spende</h3></th></tr>
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
    </tbody></table>
    <p>Bleiben Sie auf dem Laufenden und folgen Sie uns auf <a href="https://www.facebook.com/WolfScienceCenter/" target="_blank">Facebook</a> oder <a href="https://www.instagram.com/wolfscience/" target="_blank">Instagram</a>.<br>
    Unterstützen Sie uns auch mit einer Spendenaktion auf <a href="https://www.facebook.com/fund/WolfScienceCenter/" target="_blank">Facebook</a>. Herzlichen Dank!</p>

    <p>Bei Fragen zu Ihrer Spende kontaktieren Sie uns einfach per E-Mail unter spenden@wolfscience.at oder telefonisch unter +43 1 25077-1154.
    </p>

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

</div>

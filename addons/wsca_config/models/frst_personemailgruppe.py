# -*- coding: utf-8 -*-
from openerp import models, fields, api
import logging
logger = logging.getLogger(__name__)


# PersonEmailGruppe: FRST groups for email addresses
class FRSTPersonEmailGruppe(models.Model):
    _inherit = "frst.personemailgruppe"

    _checkbox_fields_group_identifier = {
            'newsletter_web': 30104,
            'newsletter_vetmed': 406020
        }
    logger.info("WSCA frst.personemailgruppe _checkbox_fields_group_identifier: %s" % _checkbox_fields_group_identifier)

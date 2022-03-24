# -*- coding: utf-8 -*-
from openerp import api, models, fields, SUPERUSER_ID
import logging
_logger = logging.getLogger(__name__)


# Additional fields for forms
class ResPartner(models.Model):
    _inherit = 'res.partner'

    newsletter_vetmed = fields.Boolean(string="Newsletter Vetmed")

#!/usr/bin/env python
# encoding: utf-8
"""
index.py

Created by Francisco M. Silva Ferreira on 2011-06-17.
Copyright (c) 2011 __MyCompanyName__. All rights reserved.
"""
import os
import django

from django import http
from django import shortcuts

import logging



def index(request):
  params = {}
  return shortcuts.render_to_response("index.html", params)
  


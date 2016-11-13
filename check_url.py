#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import glob
import re
import requests

htmlfiles = []
def Get_html_files(rootDir):
    for lists in os.listdir(rootDir):
        path = os.path.join(rootDir, lists)
        if os.path.isfile(path):
            letters = path[-4 :]
            if letters == 'html':
                htmlfiles.append(path)
        else:
            Get_html_files(path)

Get_html_files('.')

urlset = set()
for file in htmlfiles:
    fin = open(file, 'rt')
    lines = fin.readlines()
    fin.close
    for line in lines:
        urls = re.findall('http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+', line)
        for url in urls:
            if ((url == "") or (url in urlset)):
                continue
            r = requests.get(url)
            urlset = urlset | {url}
            if (r.status_code != 200):
                print(file, r.status_code, url)

#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import glob
import requests
from bs4 import BeautifulSoup

def get_html_files(rootdir="."):
    htmlfiles = glob.glob(rootdir + "/**/*.html", recursive=True)

    for i, file in enumerate(htmlfiles):
        print("{0}/{1}: {2}".format(i+1, len(htmlfiles), file))

    return htmlfiles

def get_urls(htmlfiles):
    urlset = set()

    for file in htmlfiles:
        with open(file, "r") as fin:
            html_content = fin.read()

        soup = BeautifulSoup(html_content, 'html.parser')

        urls = [link.get('href') for link in soup.find_all('a', href=True)]
        urlset.update(urls)

    for i, url in enumerate(urlset):
        print("{0}/{1}: {2}".format(i+1, len(urlset), url))

    return urlset

def check_urls(urls):
    for url in urls:
        r = requests.head(url)
        if r.status_code != 200:
            print(r.status_code, url)

htmlfiles = get_html_files('public')
urls = get_urls(htmlfiles)
#check_urls(urls)

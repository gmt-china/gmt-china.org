#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import glob
import requests
from urllib.parse import unquote
from bs4 import BeautifulSoup


def get_html_files(rootdir="."):
    '''Get HTML filelist'''

    return glob.glob(rootdir + "/**/*.html", recursive=True)


def get_urls(htmlfiles):
    ''' Extract URLs from HTML files '''

    urlset = set()
    for file in htmlfiles:
        with open(file, "r") as fin:
            html_content = fin.read()

        soup = BeautifulSoup(html_content, 'html.parser')

        urls = []
        # <a href="..." ></a>
        urls += [link.get('href') for link in soup.find_all('a', href=True)]
        # <link href="..." />
        urls += [link.get('href') for link in soup.find_all('link', href=True)]
        # <script src="..."></script>
        urls += [link.get('src') for link in soup.find_all('script', src=True)]
        # <img src="...">
        urls += [link.get('src') for link in soup.find_all('img', src=True)]

        urlset.update(urls)

    return urlset

def url_postprocess(urls):

    local = set()
    remote = set()
    for url in urls:
        if url == "" or url.startswith("#") or url.startswith("mailto:"):
            continue
        elif url.startswith("//"):
            remote.add("http:" + url)
        elif url.startswith("/"):
            local.add("dist" + url)
        elif url.startswith("http://gmt-china.org"):
            local.add(url.replace("http://gmt-china.org", "dist"))
        elif url.startswith("http"):
            remote.add(url)

    local2 = set()
    for url in local:
        if url.endswith('/'):
            url = url + 'index.html'
        local2.add(unquote(url))

    return local2, remote


def check_localfile(files):
    for file in files:
        if not os.path.exists(file):
            print("404 {0}".format(file))


def check_urls(urls):
    for url in urls:
        r = requests.get(url)
        if r.status_code != 200:
            print(r.status_code, url)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python %s topDir" % sys.argv[0])
        sys.exit()

    topDir = sys.argv[1]
    htmlfiles = get_html_files(topDir)
    urls = get_urls(htmlfiles)
    local, remote = url_postprocess(urls)
    check_localfile(local)
    check_urls(remote)

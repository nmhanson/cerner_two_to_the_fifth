#!/usr/bin/env python3

# cerner_2^5_2019

'''
Gets the quote of the day and prints it to stdout.
Call this script in your .bashrc to display it before each shell session
(and also drastically increase your shell's startup time)
'''
import requests
from textwrap import fill # limit the line length (soft-wrapping)

response = requests.get("https://quotes.rest/qod").json()

if 'error' in response: # probably hit the rate limit (10 req/hr)
    exit(1)

else:
    quote, *_ = response['contents']['quotes']
    text_content, author = (quote['quote'], quote['author'])
    width = min(len(text_content), 80) # cap width at 80 characters
    h_sep = '+' + '-' * width + '+'
    padding = (width - len(author)) * " " # right-justify with spaces

    print(h_sep)
    print(fill(text_content.join(['"', '"']), 80))
    print(padding + '- ' + quote['author'])
    print(h_sep)

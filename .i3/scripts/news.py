#!/usr/bin/env python
# -*- coding: utf-8 -*-
import time
import sys
import json
import math
import random
from urllib.request import urlopen
from urllib.error import URLError


def output(message):
    """
    Outputs data to stdout, without buffering.
    """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()


def readInput():
    """
    Reads input that is piped to this script (usually from i3status).
    """
    line = sys.stdin.readline().strip()
    if not line:
        sys.exit(3)
    return line


def passThrough():
    """
    To be called in order to pass through the i3status version and
    then the infinite JSON.
    """
    output(readInput())
    output(readInput())


def getAge(pubTime):
    """
    Converts the published time (relevant to the epoch) into a human readable
    format.
    """
    minutes = math.floor((time.time() - pubTime) / 60)
    if minutes > 1439:
        days = math.floor(minutes / 1440)
        if days > 1:
            return "{0} days ago".format(days)
        else:
            return "{0} day ago".format(days)
    if minutes > 59:
        hours = minutes / 60
        if hours > 1:
            return "{0} hours ago".format(math.floor(hours))
        else:
            return "{0} hour ago".format(math.floor(hours))
    elif minutes < 1:
        return "Moments ago"
    else:
        return "{0} minutes ago".format(minutes)


def getNews():
    """
    Connects to the BBC API, removes unnecessary data and returns a dictionary
    with topic for a key and stories for the values.
    """
    news = {}
    for topic in ['technology', 'uk', 'headlines', 'world']:
        try:
            response = urlopen('http://api.bbcnews.appengine.co.uk/stories/{0}'.format(topic))
            jsonObj = json.loads(response.read().decode())
            # Remove thumbnail information, audio and video stories.
            jsonObj['stories'] = [x for x in jsonObj['stories'] if not 'VIDEO'
                                  in x['title'] and not 'AUDIO' in x['title']]
            for index, story in enumerate(jsonObj['stories']):
                del jsonObj['stories'][index]['thumbnail']
                del jsonObj['stories'][index]['link']
            # Rearrange the dictionary to allow multiple topics to coexist.
            news[jsonObj['topic']['title']] = jsonObj['stories']
        except URLError as e:
            print('Broken: {0}'.format(e))
    return news


def getNumberofArticles(news):
    """
    A helper function to check how many articles are left,
    in order to request new articles.
    """
    count = 0
    for topic in list(news):
        count += len(news[topic])
    return count


def getRandomArticle(news):
    """
    Selects a random article from a random topic and removes it from the news
    dictionary.
    """
    topic = random.choice(list(news))
    article = random.choice(news[topic])
    del news[topic][news[topic].index(article)]
    return article

if __name__ == '__main__':
    passThrough()
    news = getNews()
    article = getRandomArticle(news)
    while True:
        if round(time.time()) % 300 == 0:
            article = getRandomArticle(news)
        line, prefix = readInput(), ''
        if getNumberofArticles(news) == 1:
            news = getNews()
        if line.startswith(','):
            line, prefix = line[1:], ','
        # Convert the inputted json string to json in order for another
        # dictionary to be inserted, containing the new data.
        j = json.loads(line)
        j.insert(0, [{'full_text': '{0}'.format(article['description']), 'name': 'description'},
            {'full_text': '{0}'.format(getAge(article['published'])), 'name': 'age'}])
        output(prefix + json.dumps(j))

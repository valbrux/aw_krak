import urllib2
import argparse
import json
from pprint import pprint
from decimal import Decimal

url = "https://api.kraken.com/0/public/Ticker?pair="

def getInfo(pair):
    info = []
    body = urllib2.urlopen(url+pair)
    j = json.loads(body.read())
    for i in j['result']:
        pair = j['result'][i]
        info.append(round(float(pair['a'][0]),3))
        info.append(round(float(pair['b'][0]),3))
    return info

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-p',required=True,help="Pair")
    args = parser.parse_args()
    info = getInfo(args.p)
    print " "+str(info[0])+"/"+str(info[1])+" " 


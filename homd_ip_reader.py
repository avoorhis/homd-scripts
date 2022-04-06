#!/usr/bin/env python

import os,sys
import argparse
import datetime
import requests
import json
import csv
import pycountry


def get(ip):
    #https://pytutorial.com/python-get-country-from-ip-python
    endpoint = f'https://ipinfo.io/{ip}/json'
    response = requests.get(endpoint, verify = True)

    if response.status_code != 200:
        return 'Status:', response.status_code, 'Problem with the request. Exiting.'
        exit()

    data = response.json()

    return data['country']

def validate(date_text):
    try:
        datetime.datetime.strptime(date_text, '%Y-%m-%d')
    except ValueError:
        raise ValueError("Incorrect data format, should be YYYY-MM-DD")
        
def run(args):
    #print(args)
    report = '\nHOMD BLAST+ IP/Country Report\n'
    save_list = []
    use_all = False
    
    
    with open(args.infile) as csv_file: 
        csv_reader = csv.reader(csv_file, delimiter='\t') # KK tab
        loglist = list(csv_reader)
        #print(loglist)
        if args.mindate:
            mindate = args.mindate
        else:
            mindate = loglist[0][0]
        if args.maxdate:
            maxdate = args.maxdate
        else:
            maxdate = loglist[len(loglist)-1][0]
        #print ('min',mindate,'max',maxdate)
        for row in loglist:
            #print(row)
            date_str = row[0]
            
            if date_str >= mindate and date_str <= maxdate:
                ip = row[1]
                obj = {}
                
                my_country = get(ip)
                c = pycountry.countries.get(alpha_2=my_country)
                obj['date'] = date_str
                obj['ip'] = ip
                obj['country'] = c.name
                save_list.append(obj)
            
    #print(save_list)
    report += "\nFrom: "+mindate+"   To: "+maxdate+"\n"
    report += ' '+'_'*75+"\n"
   
    report += "| "+f'{"Date":<20}'+'| '+f'{"IP":<20}'+'| '+f'{"Country":<30}'+"|"+"\n"
    report += "|"+'_'*75+"|"+"\n"
    for item in save_list:
        print(item)
        report += '| '+f'{item["date"]:<20}'
        report += '| '+f'{item["ip"]:<20}'
        report += '| '+f'{item["country"]:<30}'+'|\n'
    report += "|"+'_'*75+"|"+"\n"
    print(report)
    
if __name__ == "__main__":

    usage = """
    USAGE:
        ./homd_ip_reader.py -i infile
        
        infile tab delimited
          homd_blast_ip.log

        optional
          -min/--mindate   dafault none
          -max/--maxdate   default none
    """

    parser = argparse.ArgumentParser(description="." ,usage=usage)

    parser.add_argument("-i", "--infile",   required=True,  action="store",   dest = "infile", default='none',
                                                    help=" ")
#    parser.add_argument("-s", "--source",   required=True,  action="store",   dest = "source", 
#                                                    help="ONLY segata dewhirst eren")
    
    parser.add_argument("-host", "--host",
                        required = False, action = 'store', dest = "dbhost", default = 'localhost',
                        help = "choices=['homd',  'localhost']")
    
    parser.add_argument("-d", "--delimiter", required = False, action = 'store', dest = "delimiter", default = 'tab',
                         help = "Delimiter: commaAV[Default]: 'comma' or tabKK: 'tab'")
    parser.add_argument("-v", "--verbose",   required=False,  action="store_true",    dest = "verbose", default=False,
                                                    help="verbose print()") 
    parser.add_argument("-min", "--mindate", required = False, action = 'store', dest = "mindate", default = None,
                                                  help = "")
    parser.add_argument("-max", "--maxdate",   required=False,  action="store",    dest = "maxdate", default=None,
                                                    help="") 
    
    args = parser.parse_args()
    
    #parser.print_help(usage)
                        

    
    run(args)
   




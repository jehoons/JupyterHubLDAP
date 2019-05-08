from ldif3 import LDIFParser
import json
import sys
import argparse
# sys.stdin
import os


if __name__ == '__main__':  
    progpath = os.path.dirname(os.path.realpath(__file__))
    parser = argparse.ArgumentParser()
    parser.add_argument("-l","--list",action='store_true',
            help="result is redued. default: %(default)s", default=False)

    args = parser.parse_args()
    args_dict = vars(args)
    # run_ptp(args_dict)

    parser = LDIFParser(sys.stdin) 
    data = []
    uidmap = {}
    try: 
        for dn, entry in parser.parse():
            data.append(dict(entry))
            _entry = dict(entry)
            uidmap[ _entry['mail'][0].split('@')[0] ] = _entry['uid'][0]
    except ValueError: 
        pass 

    if args_dict['list'] == False: 
        print(json.dumps(uidmap))
    else: 
        for l in uidmap.keys(): 
            print(uidmap[l]) 

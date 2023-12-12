### Original orbs script written by steve
#!/usr/bin/env python
import math
import socket
import requests
import json
import os.path
import MySQLdb
import datetime
from datetime import timedelta, datetime, date
 
#connect to sqlDBs 
db = MySQLdb.connect(host="localhost", port=9950, user="tim", passwd="pTMVx?4HP3D7PEJp", db="itron");
cursor = db.cursor();
cursor.execute("SELECT * FROM old_orbs"); 
rows = cursor.fetchall();

#sends the packet to the arduino 
def sendpacket(ip,e,w):
    mysock = socket.socket();
    mysock.settimeout(35);
    try:
        mysock.connect((ip, 9950));
        sendstring = "/E"+str(e)+"W"+str(w)+"&";
        mysock.send(sendstring);
    except socket.timeout: 
        print('connection timed out for ip:'+str(ip));
        mysock.close();
    except socket.error: 
        print('fail');
        mysock.close();
    mysock.close();

#finds current usage of a point
#looks back at numMinutes most recent readings from the 'live' interval  
def findAverageCurrentUsage(nm,numMinutes,token):
    counter = 0;
    total = 0;
    url = 'https://api.buildingos.com/meters/' + nm + '/data?resolution=live&order=asc'; 
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token
    };
    request = requests.get(url, headers=headers);

    for item in reversed(request.json()['data']):
        value = item['value'];
        total += value;
        counter += 1; 
        if counter >= numMinutes:
            break;
    
    if counter != 0:
        average = total/counter;
    else:
        average = 0; 
    
    return  average

# Looks over the past data from the hour this script was run (ex: if its 12:36pm it grabs 12:00pm data). 
# If it's a weekday it uses the last 7 weekdays of data at this hour.
# If it's a weekend it uses the last 5 weekend days of data at this hour. 
# The right data points are then put into a list, sorted and returned.
def typicalUsage(nm,token):
    verbose = True;
        values = [];    #A list that holds the relevant data points.    
    now = datetime.now();
    now = now.strftime("%Y-%m-%dT%H:%M:%S");
    if verbose: 
        print "&*-----------Typical Usage ----------*&"
    x = datetime.today().weekday(); #x is the day of the week from 0-6.     
    if x == 5 or x == 6: #Checks to see if it's a weekend.
        #if it is you need 21 days worth of data
        then = timedelta(days=21);
        then = datetime.now() - then; 
        then = then.strftime("%Y-%m-%dT%H:%M:%S");
        url = 'https://api.buildingos.com/meters/' + nm  + '/data?start=' + then + "-04:00&end=" + now + "-04:00&resolution=hour&order=asc";
        headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + token
        };
        request = requests.get(url, headers=headers);
        for item in reversed(request.json()['data']):
            day = date(int(item['localtime'][0:4]),int(item['localtime'][5:7]),int(item['localtime'][8:10]))
            if (int(item['localtime'][11:13]) == datetime.now().hour) and (day.weekday() == 5 or day.weekday() == 6):
                if verbose:
                    print str(item['localtime']) + "         "+str(item['value']);
                values.append(item['value'])
        else: #Else it is a weekday.    
        #now you only need 9
        then = timedelta(days=9);
        then = datetime.now() - then; 
        then = then.strftime("%Y-%m-%dT%H:%M:%S");
        url = 'https://api.buildingos.com/meters/' + nm  + '/data?start=' + then + "-04:00&end=" + now + "-04:00&resolution=hour&order=asc";
        headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + token
        };
        print url
        request = requests.get(url, headers=headers)
                for item in reversed(request.json()['data']):
            day = date(int(item['localtime'][0:4]),int(item['localtime'][5:7]),int(item['localtime'][8:10]))#This gets the day of the week from each point      
            if (int(item['localtime'][11:13]) == datetime.now().hour) and (day.weekday() >= 0 and day.weekday() <= 4):#If its the right hour and a weekday
                print item
                if verbose:
                                        print str(item['localtime']) + "         "+str(item['value']);
                                values.append(item['value']);
    print sorted(values);
    return sorted(values); #Returns a sorted list of the relevent data points 

# This function picks the color that is sent to the orb.
# It takes in the sorted list of past usage which determines the percentile groups.
# The percentile group that the current usage falls in determines the color of the orb.
def arduinoColor(typical, current):
    if current >= percentile(typical,80):
        packet = 4;
    if current < percentile(typical,80):
        packet = 3;
    if current < percentile(typical,60):
        packet = 2;
    if current < percentile(typical,40):
        packet = 1;
    if current < percentile(typical,20):
        packet = 0;
    return packet;

# Helper function to find what percentile the current use falls under. 
def percentile(data, percentile):
    size = len(data);
    return sorted(data)[int(math.ceil((size * percentile) / 100)) - 1];

#sends out the orb colors 
def colors(token):  
    verbose = True; 
    for row in rows:
        cursor.execute("SELECT name,IP,avgtype,elecpoint,waterpoint,typicalUseW,typicalUseE FROM orbs WHERE id="+str(row[0])+";")
        attributes = cursor.fetchall()
        for attribute in attributes:
            #each row of data 
            nm = attribute[0]
            ip = attribute[1]
            averageType = attribute[2]  
#           url = 'https://api.buildingos.com/meters/'
#           headers = {
#             'Content-Type': 'application/json',
#             'Authorization': 'Bearer ' + token
#           };
#           request = requests.get(url, headers=headers);
#           print request.json()['data'][attribute[3]]  
            ePoint = attribute[3]
            wPoint = attribute[4]
            if wPoint != 'x' and 'X':
                waterTypical = typicalUsage(wPoint, token) #no longer from sql 
            else:
                waterTypical = 'x'
            if ePoint != 'e' and 'E':
                elecTypical = typicalUsage(ePoint, token)  #no longer from sql 
            else:
                elecTypical = 'x'
            water_averaging_span = 10;
            
            if verbose == True:
                print "  ::----- INFO -----::"
                print "name:                   " + nm
                print "IP:                     " + ip
                print "average type:           " + averageType
                print "electricity point name: " + ePoint
                print "water point name:       " + wPoint
                print "w typical: "+ str(waterTypical)
                print "e typical: "+ str(elecTypical)
                print "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
                print ""

            # Here we determine the electrical average or send an x if electcity is disabled 
            if (ePoint != 'x' and ePoint != 'X'): #if the datapoint isn't disabled (named 'x' or 'X')
                elecCurrent = findAverageCurrentUsage(ePoint,0,token) #call the function to find the current electriciy usage
                elecSend = arduinoColor(elecTypical,elecCurrent) #and use it to find the color we will be sending, then store that in the variable
            else: #or, if the electricity was disabled...
                elecSend = 'x' #just send a blank

            #Now we do the same with water
            if (wPoint != 'x' and wPoint != 'X'): #Again, if the water datapoint isn't disabled...
                waterCurrent = findAverageCurrentUsage(wPoint,water_averaging_span,token) #get the water average over the averaging span (set WAY back at the beginning)
                waterSend = arduinoColor(waterTypical,waterCurrent) #and then find, and set, the color we will send
            else: #or, if the point is disabled, send nothing
                waterSend = 'x'

            if verbose:
                print "current electricity usage: " + str(elecCurrent)
                print "sending to arduino:        "+ str(elecSend)
                print ""
                print "current water usage: " + str(waterCurrent)
                print "sending to arduino:        "+ str(waterSend)
                print ""
    
            #need change some variables to make the sql happy
            now = datetime.now();
            if waterTypical != 'x':
                waterTypical = sum(waterTypical)/len(waterTypical)
            if elecTypical != 'x':  
                elecTypical = sum(elecTypical)/len(elecTypical)
    
            myString = "/E"+str(elecSend)+"W"+str(waterSend)+"&" #build the string that we will record as 'last packet sent' for the orb...
            cursor.execute("UPDATE orbs SET lastpacket=\'"+myString+"\' WHERE id="+str(row[0])+";") #and submit it
            cursor.execute("UPDATE orbs SET lastContactTime=\'"+str(now)+"\' WHERE id="+str(row[0])+";") #then update the last contact time
            db.commit()
            sendpacket(ip,elecSend,waterSend) #submit the packet using the sendpacket function, using the variables we have calculated
    cursor.close()

#gets the token and saves it to a text file
def token():
    #if the text file exists get tokens
    if os.path.isfile('tokens.txt'):
        
        #get tokens from file
        fp = open('tokens.txt');
        token = fp.readline();
        refresh_token = fp.readline();
        fp.close();
        
        #dummy api request to test validity of token
        headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token
        };
        request = requests.get(url, headers=headers);
        
        #if its bad refresh     
        if request.status_code == 401 or request.status_code == 403:    
            print "attempt refresh";
            refresh_info = {"client_id": client_id, "client_secret": client_secret, "grant_type": 'refresh_token', "refresh_token": refresh_token};
            r = requests.post(token_url, params=refresh_info);      
            
            #getting the access token
            r = requests.post(token_url, params=info);
            token =  r.json()['access_token'];

            #getting the refresh token
            refresh_token = r.json()['refresh_token'];
            
            #write tokens to text file
            file = open("tokens.txt", "w");
            file.write( token + "\n");
            file.write( refresh_token + " \n");
            file.close();

    #if the text files doesn't exists make it
    else:
        #getting the access token
        r = requests.post(token_url, params=info).json();
        token =  r['access_token'];

        #getting the refresh token
        refresh_token = r['refresh_token'];

        #write tokens to text file
        file = open("tokens.txt", "w");
        file.write( token + "\n");
        file.write( refresh_token + " \n");
        file.close();
    return token;

token = token();
colors(token);
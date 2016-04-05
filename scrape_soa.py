
"""
https://splinter.readthedocs.org/en/latest/index.html
http://effbot.org/zone/python-list.htm
"""

us_states = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FL', 
             'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 
             'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 
             'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 
             'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']

can_provinces = ['AB', 'BC', 'MB', 'NB', 'NL', 'NT', 'NS', 'NU', 'ON', 'PE', 
                 'QC', 'PQ', 'SK', 'YT']

tracks = ['FINANCE', 'GI', 'HEALTH', 'INVESTMENTALM', 'LIFE', 'RETIREMENT', 'RM']

from splinter import Browser
from bs4 import BeautifulSoup
import pandas as pd

browser = Browser()
browser.visit('https://www.actuarialdirectory.org/SearchDirectory.aspx')
browser.select('dnn$ctr3472$DirectorySearch$ddlCountry', 'USA')
browser.select('dnn$ctr3472$DirectorySearch$ddlState', 'ID')
browser.select('dnn$ctr3472$DirectorySearch$ddlPrimaryAreaofPractice', 'HEALTH')
browser.find_by_name('dnn$ctr3472$DirectorySearch$btnSearch').click()
soup = BeautifulSoup(browser.html)

table = soup.find("table", {"id" : "dnn$ctr3472$DirectorySearch$dgSearchResult" })
print(table)


myData = pd.DataFrame(soup)
myData.to_csv("dat.csv")



#'dnn$ctr3472$DirectorySearch$tblSearchResult'

print(ans.value)





#soup = BeautifulSoup()





browser.quit()


#dnn_ctr3472_DirectorySearch_dgSearchResult

'''
for i in range(51):
    print(us_states[i])
'''

'''
# dump resulting text to file
with open("trades_{}.csv".format(symbol), "w") as out_f:
    out_f.write(data.text)
'''

#javascript:__doPostBack('dnn$ctr3472$DirectorySearch$dgSearchResult$ctl24$ctl01','')


"""
tracks_not_used = ['NA', 'OTHER']
"""

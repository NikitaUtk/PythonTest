import json

import requests
import Tests.auth as a
from requests_ntlm import HttpNtlmAuth
import re


def repalceVar(method, data):
    val = re.findall(r'{([^{}]+)}', method)
    for i in val:
        resStr = data[i]
        method = str.replace(method, '{' + i + '}', str(resStr))
    return method
class Responce:


    def getResponce(self, method, typeRequest, json={}, data={} , params={}, headers={"Content-type": "application/json", "Accept": "text/plain"}):
        # data = data -В data помещаются параметры которые необходимо обязательно указать
        # headers = headers
        # params = params В params помещаются параметры которые будут указаны после url
        # json Помещаются параметры которые будут передаваться в body POST запроса
        method = repalceVar(method, data)
        if(typeRequest == "POST"):
            responce = requests.post(a.url + method,
                                 auth=HttpNtlmAuth(a.domain + '\\' + a.username, a.password),
                                 headers=headers,
                                 json=json
                                 )
            print(responce.url)
            print(responce.status_code)
        elif(typeRequest == "GET"):
            responce = requests.get(a.url + method,
                                 auth=HttpNtlmAuth(a.domain + '\\' + a.username, a.password),
                                 params=params
                                )
            print(responce.url)
            #print(responce.status_code)
        else:
            return "Wrong typeRequest"
        return [responce.url,responce.status_code, responce.text]

    if __name__ == "__main__":

        i = json.loads('{"ReportId": 0}')
        k = {"ReportId": 0}
        print(i)
        print(k)
        # repalceVar(method="api/Deals/{dealGid}/accounts/{accountGid}",data = {"dealGid": "11", "accountGid": "12"} )
        s = getResponce('',method="api/report/BalanceReconcilement/{ReportId}/delete", typeRequest="POST",data={"ReportId": "0"})
        print(s[0])
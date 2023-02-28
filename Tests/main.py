import requests
import Tests.auth as a
from requests_ntlm import HttpNtlmAuth
import re

def get_logged_in_session():
    sess = requests.Session()
    s = sess.get(a.url + a.connection, auth=HttpNtlmAuth(a.domain + '\\' + a.username, a.password))
    print (s.status_code)
    return s.cookies

def repalceVar(method, data):
    val = re.findall(r'{([^{}]+)}', method)
    for (index, elem) in enumerate(val):
        resStr = data[val[index]]
        method = str.replace(method, '{' + elem + '}', str(resStr))
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
                                 params=params,
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
        # repalceVar(method="api/Deals/{dealGid}/accounts/{accountGid}",data = {"dealGid": "11", "accountGid": "12"} )
        s = getResponce('',method="api/Expertise/{expId}/applied_method/{applMethodId}/set/{setId}/delete", typeRequest="POST", params={"userGid": 1}, data={"expId": 1, "applMethodId": 1, "setId": 1})
        print(s[0] + " Status code: " + str(s[1]))
        print(get_logged_in_session())
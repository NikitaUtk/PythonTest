import Tests.main as b
import Tests.auth as a
from behave import *
import json
import requests
from requests_ntlm import HttpNtlmAuth


@given (u'logging')
def get_logged_in_session(context):
    context.sess = requests.Session()
    context.sess.get(a.url + a.connection, auth=HttpNtlmAuth(a.domain + '\\' + a.username, a.password))
    print(1)

@given(u'I have "{data}" "{json_}" "{params}" "{method}" "{headers}" "{typeRequest}"')
def step_impl(context, data, json_, params, method, headers, typeRequest):
    # data = data -В data помещаются параметры которые необходимо обязательно указать
    # headers = headers
    # params = params В params помещаются параметры которые будут указаны после url
    # json Помещаются параметры которые будут передаваться в body POST запроса
    method = b.repalceVar(method, data=json.loads(data))
    if (typeRequest == "POST"):
        responce = context.sess.post(a.url + method,
                                 headers=json.loads(headers),
                                 params=json.loads(params),
                                 json=json.loads(json_)
                                 )
        print("URL: " + responce.url + " Status_code: " + str(responce.status_code))
    elif (typeRequest == "GET"):
        responce = context.sess.get(a.url + method,
                                params=params
                                )
        print("URL: " + responce.url + " Status_code: " + str(responce.status_code))


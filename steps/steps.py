from Tests.main import *
from behave import *
import json
import requests

# @given (u'logging')
# def get_logged_in_session(context):
#     context.sess = requests.Session()
#     context.sess.get(a.url + a.connection, auth=HttpNtlmAuth(a.domain + '\\' + a.username, a.password))
def before_all(context):
    context.sess = requests.Session()
    context.sess.get(a.url + a.connection, auth=HttpNtlmAuth(a.domain + '\\' + a.username, a.password))

@given(u'I have "{data}" "{json_}" "{params}" "{method}" "{headers}" "{typeRequest}"')
def step_impl(context, data, json_, params, method, headers, typeRequest):
    responce = Responce()
    result = responce.getResponce(data=json.loads(data), json=json.loads(json_), params=json.loads(params), headers=json.loads(headers), method=method, typeRequest=typeRequest)
    if(result[1] != 200):
        print(method + " Status_code: " + str(result[0]) + " TypeRequest: " + typeRequest)
        assert(result[0] + " TypeRequest: " + typeRequest)

from Tests.main import *
from behave import *


@given(u'I have')
def step_impl(context):
    responce = Responce()
    for row in context.table:
        print(row['data'])
        result = responce.getResponce(data=row['data'], json=json.loads(row['json']), params=json.loads(row['params']), headers=json.loads(row['headers']), method=row['method'], typeRequest=row['typeRequest'])
        # if(result[0] != 200):
        # print(row['method'] + " Status_code: " + str(result[0]) + " TypeRequest: " + row['typeRequest'])
        print(result[0] + " TypeRequest: " + row['typeRequest'])

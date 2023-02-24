Feature: Checking search
#Имя сценария
Scenario Outline: Сheck some text in search results
#Наши шаги
  Given I have "<data>" "<json_>" "<params>" "<method>" "<headers>" "<typeRequest>"
      Examples: Hands
      |data|json_|params|method|headers|typeRequest|
      |""|""|""|api/Audit|""|GET|
      |""|""|""|api/Audit/export|""|GET|
      |""|""|""|api/report/BalanceReconcilement|""|GET|
      |""|{"сheckDate": "string","userGid": 0,"dealTypes": [{"dealTypeCD": 0}]}|""|api/report/BalanceReconcilement|{"Content-type": "application/json", "Accept": "text/plain"}|POST|
      |""|""|{"ReportId":1,"OrderByAscDesc":"Asc"}|api/report/BalanceReconcilement/deal_types|""|GET|
      |{"ReportId": 0}|""|""|api/report/BalanceReconcilement/{ReportId}/delete|{"Content-type": "application/json", "Accept": "text/plain"}|POST|
      |""|""|""|api/Clients|""|GET|
      |""|""|""|api/Clients/export|""|GET|
      |{"gid": 1}|""|""|api/Clients/{gid}|""|GET|
      |{"gid": 1}|""|""|api/Clients/{gid}|""|POST|
      |{"gid": 1}|""|{"VersionDate": 1, "ModifiedDate": 2}|api/Clients/{gid}/deals|""|GET|
      |{"gid": 1}|""|""|api/Clients/{gid}/deals/export|""|GET|
      |{"gid": 1}|""|""|api/Clients/{gid}/vzl-periods|""|GET|

#      |{"userGid": 1, "roleId": 1}|""|api/Sessions|{"Content-type": "application/json", "Accept": "text/plain"}|POST|
#  Then push button with text 'Найти'
#  Then page include text 'Задан пустой поисковый запрос'
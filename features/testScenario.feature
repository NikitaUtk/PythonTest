@expensive_setup
Feature: Checking search
#Scenario: Scenario for Background
#  Given logging
#Имя сценария
Scenario Outline: Сheck some text in search results
#Наши шаги
  Given I have "<data>" "<json_>" "<params>" "<method>" "<headers>" "<typeRequest>"
      Examples: Audit
      |data|json_|params|method|headers|typeRequest|
      |""|""|""|api/Audit|""|GET|
      |""|""|""|api/Audit/export|""|GET|

      Examples: BalanceReconcilement
      |data|json_|params|method|headers|typeRequest|
      |""|""|""|api/report/BalanceReconcilement|""|GET|
      |""|{"сheckDate": "string","userGid": 0,"dealTypes": [{"dealTypeCD": 0}]}|""|api/report/BalanceReconcilement|{"Content-type": "application/json", "Accept": "text/plain"}|POST|
      |""|""|{"ReportId":1,"OrderByAscDesc":"Asc"}|api/report/BalanceReconcilement/deal_types|""|GET|
      |{"ReportId": 0}|""|""|api/report/BalanceReconcilement/{ReportId}/delete|{"Content-type": "application/json", "Accept": "text/plain"}|POST|

      Examples: Clients
      |data|json_|params|method|headers|typeRequest|
      |""|""|""|api/Clients|""|GET|
      |""|""|""|api/Clients/export|""|GET|
      |{"gid": 1}|""|""|api/Clients/{gid}|""|GET|
      |{"gid": 1}|""|""|api/Clients/{gid}|""|POST|
      |{"gid": 1}|""|{"VersionDate": 1, "ModifiedDate": 2}|api/Clients/{gid}/deals|""|GET|
      |{"gid": 1}|""|""|api/Clients/{gid}/deals/export|""|GET|
      |{"gid": 1}|""|""|api/Clients/{gid}/vzl-periods|""|GET|
      |{"gid": 1}|""|""|api/Clients/{gid}/ratings|""|GET|

      Examples: Deals
      |data|json_|params|method|headers|typeRequest|
      |""|""|{"PageNumber": 1, "Count": 1, "additionalProp1": "string","additionalProp2": "string","additionalProp3": "string"}|/api/Deals|""|GET|
      |""|""|""|api/Deals/export|""|GET|
      |{"dealGid": 1}|""|""|api/Deals/{dealGid}|""|GET|
      |{"dealGid": 1}|""|""|api/Deals/{dealGid}|""|POST|
      |{"dealGid": 1}|""|""|api/Deals/{dealGid}/accounts|""|GET|
      |{"dealGid": 1, "accountGid": 1}|""|""|api/Deals/{dealGid}/accounts/{accountGid}|""|GET|
      |{"dealGid": 1}|""|""|api/Deals/{dealGid}/balance|""|GET|

      Examples: Directories
      |data|json_|params|method|headers|typeRequest|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/sources_system|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/business_segment|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/countries|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/business_size|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/rate_type|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/basis_ind|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/event_source|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/audit_type|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/audit_action_type|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/report_state_type|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/currencies|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/deal_type|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/event_type|""|GET|
      |""|""|""|api/Directories/error_type|""|GET|
      |""|""|""|api/Directories/log_area|""|GET|
      |""|""|""|api/Directories/oracle_log_group|""|GET|
      |""|""|""|api/Directories/log_level|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/event_param_type|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/expertise_status|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/exp_applied_method_status|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/pnd_calc_status|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/sum_interval|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/time_interval|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/time_border|""|GET|
      |""|""|{"userGid": 1, "versionDate": 1, "modifiedDate": 1}|api/Directories/users|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/analytical_ind|""|GET|
      |""|""|{"versionDate": 1, "modifiedDate": 1}|api/Directories/acc_deal_link_type|""|GET|
      |""|""|""|api/Directories/data_loading_stage|""|GET|

      Examples: Events
      |data|json_|params|method|headers|typeRequest|
      |""|""|{"PageNumber": 1, "Count": 1}|api/Events|""|GET|
      |""|""|""|api/Events|""|POST|
      |{"eventId": 1}|""|{"versionDate": 1, "modifiedDate": 1}|api/Events/{eventId}/delete|""|POST|

      Examples: Expertise
      |data|json_|params|method|headers|typeRequest|
      |""|""|{"PageNumber": 1, "Count": 1}|api/Expertise|""|GET|
      |""|""|""|api/Expertise|""|POST|
      |{"expertiseId": 1}|{"id": 0,"userGid": 0}|""|api/Expertise/{expertiseId}/delete|""|POST|
      |{"expertiseId": 1}|{"comment": "string", "userGid": 0}|""|api/Expertise/{expertiseId}/comments|""|POST|
      |{"expertiseId": 1}|{"userGid": 0}|""|api/Expertise/{expertiseId}/copy|""|POST|
      |{"expId": 1}|""|""|api/Expertise/{expId}/applied_method|""|GET|
      |{"expId": 1}|{"id": 0,"expertisId": 0,"statusCD": 0,"methodId": 0,"userGid": 0,"comment": "string"}|""|api/Expertise/{expId}/applied_method|""|POST|
      |{"expId": 1, "applMethodId": 1}|""|""|api/Expertise/{expId}/applied_method/{applMethodId}/set|""|GET|
      |{"expId": 1, "applMethodId": 1}|{"applMethodId": 0,"name": "string","isActual": 0,"userGid": 0}|""|api/Expertise/{expId}/applied_method/{applMethodId}/set|""|POST|
      |{"expId": 1, "applMethodId": 1, "setId": 1}|{"id": 0,"name": "string","isActual": 0,"userGid": 0}|""|api/Expertise/{expId}/applied_method/{applMethodId}/set/{setId}|""|POST|
      |{"expId": 1, "applMethodId": 1}|""|""|api/Expertise/{expId}/applied_method/{applMethodId}/frame_set|""|POST|
      |{"expId": 1, "applMethodId": 1, "setId": 1}|{"comment": "string","userGid": 0}|""|api/Expertise/{expId}/applied_method/{applMethodId}/set/{setId}/comment|""|POST|
      |{"expId": 1, "applMethodId": 1, "setId": 1}|""|""|api/Expertise/{expId}/applied_method/{applMethodId}/set/{setId}/comment|""|GET|
      |{"expId": 1, "applMethodId": 1, "setId": 1}|""|{"userGid": 1}|/api/Expertise/{expId}/applied_method/{applMethodId}/set/{setId}/delete|""|GET|
      |{"expId": 1, "applMethodId": 1, "setId": 1}|""|""|api/Expertise/{expId}/applied_method/{applMethodId}/set/{setId}/deal|""|GET|
      |{"expId": 1, "applMethodId": 1, "setId": 1}|{"setId": 0,"addedDeal": [{"dealId": 0,"rateId": 0}],"deletedDeal": [0],"userGid": 0}|""|api/Expertise/{expId}/applied_method/{applMethodId}/set/{setId}/deal|""|POST|
      |{"expId": 1, "applMethodId": 1, "setId": 1}|""|{"ClientId": 1, "DealId": 1, "VersionDate": 1, "ModifiedDate": 1}|api/Expertise/{expId}/applied_method/{applMethodId}/set/{setId}/deal/export|""|GET|
      |{"expId": 1, "applMethodId": 1}|""|""|api/Expertise/{expId}/applied_method/{applMethodId}/frame_set/export|""|GET|
      |{"expId": 1, "applMethodId": 1}|{"id": 0,"resultTo": 0,"resultFrom": 0,"delta": 0,"userGid": 0}|""|api/Expertise/{expId}/applied_method/{applMethodId}/result|""|POST|
      |{"expId": 1, "applMethodId": 1, "setId": 1}|""|{"userGid": 1}|api/Expertise/{expId}/applied_method/{applMethodId}/set/{setId}/calc|""|POST|
      |{"expId": 1, "applMethodId": 1}|""|{"userGid": 1}|api/Expertise/{expId}/applied_method/{applMethodId}/269calc|""|POST|

      Examples: Log
      |data|json_|params|method|headers|typeRequest|
      |{"expId": 1}|""|""|api/Expertise/{expId}/applied_method|""|GET|
      |{"expId": 1}|""|""|api/Expertise/{expId}/applied_method|""|GET|
      |{"expId": 1}|""|""|api/Expertise/{expId}/applied_method|""|GET|
      |{"expId": 1}|""|""|api/Expertise/{expId}/applied_method|""|GET|
      |{"expId": 1}|""|""|api/Expertise/{expId}/applied_method|""|GET|

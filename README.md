## 사용법
> ./top_pages_v1.0.sh 파일명 출력할라인수

```bash
test@ykd2:~/gitwork_top$ ./top_pages_v1.0.sh accesslog/access.202209230000 20

Total Line Count : 1400012

******************Group by Method*****************
GET Methon Count : 699428

POST Method Count : 699979

OPTION Method Count : 298

HEAD Method Count : 306

ETC Count : 1

Method Total Count : 1400012

GET AND POST Method to Test Count : 1399407

OK
**********Group by Dynamic & Statuc***************
Static pages in GETPOST Count : 315313

Dynamic pages in GETPOST Count : 1084094

OK
*********transaction count per hour***************
Dynamic pages in GET AND POST
          ***  Top 20 pages  ***
POST /gsi/is/fwdgfrghmgnt/inqBizptnrAdjInfo.gau HTTP/1.1 : 49438
POST /gsi/aa/prsnltmgnt/inqCommonChkPoint.gau HTTP/1.1 : 49394
POST /gsi/aa/prsnltmgnt/inqUserGrid.gau HTTP/1.1 : 39420
POST /gsi/cm/comcdmgnt/inqReDfneComCdList.gau HTTP/1.1 : 28837
POST /gsi/cm/timemgnt/inqNowDateByTimezone.gau HTTP/1.1 : 25856
POST /oz51/server HTTP/1.1 : 23720
POST /gsi/cm/comcdmgnt/inqCmBizptnrList.gau HTTP/1.1 : 16299
GET /common/images/icon/icon_search.gif HTTP/1.1 : 13112
GET /gsi/aa/filemgnt/checkFileDownload.dev HTTP/1.1 : 12843
GET /gsi/fw/documentmgnt/rqstBlComnFuncInq.gau?X-UIClient=G40/D2,0,1,90&funcName=FC_FW_CALC_CRT&param1=0&param2=2&param3=R&param4=undefined&param5=undefined&param6=undefined&param7=undefined&param8=undefined&param9=undefined&pgmId=FW00000013 HTTP/1.1 : 11993
POST /gsi/fw/documentmgnt/inqSeaHbl.gau HTTP/1.1 : 9322
GET /oz51/OZRviewer/ozrviewer.idf HTTP/1.1 : 8102
POST /gsi/cm/comcdmgnt/inqCmCorpList.gau HTTP/1.1 : 7641
POST /gsi/cm/comcdmgnt/inqCurList.gau HTTP/1.1 : 7151
POST /gsi/is/fwdgfrghmgnt/inqSoFwdgFrghInfoRef.gau HTTP/1.1 : 7037
POST /gsi/ws/comnmgnt/inqDataSet.gau?pgmId=WS00000001 HTTP/1.1 : 6848
POST /gsi/fw/documentmgnt/inqAsgnTypeCdInfo.gau HTTP/1.1 : 6749
GET /gsi/fw/documentmgnt/rqstCorpTabSetpInq.gau?X-UIClient=G40/D2,0,1,90&taskSprCd=EXP&pgmId=FW00000003 HTTP/1.1 : 6430
GET /jsp/gsi/aa/popup/inqMessagePopup.jsp?msgCode=gsi.msg.cm.save&msgParam=undefined HTTP/1.1 : 6415
POST /gsi/fw/documentmgnt/rqstHblNoPopupInq.gau HTTP/1.1 : 6404
SUM : 1078134

Not Mached
test@ykd2:~/gitwork_top$
```

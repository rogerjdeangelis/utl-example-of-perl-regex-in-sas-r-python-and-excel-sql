%let pgm=utl-example-of-perl-regex-in-sas-r-python-and-excel-sql;

%stop_submission;

Example of perl regex in sas r python and excel sql

Problem Identifly company names that contain any of these words

     Investment
     Ltd
     Fund
     Pvy

      CONTENTS

         1 sas sql
         2 r sql   (note double /s ie // because of r initial code scan?)
         3 python sql
         4 rxcel sql
         5 list of extensions

github
https://tinyurl.com/ykkb83fx
https://github.com/rogerjdeangelis/utl-example-of-perl-regex-in-sas-r-python-and-excel-sql

related to
communities.sas
https://tinyurl.com/ymf6j2hc
https://communities.sas.com/t5/SAS-Programming/recoding-of-the-variable/m-p/823616#M325219
/*
 _ __  _ __ ___ _ __
| `_ \| `__/ _ \ `_ \
| |_) | | |  __/ |_) |
| .__/|_|  \___| .__/
|_|            |_|
*/

You need to download the sqlean.dll with r sqldf extensions

https://tinyurl.com/3vet24f5
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories/blob/master/sqlean.dll

R  AD THIS OPTION
=================
options(sqldf.dll="d:/dll/sqlean.dll")

PYTHON (SAVE THIS PYTON CODE in c:/oto/fn_pythonx.py)
=====================================================

NOTE YOU NEED sqlite3conn.load_extension('d:/dll/sqlean.dll') statement to add extensions

filename ft15f001 "c:/oto/fn_pythonx.py";
parmcards4;
import pyarrow.feather as feather;
import tempfile;
import pyperclip;
import os;
import sys;
import subprocess;
import time;
import pandas as pd;
import pyreadstat as ps;
import numpy as np;
from pandasql import sqldf;
mysql = lambda q: sqldf(q, globals());
from pandasql import PandaSQL;
pdsql = PandaSQL(persist=True);
sqlite3conn = next(pdsql.conn.gen).connection.connection;
sqlite3conn.enable_load_extension(True);
sqlite3conn.load_extension('d:/dll/sqlean.dll');
mysql = lambda q: sqldf(q, globals());
exec(open('c:/oto/fn_tosas9x.py').read());
;;;;
run;quit;

RELATES REPOS
-----------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/utl-change-euro-currency-decimal-separator-to-us-decimal-separator-regexpe
https://github.com/rogerjdeangelis/utl-dosubl-remove-text-within-parentheses-of-macro-variable-using-regex
https://github.com/rogerjdeangelis/utl-drop-or-keep-variables-that-match-a-regex-pattern-
https://github.com/rogerjdeangelis/utl-examples-where-regular-expressions-simplify-the-task-regex-prx
https://github.com/rogerjdeangelis/utl-extract-eight-digit-pattern-with-regex-prxmatch-regular-expressions
https://github.com/rogerjdeangelis/utl-leveraging-your-knowledge-of-perl-regex-to-sas-wps-r-python-and-perl


/*************************************************************************************************************************************/
/*          INPUT                            |         PROCESS                        |             OUTPUT                           */
/*          =====                            |         =======                        |             ======                           */
/*                                           |                                        |                                              */
/* NAME                                      | 1 SAS SQL                              | NAME                                  MATCH  */
/*                                           | =========                              |                                              */
/* investor_name                             |                                        | investor_name                             0  */
/* Gujarat Venture Capital Fund-1995         | proc sql;                              | Gujarat Venture Capital Fund-1995         1  */
/* Narendra Manibhai Patel                   |   create                               | Narendra Manibhai Patel                   0  */
/* Emirates Bank International Pjsc          |     table want as                      | Emirates Bank International Pjsc          0  */
/* Lic Of India Money Plus                   |   select                               | Lic Of India Money Plus                   0  */
/* Savasthi Investment Ltd                   |     name                               | Savasthi Investment Ltd                   1  */
/* Lic Of India Money Plus -1                |    ,prxmatch(                          | Lic Of India Money Plus -1                0  */
/* Life Insurance Corporation Of India Ltd   |     '/\s(Investment|Ltd|Pvt|Fund)/'     | Life Insurance Corporation Of India Ltd  1  */
/* Norges Bank A/C Government Petroleum Fund |     ,strip(name))>0 as match           | Norges Bank A/C Government Petroleum Fund 1  */
/* Reliance Capital Trustee Co Ltd A/C       |   from                                 | Reliance Capital Trustee Co Ltd A/C       1  */
/* Sundaram Bnp Paribas Mutual Fund A/C      |     sd1.have                           | Sundaram Bnp Paribas Mutual Fund A/C      1  */
/* Swiss Finance Corporation Mauritius Ltd   | ;quit;                                 | Swiss Finance Corporation Mauritius Ltd   1  */
/* Acacia Institutional Partners Lp          |                                        | Acacia Institutional Partners Lp          0  */
/* Acacia Partners Lp                        |                                        | Acacia Partners Lp                        0  */
/* St. Helens Nominees India Pvt             |                                        | St. Helens Nominees India Pvt             1  */
/*                                           |                                        |                                              */
/*                                           |---------------------------------------------------------------------------------------*/
/*                                           |                                        |                                              */
/* options validvarname=upcase;              |                                        |                                              */
/* libname sd1 "d:/sd1";                     | 2 R SQL                                | R                                            */
/* data sd1.have;                            | =======                                |                         NAME           match */
/*  input name & $44. ;                      |                                        |                             investor_name 0  */
/* cards4;                                   | proc datasets lib=sd1                  |         Gujarat Venture Capital Fund-1995 1  */
/* investor_name                             |  nolist nodetails;                     |                   Narendra Manibhai Patel 0  */
/* Gujarat Venture Capital Fund-1995         |  delete want;                          |          Emirates Bank International Pjsc 0  */
/* Narendra Manibhai Patel                   | run;quit;                              |                   Lic Of India Money Plus 0  */
/* Emirates Bank International Pjsc          |                                        |                   Savasthi Investment Ltd 1  */
/* Lic Of India Money Plus                   | %utl_rbeginx;                          |                Lic Of India Money Plus -1 0  */
/* Savasthi Investment Ltd                   | parmcards4;                            |   Life Insurance Corporation Of India Ltd 1  */
/* Lic Of India Money Plus -1                | library(haven)                         | Norges Bank A/C Government Petroleum Fund 1  */
/* Life Insurance Corporation Of India Ltd   | library(sqldf)                         |       Reliance Capital Trustee Co Ltd A/C 1  */
/* Norges Bank A/C Government Petroleum Fund | options(sqldf.dll="d:/dll/sqlean.dll") |      Sundaram Bnp Paribas Mutual Fund A/C 1  */
/* Reliance Capital Trustee Co Ltd A/C       | source("c:/oto/fn_tosas9x.R")          |   Swiss Finance Corporation Mauritius Ltd 1  */
/* Sundaram Bnp Paribas Mutual Fund A/C      | have<-read_sas(                        |          Acacia Institutional Partners Lp 0  */
/* Swiss Finance Corporation Mauritius Ltd   |  "d:/sd1/have.sas7bdat")               |                        Acacia Partners Lp 0  */
/* Acacia Institutional Partners Lp          | print(have)                            |             St. Helens Nominees India Pvt 1  */
/* Acacia Partners Lp                        | want<-sqldf("                          |                                              */
/* St. Helens Nominees India Pvt             |   select                               | SAS                                          */
/* ;;;;                                      |     name                               | NAME                                  MATCH  */
/* run;quit;                                 |    ,regexp_like(                       |                                           0  */
/*                                           |       name                             | investor_name                             1  */
/*                                           |     ,'\\s(Investment|Ltd|Pvt|Fund)')   | Gujarat Venture Capital Fund-1995         0  */
/*                                           |       as match                         | Narendra Manibhai Patel                   0  */
/*                                           |   from                                 | Emirates Bank International Pjsc          0  */
/*                                           |     have                               | Lic Of India Money Plus                   1  */
/*                                           |   ")                                   | Savasthi Investment Ltd                   0  */
/*                                           | want                                   | Lic Of India Money Plus -1                1  */
/*                                           | fn_tosas9x(                            | Life Insurance Corporation Of India Ltd   1  */
/*                                           |       inp    = want                    | Norges Bank A/C Government Petroleum Fund 1  */
/*                                           |      ,outlib ="d:/sd1/"                | Reliance Capital Trustee Co Ltd A/C       1  */
/*                                           |      ,outdsn ="want"                   | Sundaram Bnp Paribas Mutual Fund A/C      1  */
/*                                           |      )                                 | Swiss Finance Corporation Mauritius Ltd   0  */
/*                                           | ;;;;                                   | Acacia Institutional Partners Lp          0  */
/*                                           | %utl_rendx;                            | Acacia Partners Lp                        1  */
/*                                           |                                        | St. Helens Nominees India Pvt                */
/*                                           |                                        |                                              */
/*                                           |---------------------------------------------------------------------------------------*/
/*                                           |                                        |                                              */
/*                                           | 3 PYTHON SQL                           | PYTHON                                       */
/*                                           | ============                           |                         NAME           match */
/*                                           |                                        |                             investor_name 0  */
/*                                           | proc datasets                          |         Gujarat Venture Capital Fund-1995 1  */
/*                                           |   nolist nodetails;                    |                   Narendra Manibhai Patel 0  */
/*                                           |  delete pywant;                        |          Emirates Bank International Pjsc 0  */
/*                                           | run;quit;                              |                   Lic Of India Money Plus 0  */
/*                                           |                                        |                   Savasthi Investment Ltd 1  */
/*                                           | %utl_pybeginx;                         |                Lic Of India Money Plus -1 0  */
/*                                           | parmcards4;                            |   Life Insurance Corporation Of India Ltd 1  */
/*                                           | exec(open(                       \     | Norges Bank A/C Government Petroleum Fund 1  */
/*                                           |  'c:/oto/fn_pythonx.py').read());      |       Reliance Capital Trustee Co Ltd A/C 1  */
/*                                           | have,meta=ps.read_sas7bdat(      \     |      Sundaram Bnp Paribas Mutual Fund A/C 1  */
/*                                           |   'd:/sd1/have.sas7bdat');             |   Swiss Finance Corporation Mauritius Ltd 1  */
/*                                           | want=pdsql('''                         |          Acacia Institutional Partners Lp 0  */
/*                                           |  select                             \  |                        Acacia Partners Lp 0  */
/*                                           |    name                             \  |             St. Helens Nominees India Pvt 1  */
/*                                           |   ,regexp_like(                     \  |                                              */
/*                                           |      name                           \  |  SAS                                         */
/*                                           |    ,'\\s(Investment|Ltd|Pvt|Fund)') \  |  NAME                                  MATCH */
/*                                           |      as match                       \  |                                              */
/*                                           |  from                               \  |  investor_name                             0 */
/*                                           |    have                             \  |  Gujarat Venture Capital Fund-1995         1 */
/*                                           |  ''')                                  |  Narendra Manibhai Patel                   0 */
/*                                           | print(want);                           |  Emirates Bank International Pjsc          0 */
/*                                           | fn_tosas9x(                            |  Lic Of India Money Plus                   0 */
/*                                           |  want                                  |  Savasthi Investment Ltd                   1 */
/*                                           |  ,outlib='d:/sd1/'                     |  Lic Of India Money Plus -1                0 */
/*                                           |  ,outdsn='pywant'                      |  Life Insurance Corporation Of India Ltd   1 */
/*                                           |  ,timeest=3);                          |  Norges Bank A/C Government Petroleum Fund 1 */
/*                                           | ;;;;                                   |  Reliance Capital Trustee Co Ltd A/C       1 */
/*                                           | %utl_pyendx;                           |  Sundaram Bnp Paribas Mutual Fund A/C      1 */
/*                                           |                                        |  Swiss Finance Corporation Mauritius Ltd   1 */
/*                                           | proc print data=sd1.pywant;            |  Acacia Institutional Partners Lp          0 */
/*                                           | run;quit;                              |  Acacia Partners Lp                        0 */
/*                                           |                                        |  St. Helens Nominees India Pvt             1 */
/*                                           |                                        |                                              */
/*                                           |                                        |                                              */
/*                                           |                                        |                                              */
/*                                           | 4 EXCEL SQL                            |-----------------------+                      */
/*                                           | ===========                            || A1| fx    |NAME      |                      */
/*                                           |                                        |---------------------------------------------+*/
/*                                           | %utlfkil(d:/xls/wantxl.xlsx);          |[_]|                 A                     |M|*/
/*                                           |                                        |---------------------------------------------|*/
/*                                           | %utl_rbeginx;                          | 1 | NAME                                  |H|*/
/*                                           | parmcards4;                            | --|---------------------------------------+-|*/
/*                                           | library(openxlsx)                      | 2 |investor_name                          |0|*/
/*                                           | library(sqldf)                         | --|---------------------------------------+-|*/
/*                                           | library(haven)                         | 3 |Gujarat Venture Capital Fund-1995      |1|*/
/*                                           | options(sqldf.dll="d:/dll/sqlean.dll") | --|---------------------------------------+-|*/
/*                                           | have<-read_sas("d:/sd1/have.sas7bdat") | 4 |Narendra Manibhai Patel                |0|*/
/*                                           | wb <- createWorkbook()                 | --|---------------------------------------+-|*/
/*                                           | addWorksheet(wb, "have")               | 5 |Emirates Bank International Pjsc       |0|*/
/*                                           | writeData(wb, sheet = "have", x=have)  | --|---------------------------------------+-|*/
/*                                           | saveWorkbook(                          | 6 |Lic Of India Money Plus                |0|*/
/*                                           |     wb                                 | --|---------------------------------------+-|*/
/*                                           |    ,"d:/xls/wantxl.xlsx"               | 7 |Savasthi Investment Ltd                |1|*/
/*                                           |    ,overwrite=TRUE)                    | --|---------------------------------------+-|*/
/*                                           | ;;;;                                   | 8 |Lic Of India Money Plus -1             |0|*/
/*                                           | %utl_rendx;                            | --|---------------------------------------+-|*/
/*                                           |                                        | 9 |Life Insurance Corporation Of India Ltd|1|*/
/*                                           | %utl_rbeginx;                          | --|---------------------------------------+-|*/
/*                                           | parmcards4;                            |10 |Norges Bank A Government Petroleum Fund|1|*/
/*                                           | library(openxlsx)                      | --|---------------------------------------+-|*/
/*                                           | library(sqldf)                         |11 |Reliance Capital Trustee Co Ltd A/C    |1|*/
/*                                           | source("c:/oto/fn_tosas9x.R")          | --|---------------------------------------+-|*/
/*                                           | options(sqldf.dll="d:/dll/sqlean.dll") |12 |Sundaram Bnp Paribas Mutual Fund A/C   |1|*/
/*                                           | wb<-loadWorkbook("d:/xls/wantxl.xlsx") | --|---------------------------------------+-|*/
/*                                           |  have<-read.xlsx(wb,"have")            |13 |Swiss Finance Corporation Mauritius Ltd|1|*/
/*                                           |  addWorksheet(wb, "want")              | --|---------------------------------------+-|*/
/*                                           |  want<-sqldf("                         |14 |Acacia Institutional Partners Lp       |0|*/
/*                                           |   select                               | --|---------------------------------------+-|*/
/*                                           |     name                               |15 |Acacia Partners Lp                     |0|*/
/*                                           |    ,regexp_like(                       | --|---------------------------------------+-|*/
/*                                           |       name                             |16 |St. Helens Nominees India Pvt          |1|*/
/*                                           |     ,'\\s(Investment|Ltd|Pvt|Fund)')   | --|----------------------------------------+|*/
/*                                           |       as match                         |[WANT]                                        */
/*                                           |   from                                 |                                              */
/*                                           |     have                               |                                              */
/*                                           |   ")                                   |                                              */
/*                                           | print(want)                            |                                              */
/*                                           | writeData(wb,sheet="want",x=want)      |                                              */
/*                                           | saveWorkbook(                          |                                              */
/*                                           |     wb                                 |                                              */
/*                                           |    ,"d:/xls/wantxl.xlsx"               |                                              */
/*                                           |    ,overwrite=TRUE)                    |                                              */
/*                                           | fn_tosas9x(                            |                                              */
/*                                           |       inp    = want                    |                                              */
/*                                           |      ,outlib ="d:/sd1/"                |                                              */
/*                                           |      ,outdsn ="want"                   |                                              */
/*                                           |      )                                 |                                              */
/*                                           | ;;;;                                   |                                              */
/*                                           | %utl_rendx;                            |                                              */
/*                                           |                                        |                                              */
/*                                           | proc print data=sd1.want;              |                                              */
/*                                           | run;quit;                              |                                              */
/*************************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
 input name & $44. ;
cards4;
investor_name
Gujarat Venture Capital Fund-1995
Narendra Manibhai Patel
Emirates Bank International Pjsc
Lic Of India Money Plus
Savasthi Investment Ltd
Lic Of India Money Plus -1
Life Insurance Corporation Of India Ltd
Norges Bank A/C Government Petroleum Fund
Reliance Capital Trustee Co Ltd A/C
Sundaram Bnp Paribas Mutual Fund A/C
Swiss Finance Corporation Mauritius Ltd
Acacia Institutional Partners Lp
Acacia Partners Lp
St. Helens Nominees India Pvt
;;;;
run;quit;

/**************************************************************************************************************************/
/* Obs    NAME                                                                                                            */
/*                                                                                                                        */
/*   1    investor_name                                                                                                   */
/*   2    Gujarat Venture Capital Fund-1995                                                                               */
/*   3    Narendra Manibhai Patel                                                                                         */
/*   4    Emirates Bank International Pjsc                                                                                */
/*   5    Lic Of India Money Plus                                                                                         */
/*   6    Savasthi Investment Ltd                                                                                         */
/*   7    Lic Of India Money Plus -1                                                                                      */
/*   8    Life Insurance Corporation Of India Ltd                                                                         */
/*   9    Norges Bank A/C Government Petroleum Fund                                                                       */
/*  10    Reliance Capital Trustee Co Ltd A/C                                                                             */
/*  11    Sundaram Bnp Paribas Mutual Fund A/C                                                                            */
/*  12    Swiss Finance Corporation Mauritius Ltd                                                                         */
/*  13    Acacia Institutional Partners Lp                                                                                */
/*  14    Acacia Partners Lp                                                                                              */
/*  15    St. Helens Nominees India Pvt                                                                                   */
/**************************************************************************************************************************/

/*                             _
/ |  ___  __ _ ___   ___  __ _| |
| | / __|/ _` / __| / __|/ _` | |
| | \__ \ (_| \__ \ \__ \ (_| | |
|_| |___/\__,_|___/ |___/\__, |_|
                            |_|
*/

proc sql;
  create
    table want as
  select
    name
   ,prxmatch(
    '/\s(Investment|Ltd|Pvt|Fund)/'
    ,strip(name))>0 as match
  from
    sd1.have
;quit;

/**************************************************************************************************************************/
/* Obs    NAME                                         MATCH                                                              */
/*                                                                                                                        */
/*   1    investor_name                                  0                                                                */
/*   2    Gujarat Venture Capital Fund-1995              1                                                                */
/*   3    Narendra Manibhai Patel                        0                                                                */
/*   4    Emirates Bank International Pjsc               0                                                                */
/*   5    Lic Of India Money Plus                        0                                                                */
/*   6    Savasthi Investment Ltd                        1                                                                */
/*   7    Lic Of India Money Plus -1                     0                                                                */
/*   8    Life Insurance Corporation Of India Ltd        1                                                                */
/*   9    Norges Bank A/C Government Petroleum Fund      1                                                                */
/*  10    Reliance Capital Trustee Co Ltd A/C            1                                                                */
/*  11    Sundaram Bnp Paribas Mutual Fund A/C           1                                                                */
/*  12    Swiss Finance Corporation Mauritius Ltd        1                                                                */
/*  13    Acacia Institutional Partners Lp               0                                                                */
/*  14    Acacia Partners Lp                             0                                                                */
/*  15    St. Helens Nominees India Pvt                  1                                                                */
/**************************************************************************************************************************/

/*___                   _
|___ \   _ __ ___  __ _| |
  __) | | `__/ __|/ _` | |
 / __/  | |  \__ \ (_| | |
|_____| |_|  |___/\__, |_|
                     |_|
*/

proc datasets lib=sd1
 nolist nodetails;
 delete want;
run;quit;

%utl_rbeginx;
parmcards4;
library(haven)
library(sqldf)
options(sqldf.dll="d:/dll/sqlean.dll")
source("c:/oto/fn_tosas9x.R")
have<-read_sas(
 "d:/sd1/have.sas7bdat")
print(have)
want<-sqldf("
  select
    name
   ,regexp_like(
      name
    ,'\\s(Investment|Ltd|Pvt|Fund)')
      as match
  from
    have
  ")
want
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;

/**************************************************************************************************************************/
/* R                                                    | SAS                                                             */
/*                                         NAME match   | ROWNAMES    NAME                                         MATCH  */
/*                                                      |                                                                 */
/* 1                              investor_name     0   |     1       investor_name                                  0    */
/* 2          Gujarat Venture Capital Fund-1995     1   |     2       Gujarat Venture Capital Fund-1995              1    */
/* 3                    Narendra Manibhai Patel     0   |     3       Narendra Manibhai Patel                        0    */
/* 4           Emirates Bank International Pjsc     0   |     4       Emirates Bank International Pjsc               0    */
/* 5                    Lic Of India Money Plus     0   |     5       Lic Of India Money Plus                        0    */
/* 6                    Savasthi Investment Ltd     1   |     6       Savasthi Investment Ltd                        1    */
/* 7                 Lic Of India Money Plus -1     0   |     7       Lic Of India Money Plus -1                     0    */
/* 8    Life Insurance Corporation Of India Ltd     1   |     8       Life Insurance Corporation Of India Ltd        1    */
/* 9  Norges Bank A/C Government Petroleum Fund     1   |     9       Norges Bank A/C Government Petroleum Fund      1    */
/* 10       Reliance Capital Trustee Co Ltd A/C     1   |    10       Reliance Capital Trustee Co Ltd A/C            1    */
/* 11      Sundaram Bnp Paribas Mutual Fund A/C     1   |    11       Sundaram Bnp Paribas Mutual Fund A/C           1    */
/* 12   Swiss Finance Corporation Mauritius Ltd     1   |    12       Swiss Finance Corporation Mauritius Ltd        1    */
/* 13          Acacia Institutional Partners Lp     0   |    13       Acacia Institutional Partners Lp               0    */
/* 14                        Acacia Partners Lp     0   |    14       Acacia Partners Lp                             0    */
/* 15             St. Helens Nominees India Pvt     1   |    15       St. Helens Nominees India Pvt                  1    */
/**************************************************************************************************************************/

/*____               _   _                             _
|___ /   _ __  _   _| |_| |__   ___  _ __    ___  __ _| |
  |_ \  | `_ \| | | | __| `_ \ / _ \| `_ \  / __|/ _` | |
 ___) | | |_) | |_| | |_| | | | (_) | | | | \__ \ (_| | |
|____/  | .__/ \__, |\__|_| |_|\___/|_| |_| |___/\__, |_|
        |_|    |___/                                |_|
*/

proc datasets
  nolist nodetails;
 delete pywant;
run;quit;

%utl_pybeginx;
parmcards4;
exec(open(                       \
 'c:/oto/fn_pythonx.py').read());
have,meta=ps.read_sas7bdat(      \
  'd:/sd1/have.sas7bdat');
want=pdsql('''
 select                             \
   name                             \
  ,regexp_like(                     \
     name                           \
   ,'\\s(Investment|Ltd|Pvt|Fund)') \
     as match                       \
 from                               \
   have                             \
 ''')
print(want);
fn_tosas9x(
 want
 ,outlib='d:/sd1/'
 ,outdsn='pywant'
 ,timeest=3);
;;;;
%utl_pyendx;

proc print data=sd1.pywant;
run;quit;

/**************************************************************************************************************************/
/* python                                   NAME  match  |  SAS            NAME                         MATCH             */
/*                                                       |                                                                */
/* 0                               investor_name      0  |  investor_name                                  0              */
/* 1           Gujarat Venture Capital Fund-1995      1  |  Gujarat Venture Capital Fund-1995              1              */
/* 2                     Narendra Manibhai Patel      0  |  Narendra Manibhai Patel                        0              */
/* 3            Emirates Bank International Pjsc      0  |  Emirates Bank International Pjsc               0              */
/* 4                     Lic Of India Money Plus      0  |  Lic Of India Money Plus                        0              */
/* 5                     Savasthi Investment Ltd      1  |  Savasthi Investment Ltd                        1              */
/* 6                  Lic Of India Money Plus -1      0  |  Lic Of India Money Plus -1                     0              */
/* 7     Life Insurance Corporation Of India Ltd      1  |  Life Insurance Corporation Of India Ltd        1              */
/* 8   Norges Bank A/C Government Petroleum Fund      1  |  Norges Bank A/C Government Petroleum Fund      1              */
/* 9         Reliance Capital Trustee Co Ltd A/C      1  |  Reliance Capital Trustee Co Ltd A/C            1              */
/* 10       Sundaram Bnp Paribas Mutual Fund A/C      1  |  Sundaram Bnp Paribas Mutual Fund A/C           1              */
/* 11    Swiss Finance Corporation Mauritius Ltd      1  |  Swiss Finance Corporation Mauritius Ltd        1              */
/* 12           Acacia Institutional Partners Lp      0  |  Acacia Institutional Partners Lp               0              */
/* 13                         Acacia Partners Lp      0  |  Acacia Partners Lp                             0              */
/* 14              St. Helens Nominees India Pvt      1  |  St. Helens Nominees India Pvt                  1              */
/**************************************************************************************************************************/
/*  _                       _             _
| || |     _____  _____ ___| |  ___  __ _| |
| || |_   / _ \ \/ / __/ _ \ | / __|/ _` | |
|__   _| |  __/>  < (_|  __/ | \__ \ (_| | |
   |_|    \___/_/\_\___\___|_| |___/\__, |_|
                                       |_|
*/
%utlfkil(d:/xls/wantxl.xlsx);

%utl_rbeginx;
parmcards4;
library(openxlsx)
library(sqldf)
library(haven)
options(sqldf.dll="d:/dll/sqlean.dll")
have<-read_sas("d:/sd1/have.sas7bdat")
wb <- createWorkbook()
addWorksheet(wb, "have")
writeData(wb, sheet = "have", x = have)
saveWorkbook(
    wb
   ,"d:/xls/wantxl.xlsx"
   ,overwrite=TRUE)
;;;;
%utl_rendx;

%utl_rbeginx;
parmcards4;
library(openxlsx)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
options(sqldf.dll="d:/dll/sqlean.dll")
 wb<-loadWorkbook("d:/xls/wantxl.xlsx")
 have<-read.xlsx(wb,"have")
 addWorksheet(wb, "want")
 want<-sqldf("
  select
    name
   ,regexp_like(
      name
    ,'\\s(Investment|Ltd|Pvt|Fund)')
      as match
  from
    have
  ")
print(want)
writeData(wb,sheet="want",x=want)
saveWorkbook(
    wb
   ,"d:/xls/wantxl.xlsx"
   ,overwrite=TRUE)
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;

/*___                      _             _                 _
| ___|    _____  _____ ___| |   _____  _| |_ ___ _ __  ___(_) ___  _ __  ___
|___ \   / _ \ \/ / __/ _ \ |  / _ \ \/ / __/ _ \ `_ \/ __| |/ _ \| `_ \/ __|
 ___) | |  __/>  < (_|  __/ | |  __/>  <| ||  __/ | | \__ \ | (_) | | | \__ \
|____/   \___/_/\_\___\___|_|  \___/_/\_\\__\___|_| |_|___/_|\___/|_| |_|___/

*/

/**************************************************************************************************************************************/
/*   NOTE SOME OF THESE FUNCTION ARE ONLY AVAILABLE ON THE SQLITE COMMAND LINE (IE MODE)                                              */
/*               name          define_free    json_group_array      math_ceil           radians            stddev       time_fmt_iso  */
/*                 ->              degrees   json_group_object       math_cos            random        stddev_pop      time_fmt_time  */
/*                ->>           dense_rank         json_insert      math_cosh        randomblob       stddev_samp           time_get  */
/*                abs           difference         json_object   math_degrees              rank             stdev       time_get_day  */
/*               acos         dlevenshtein          json_patch       math_exp          readfile         strfilter      time_get_hour  */
/*              acosh                dur_h         json_pretty     math_floor            regexp          strftime   time_get_isoweek  */
/*                age                dur_m          json_quote        math_ln    regexp_capture        string_agg   time_get_isoyear  */
/*               asin               dur_ms         json_remove       math_log       regexp_like            strpos    time_get_minute  */
/*              asinh               dur_ns        json_replace     math_log10    regexp_replace            substr     time_get_month  */
/*               atan                dur_s            json_set      math_log2     regexp_substr         substring      time_get_nano  */
/*              atan2               dur_us           json_type       math_mod            repeat           subtype    time_get_second  */
/*              atanh        edit_distance          json_valid        math_pi           replace               sum   time_get_weekday  */
/*               atn2               encode               jsonb       math_pow         replicate           symlink      time_get_year  */
/*                avg                 eval         jsonb_array   math_radians           reverse               tan   time_get_yearday  */
/*         bit_length                  exp       jsonb_extract     math_round             right              tanh         time_micro  */
/*             blake3        fileio_append   jsonb_group_array       math_sin          rightstr      text_bitsize         time_milli  */
/*               bm25         fileio_mkdir  jsonb_group_object      math_sinh             round     text_casefold          time_nano  */
/*              btrim          fileio_mode        jsonb_insert      math_sqrt        row_number       text_concat           time_now  */
/*           casefold          fileio_read        jsonb_object       math_tan              rpad     text_contains         time_parse  */
/*         caverphone       fileio_symlink         jsonb_patch      math_tanh          rsoundex        text_count         time_round  */
/*               ceil         fileio_write        jsonb_remove     math_trunc        rtreecheck   text_has_prefix         time_since  */
/*            ceiling          first_value       jsonb_replace            max        rtreedepth   text_has_suffix           time_sub  */
/*            changes                floor           jsonb_set            md5         rtreenode        text_index      time_to_micro  */
/*               char               format           julianday         median             rtrim         text_join      time_to_milli  */
/*        char_length       fts3_tokenizer                 lag            min       script_code   text_last_index       time_to_nano  */
/*   character_length                 fts5   last_insert_rowid          mkdir              sha1         text_left       time_to_unix  */
/*          charindex      fts5_get_locale          last_value            mod            sha256       text_length         time_trunc  */
/*           coalesce          fts5_locale                lead          .mode            sha384         text_like          time_unix  */
/*             concat       fts5_source_id                left          nlike            sha512        text_lower         time_until  */
/*          concat_ws          fuzzy_caver             leftstr         nlower              sign         text_lpad           timediff  */
/*                cos         fuzzy_damlev              length            now               sin        text_ltrim       to_timestamp  */
/*               cosh       fuzzy_editdist         levenshtein      nth_value              sinh       text_repeat              total  */
/*                cot        fuzzy_hamming                like          ntile           snippet      text_replace      total_changes  */
/*               coth        fuzzy_jarowin          likelihood         nullif           soundex      text_reverse          translate  */
/*              count          fuzzy_leven              likely         nupper        split_part        text_right           translit  */
/*      crypto_blake3        fuzzy_osadist                  ln   octet_length    sqlean_version         text_rpad               trim  */
/*      crypto_decode       fuzzy_phonetic      load_extension        offsets        sqlite_log        text_rtrim              trunc  */
/*      crypto_encode       fuzzy_rsoundex                 log       optimize  sqlite_source_id         text_size             typeof  */
/*         crypto_md5         fuzzy_script               log10   osa_distance    sqlite_version        text_slice           unaccent  */
/*        crypto_sha1        fuzzy_soundex                log2           padc              sqrt        text_split           undefine  */
/*      crypto_sha256       fuzzy_translit               lower           padl            square    text_substring              unhex  */
/*      crypto_sha384      gen_random_uuid      lower_quartile           padr       starts_with        text_title            unicode  */
/*      crypto_sha512                 glob                lpad   percent_rank      stats_median    text_translate    unicode_version  */
/*          cume_dist         group_concat              lsmode     percentile         stats_p25         text_trim          unixepoch  */
/*       current_date              hamming               ltrim  percentile_25         stats_p75        text_upper           unlikely  */
/*       current_time                  hex           make_date  percentile_75         stats_p90              time              upper  */
/*  current_timestamp            highlight      make_timestamp  percentile_90         stats_p95          time_add     upper_quartile  */
/*               date               ifnull               match  percentile_95         stats_p99     time_add_date              uuid4  */
/*           date_add                  iif           matchinfo  percentile_99        stats_perc        time_after              uuid7  */
/*          date_part                instr           math_acos  phonetic_hash      stats_stddev       time_before         uuid_blob   */
/*         date_trunc         jaro_winkler          math_acosh             pi  stats_stddev_pop      time_compare          uuid_str   */
/*           datetime                 json           math_asin            pow stats_stddev_samp         time_date           var_pop   */
/*             decode           json_array          math_asinh          power         stats_var        time_equal          var_samp   */
/*             define    json_array_length           math_atan         printf     stats_var_pop     time_fmt_date          variance   */
/*       define_cache  json_error_position          math_atan2         proper    stats_var_samp time_fmt_datetime         writefile   */
/*       json_extract           math_atanh          quote                                                                  zeroblob   */
/**************************************************************************************************************************************/
/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

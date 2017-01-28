@ECHO OFF
REM =============================================================================
REM =============================================================================
REM ======                                                              =========
REM ====== THis script will drop the DB specificed, then create the DB  =========
REM ====== specified, and then load all .sql tables from its run dir to =========
REM ====== the the DB.                                                  =========
REM ======                                                              =========
REM ====== File needs to be run from within the \dsp\sql folder (same   =========
REM ====== folder with all the .sql files. Please edit as needed. By    =========
REM ====== default it WILL DROP the standard dspdb DB, loosing all      =========
REM ====== accounts and characters. If this is not desired, then update =========
REM ====== the file to load the new DB into a new DB name.              =========
REM ======                                                              =========
REM ====== Update -p with MySQL password. If you password is 'foo',     =========
REM ====== then change '-pMYSQLPASS' to '-pfoo' (3 places).             =========
REM ======                                                              =========
REM ====== If you want to use a different database name, change 'dspdb' =========
REM ====== with a database name of your choosing.                       =========
REM ======                                                              =========
REM =============================================================================
REM =============================================================================
REM ======                                                              =========
REM ====== by Thrydwolf 9/8/2012                                        =========
REM ====== Updated with status by bluekirby0 3/30/2012                  =========
REM ====== Updated by Thrydwolf 9/18/2012                               =========
REM ======                                                              =========
REM =============================================================================
REM =============================================================================

REM ECHO Creating Database dspdb
REM "C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqladmin" -h localhost -u ***REMOVED*** -p***REMOVED*** DROP dspdb

REM ECHO Creating Database dspdb
REM "c:\program files\mysql\mysql server 5.7\bin\mysqladmin" -h localhost -u ***REMOVED*** -p***REMOVED*** CREATE dspdb

ECHO Loading dspdb tables into the database
B:
cd B:\FFIvalice\Source\Repos\Ivalice\sql

del auction_house.sql
del chars.sql
del accounts.sql
del accounts_banned.sql
del char_effects.sql
del char_equip.sql
del char_exp.sql
del char_inventory.sql
del char_jobs.sql
del char_look.sql
del char_pet.sql
del char_pet_name.sql
del char_points.sql
del char_profile.sql
del char_skills.sql
del char_spells.sql
del char_stats.sql
del char_storage.sql
del char_vars.sql
del char_weapon_skill_points.sql
del conquest_system.sql
del delivery_box.sql
del linkshells.sql
del FFIvalice_ZoneIPs.sql

FOR %%X IN (*.sql) DO ECHO Importing %%X & "c:\program files\mysql\mysql server 5.7\bin\mysql" dspdb -h localhost -u ***REMOVED*** -p***REMOVED*** < %%X

ECHO Finished!
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

ECHO Creating Database dspdb
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqladmin" -h localhost -u ***REMOVED*** -p***REMOVED*** DROP dspdb

ECHO Creating Database dspdb
"c:\program files\mysql\mysql server 5.7\bin\mysqladmin" -h localhost -u ***REMOVED*** -p***REMOVED*** CREATE dspdb

ECHO Loading dspdb tables into the database
REM B:
REM cd B:\FFIvalice\Source\Repos\Ivalice\sql

REM del auction_house.sql
REM del chars.sql
REM del accounts.sql
REM del accounts_banned.sql
REM del char_effects.sql
REM del char_equip.sql
REM del char_exp.sql
REM del char_inventory.sql
REM del char_jobs.sql
REM del char_look.sql
REM del char_pet.sql
REM del char_pet_name.sql
REM del char_points.sql
REM del char_profile.sql
REM del char_skills.sql
REM del char_spells.sql
REM del char_stats.sql
REM del char_storage.sql
REM del char_vars.sql
REM del char_weapon_skill_points.sql
REM del conquest_system.sql
REM del delivery_box.sql
REM del linkshells.sql
REM del FFIvalice_ZoneIPs.sql
REM del char_merits.sql

FOR %%X IN (*.sql) DO ECHO Importing %%X & "c:\program files\mysql\mysql server 5.7\bin\mysql" dspdb -h localhost -u ***REMOVED*** -p***REMOVED*** < %%X

ECHO Finished!
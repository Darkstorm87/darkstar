For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)

A:
cd A:\FFIvalice_Database_Backups
mkdir %mydate%
cd %mydate%

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb auction_house > .\auction_house.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb chars > .\chars.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb accounts > .\accounts.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb accounts_banned > .\accounts_banned.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_effects > .\char_effects.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_equip > .\char_equip.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_exp > .\char_exp.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_inventory > .\char_inventory.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_jobs > .\char_jobs.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_look > .\char_look.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_pet > .\char_pet.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_pet_name > .\char_pet_name.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_points > .\.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_profile > .\char_profile.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_skills > .\char_skills.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_spells > .\.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_stats > .\char_stats.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_storage > .\char_storage.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_vars > .\char_vars.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb char_weapon_skill_points > .\char_weapon_skill_points.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb conquest_system > .\conquest_system.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb delivery_box > .\delivery_box.sql
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" -u ***REMOVED*** -p***REMOVED*** dspdb linkshells > .\linkshells.sql
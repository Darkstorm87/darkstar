For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)

B:
cd "B:\FFIvalice\Database Backups"
mkdir %mydate%
cd %mydate%

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=auction_house.sql dspdb auction_house
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=chars.sql dspdb chars
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=accounts.sql dspdb accounts
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=accounts_banned.sql dspdb accounts_banned
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_effects.sql dspdb char_effects
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_equip.sql dspdb char_equip
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_exp.sql dspdb char_exp
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_inventory.sql dspdb char_inventory
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_jobs.sql dspdb char_jobs
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_look.sql dspdb char_look
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_pet.sql dspdb char_pet
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_pet_name.sql dspdb char_pet_name
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_points.sql dspdb char_points
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_profile.sql dspdb char_profile
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_skills.sql dspdb char_skills
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_spells.sql dspdb char_spells
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_stats.sql dspdb char_stats
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_storage.sql dspdb char_storage
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_vars.sql dspdb char_vars
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_weapon_skill_points.sql dspdb char_weapon_skill_points
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=conquest_system.sql dspdb conquest_system
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=delivery_box.sql dspdb delivery_box
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=linkshells.sql dspdb linkshells
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=dspdb.sql dspdb
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=npc_list.sql dspdb npc_list
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u root -pHokuten1 --default-character-set=utf8 --result-file=char_merits.sql dspdb char_merit
@echo off

REG DELETE "HKEY_CLASSES_ROOT\*\Shell\edit with vim" /f
REG DELETE "HKEY_CLASSES_ROOT\*\Shell\vim tabnew" /f

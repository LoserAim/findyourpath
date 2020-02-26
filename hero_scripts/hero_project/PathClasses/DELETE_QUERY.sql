-- SQLite
DELETE
FROM `PathClasses_pathclass`
WHERE id not NULL;
DELETE
FROM `Feats_feat`
where name = 'Alchemical Familiar';
DELETE
FROM `PathClasses_pathclassarchetype`
WHERE id not NULL;
DELETE
FROM `PathClasses_pathclassfeature`
WHERE id not NULL;
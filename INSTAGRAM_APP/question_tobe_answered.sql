-- WE want to reward the longest users. Find the 5 oldest users

SELECT * FROM users ORDER BY created_at DESC LIMIT 5;
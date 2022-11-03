-- Challenge Bonus queries.
-- 1. (2.5 pts)

-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, SUM(backers_count) AS backer_counts
FROM campaign
WHERE outcome = 'live'
GROUP BY campaign.cf_id
ORDER BY "backers_count" DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
---Not listed all backers?
SELECT COUNT(backer_id) 
FROM backers;



-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

--- Drop the table if exists
DROP TABLE email_contacts_remaining_goal_amount;

SELECT 
c.first_name,
c.last_name,
c.email,
cm.goal - cm.pledged AS "Remaning Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts AS c
LEFT JOIN campaign AS cm
ON (c.contact_id = cm.contact_id)
WHERE cm.outcome = 'live'
AND cm.goal - cm.pledged > 0
ORDER BY "Remaning Goal Amount" DESC;

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

--- Drop the table if exists
DROP TABLE email_backers_remaining_goal_amount;

SELECT 
b.email,
b.first_name,
b.last_name,
b.cf_id,
cm.company_name,
cm.description,
cm.end_date,
cm.goal - pledged AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers AS b
LEFT JOIN campaign AS cm
ON (b.cf_id = cm.cf_id)
WHERE cm.outcome = 'live'
AND cm.goal - cm.pledged > 0
ORDER BY "last_name" ASC;

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;


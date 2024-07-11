SELECT * 
FROM heart.heart_statlog_cleveland_hungary_final;

#resting bps for age > 40 vs age < 40
SELECT 
    AVG(CASE WHEN age > 40 THEN `resting bp s` END) AS avg_age_above_40,
    AVG(CASE WHEN age < 40 THEN `resting bp s` END) AS avg_age_below_40
FROM 
    heart.heart_statlog_cleveland_hungary_final;

#restinbps for sex
select AVG(CASE WHEN sex = 'Male' THEN `resting bp s` END) AS male_restinbps,
    AVG(CASE WHEN sex = 'Female' THEN `resting bp s` END) AS female_restinbps
    from heart.heart_statlog_cleveland_hungary_final;

#What is the average age of patients diagnosed with heart disease (num = 1)
Select avg(age)
from heart.heart_statlog_cleveland_hungary_final
where target = 1;

#How many male and female patients are diagnosed with heart disease (num = 1)
select count(*) as count, sex
from heart.heart_statlog_cleveland_hungary_final
where target = 1
group by sex;

#What is the distribution of chest pain types among patients diagnosed with heart disease?
Select count(*), `chest pain type`
from heart.heart_statlog_cleveland_hungary_final
where target = 1
group by `chest pain type`;

#What is the average resting blood pressure (restbps) of patients with and without heart disease?
Select avg(Case when target = 1 then `resting bp s` END) as restbps_HD, avg(Case when target = 0 then `resting bp s`END) as restbps_NoHD
from heart.heart_statlog_cleveland_hungary_final;

#What is the average serum cholesterol level (chol) of patients with heart disease compared to those without heart disease?
Select avg(Case when target = 1 then cholesterol END) as chol_HD, avg(Case when target = 0 then cholesterol END) as chol_NoHD
from heart.heart_statlog_cleveland_hungary_final;

#Is there a significant difference in fasting blood sugar (fbs) levels between patients with and without heart disease?
Select avg(Case when target = 1 then `fasting blood sugar` END) as fbs_HD, avg(Case when target = 0 then `fasting blood sugar` END) as fbs_NoHD
from heart.heart_statlog_cleveland_hungary_final;

#What are the resting electrocardiographic results (restecg) distribution among patients with heart disease?
select `resting ecg`, count(*)
from heart.heart_statlog_cleveland_hungary_final
where target = 1
group by `resting ecg`;

#How does the maximum heart rate achieved (thalach) compare between patients with different resting electrocardiographic results?
select avg(`max heart rate`), `resting ecg`
from heart.heart_statlog_cleveland_hungary_final
group by `resting ecg`;

#How many patients with heart disease experience exercise-induced angina (exang)
Select Count(`exercise angina`)
from heart.heart_statlog_cleveland_hungary_final
where target = 1;

#What is the average oldpeak value for patients with different levels of exercise-induced angina?
Select avg(oldpeak), `exercise angina`
from heart.heart_statlog_cleveland_hungary_final
group by `exercise angina`;

#What is the distribution of the slope of the peak exercise ST segment among patients with heart disease?
select count(*), `ST slope`
from heart.heart_statlog_cleveland_hungary_final
where target = 1
group by `ST slope`;

#What is the relationship between chest pain type (cp) and the maximum heart rate achieved (thalach) among patients with heart disease?
select `chest pain type`, avg(`max heart rate`)
from heart.heart_statlog_cleveland_hungary_final
where target = 1
group by `chest pain type`;

#How do age and cholesterol levels interact with the presence of heart disease?
Select avg(age), cholesterol
from heart.heart_statlog_cleveland_hungary_final
where target = 1
group by cholesterol


This SQL-based relational database system is designed to manage company employees, job applications, evaluations, promotions, and administrative actions. It provides a structured approach for storing, managing, and querying information related to firms, users, employees, job postings, and evaluations. The database integrates triggers, stored procedures, and constraints to enforce data consistency, automate processes, and enhance security.

Core Tables & Relationships:

company – Stores company details (e.g., name, address, tax ID).
user – Maintains user accounts with authentication details.
administrator – Defines system administrators, linked to user.
employee – Contains employee information, including bios, recommendations, certificates, and awards.
manager – Tracks managers assigned to companies.
evaluator – Identifies evaluators responsible for job candidate assessments.
degree – Stores educational degrees and institutions.
job – Represents job listings, including salary, location, and deadlines.
project – Maintains project details associated with employees.
evaluation – Stores employee evaluations with multiple performance criteria.
evaluationresult – Stores final evaluation grades and comments.
requestevaluation – Tracks employees who have requested evaluations.
languages – Stores language proficiency of employees.
Proagwges – Manages employee promotions.
ANTIKEIM – Represents job categories (e.g., software engineer, architect).
NEEDS – Associates job positions with required expertise.


Functionality & Use Cases:

Employee Management – Handles personal details, qualifications, job applications, and promotions.
Job Posting & Evaluation – Supports job announcements, candidate assessments, and evaluations.
Security & Consistency – Enforces referential integrity through ON DELETE CASCADE ON UPDATE CASCADE.
Automated Actions – Uses triggers for logging, preventing unauthorized updates, and maintaining integrity.
Advanced Queries & Procedures – Enables efficient retrieval and processing of evaluation data, job applications, and promotions.

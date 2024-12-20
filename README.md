# Orphanage Management System

## Project Overview
The **Orphanage Management System** is a comprehensive database-driven application designed to manage essential operations of an orphanage. This project was collaboratively developed by a team to ensure efficient management of information related to adopters, children, staff, donations, guardians, medical records, and more.

## Features
- **Database:** 9 tables, 4 views, and 2 sequences to store and retrieve orphanage data efficiently.
- **Forms:** User-friendly forms for CRUD operations on the database tables.
- **Report:** A detailed report generated for children in the orphanage.
- **Data Design:** The database schema is normalized, and an ERD (Entity-Relationship Diagram) was created to ensure logical data relationships and integrity.

## Database Structure
The project includes the following database components:

### Tables
1. **ADOPTER:** Stores information about adopters, including their personal details and status.
2. **CHILD:** Tracks details of children, such as their profiles and health conditions.
3. **STAFF:** Contains staff member details, including roles and contact information.
4. **CHILD_GUARDIAN:** Links children with their guardians.
5. **DONOR:** Maintains records of donations and donors.
6. **GUARDIAN:** Stores guardian information.
7. **ROOM:** Manages room allocations within the orphanage.
8. **MEDICAL_RECORD:** Keeps track of children's medical records.
9. **DONOR_STAFF:** Links donors to staff members handling their contributions.

### Views
1. **CHILD_GUARDIAN_DETAILS_VIEW:** Displays details of children along with their guardians.
2. **ADOPTER_CHILD_MEDICAL_VIEW:** Combines adopter and child medical details for easy reference.
3. **ADOPTER_STATUS_VIEW:** Provides a summary of adopter statuses.
4. **ROOM_OCCUPANCY_VIEW:** Shows the occupancy details of rooms.

### Sequences
1. **ADOPTER_SEQ:** Generates unique IDs for adopters.
2. **GENERAL_SEQ:** A general-purpose sequence for other unique identifiers.

## Application Components

### Forms
Forms have been created for all tables to enable intuitive data entry and management. These forms allow users to:
- Add new records.
- Update existing records.
- Delete records when necessary.
- View detailed information about each entity.
- Search records using id.

### Report
A single report has been created for the **CHILD** table. This report provides:
- A comprehensive list of children in the orphanage.
- Key details such as age, medical history, and guardian relationships.

## Data Design
- **Normalization:** The database has been normalized to eliminate redundancy and ensure data consistency. All tables are structured in adherence to the principles of normalization.
- **Entity-Relationship Diagram (ERD):** An ERD was created to visualize the relationships between entities and provide a clear understanding of the database design.

## Collaborators
This project was developed by the following team members:

- **[Roaa Mohamed](https://github.com/roaa46)**
- **[Eman Deyab](https://github.com/emandeyab)**
- **[Kholod Elhmamsy](https://github.com/khx7ii)**
- **[Abdelrahman Nassar](https://github.com/Abdelrahmannassar10)**

## Usage Instructions
1. **Database Setup:** Import the provided database schema and data into your Oracle database.
2. **Run Forms:** Open the forms using Oracle Forms Builder and connect to the database.
3. **Generate Report:** Use Oracle Reports Builder to generate and view the child report.

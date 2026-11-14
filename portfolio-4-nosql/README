# Portfolio 4: NoSQL (MongoDB)

This folder demonstrates the transition from a relational database (MySQL) to a document-based NoSQL database (MongoDB). It highlights how nested JSON documents can replace complex multi-table JOINs when retrieving a patient's full medical history.

## Folder Contents

* `patients-document.json`: A sample JSON document representing a single patient, including their nested appointments, consultations, and payments.
* `nosql-queries.js`: A collection of MongoDB queries used to retrieve and aggregate data from the document store.
* `nosql-analysis.md`: A written comparison between the SQL approach and the NoSQL approach for handling patient medical history.
* `README.md`: This instruction file.

## Database Setup

* **Database Name:** `nphcda_clinic_nosql`
* **Collection Name:** `patients`

## How to Reproduce

1. Ensure MongoDB is installed and running on your local machine.
2. Open MongoDB Compass and connect to `mongodb://localhost:27017`.
3. Create a new database named `nphcda_clinic_nosql` and a collection named `patients`.
4. Import the `patients-document.json` file into the `patients` collection.
5. Open the MongoDB Shell (mongosh) or use the Compass aggregation builder to run the queries found in `nosql-queries.js`.

## Queries Demonstrated

1. **Filter by field:** Find patients by gender.
2. **Query nested arrays:** Find patients who have a specific diagnosis in their medical history.
3. **Filter nested objects:** Find patients who paid via a specific payment method.
4. **Aggregation:** Unwind the medical history array and count appointments at a specific branch.

## Why NoSQL here?
In a relational database, retrieving a patient's full history requires joining 4 to 5 tables (`patient`, `appointment`, `consultation`, `payment`, `branch`). In MongoDB, the entire history is fetched in a single read from one document. This makes MongoDB highly efficient for read-heavy, hierarchical data like medical records.

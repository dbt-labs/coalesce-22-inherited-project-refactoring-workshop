Welcome to the Coalesce 2022 Inherited Project Refactoring workshop!

### About this Project
This project is written on top of [BigQuery](https://cloud.google.com/bigquery) and 
uses the publicly available [TPC-H data set](https://www.tpc.org/tpch/).

For the workshop, you will be given access to BigQuery which has the TPC-H data set loaded for you.

### About the TPC-H Data Set
If you'd like to recreate this project after the workshop, here are some good 
[starter instructions](https://relational.fit.cvut.cz/dataset/TPCH) for accessing the TPC-H data set.
The data set has also been included in this project as CSVs in the `/_resources/` 
folder for easier access, although some data sets have been truncated due to the size of the full data set.
**Note**: We don't suggest seeding these, as they still have a large number of rows.

### Using this project
If you're participating in the workshop, navigate to the `Coalesce 2022 Workshop - Refactoring dbt Cloud` account.

Setting up your IDE:
There are two ways to ensure dbt has everything it needs so you can work in your development environment:
1. Have the IDE prompt you to set up your development environment:
    1. Navigate to the IDE by clicking `Develop`
    2. Follow the prompt to your credential settings and hit `edit` to fill in the required information.
2. Settings
    1. Click on your user profile in the top left-hand corner and click `Profile Settings`
    2. Navigate to `Credentials` > `Analytics` > Hit `Edit` to fill in the required information.

Required Information:
*Dataset*: This should be `dbt_` your first initial and last name. Example: `dbt_cberger`
*Threads*: This is how many concurrent queries can be sent to BigQuery. 

Try running the following commands:
- dbt run
- dbt test

or alternatively,
- dbt build

### Resources Folder
A folder has been included to include all of the collateral used for this workshop. Within it, 
you'll find:
- The exported CSV versions of the TPC-H data set. Some of these are truncated due to the size
  of the full tables. Those which have been truncated are notated as such.
  **Note**: We don't suggest seeding these, as they still have a large number of rows.
- Diagramming Resources

### Helpful Links:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

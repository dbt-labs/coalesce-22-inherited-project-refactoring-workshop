# Inherited Project Refactoring Workshop
Welcome to the Inherited Project Refactoring workshop of Coalesce 2022!

## About this Project
You've just started working at a new job and they've been using dbt to transform
their data (YES!). However, once you've made it into their project, you realize
that you can't make heads or tails of their data flows. Let's be honest - it's a
messy project and you desperately want to form a plan for cleaning it up. 

dbt's already got some great material out there regarding refactoring (if you want
to start small, you can start with the [refactoring course](https://courses.getdbt.com/courses/refactoring-sql-for-modularity).
There's gonna be some nuances (and good solutions can only be made with experience!) - 
isn't there a quicker way to learn?

Well, we can't promise you anything, but this refactoring course is the perfect 
start to getting some extra practice in! Part of Christine and Lauren's day-to-day
is taming those crazy projects, and they've created this workshop to give you
some tips and tricks for wrangling that DAG.

__Prerequisites__:

<details>
  <summary> Live participants </summary>
  
  For the workshop, you will be given access to the dbt Cloud account with all the
  necessary prerequisites.

</details>

<details>
  <summary> All others </summary>

  1. *A Repository*   
     Ideally, with the files and folders contained in this workshop. To make a copy,
     [fork this repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
  2. *dbt*  
     Using dbt Cloud vs. dbt Core doesn't matter. You'll specifically want to know how to:
     - [install packages](https://docs.getdbt.com/docs/building-a-dbt-project/package-management)
     - [generate and view documentation](https://docs.getdbt.com/docs/building-a-dbt-project/documentation#generating-project-documentation)
     - [use selection syntax](https://docs.getdbt.com/reference/node-selection/syntax)
     - [upgrade your dbt version](https://docs.getdbt.com/guides/migration/versions/upgrading-to-v1.3), if needed (This project uses v1.3)

     To setup dbt:
     - [dbt Cloud Setup](https://docs.getdbt.com/guides/getting-started)
     - [dbt Core Setup](https://docs.getdbt.com/guides/getting-started/learning-more/getting-started-dbt-core)
  3. *Some Data*  
     This project is written on top of [BigQuery](https://cloud.google.com/bigquery)
     and uses the publicly available [TPC-H data set](https://www.tpc.org/tpch/).
     A truncated version of the data set has been included in this project as CSV files, located in the [_resources](/_resources/tpch_dataset/) folder.

     [Instructions for setting up a free BigQuery account](https://docs.getdbt.com/guides/getting-started/getting-set-up/setting-up-bigquery)  
     [Instructions for loading CSV files into BigQuery](https://cloud.google.com/bigquery/docs/samples/bigquery-load-table-gcs-csv)  
     [Starter instructions](https://relational.fit.cvut.cz/dataset/TPCH) for accessing the TPC-H dataset yourself
   
     **Note**:  
     We don't suggest seeding the CSV files. Though they are truncates, 
     they still contain a significant amount of rows.

</details>

&nbsp;

## Using this project

<details>
  <summary> Live participants </summary>

1. Navigate to the `Coalesce 2022 Workshop - Refactoring dbt Cloud` account.
2. Set up your IDE:  
   There are two ways to ensure dbt has everything it needs so you can work in your development environment:
   1. Via the IDE
      1. Navigate to the IDE by clicking `Develop`
      2. Follow the prompt to your credential settings and hit `edit` to fill in the required information.
   2. Via Settings
      1. Click on your user profile in the top left-hand corner and click `Profile Settings`
      2. Navigate to `Credentials` > `Analytics` > Hit `Edit` to fill in the required information.

3. Set up the required information:  
`Dataset`: This should be `dbt_` + your first initial + your last name. Example: `dbt_cberger`  
`Threads`: This is how many concurrent queries can be sent to BigQuery. 

4. Confirm your setup:  
   Try running the following commands:
   ```bash
   $ dbt run
   $ dbt test
   ```
   or alternatively:
   ```bash
   $ dbt build
   ```

</details>

<details>
  <summary> All others </summary>

1. Ensure your project has been configured with the connection credentials and
   [dbt profile configurations](https://docs.getdbt.com/dbt-cli/configure-your-profile).
   The setup steps in the Prerequisites section will guide you through this.

2. Confirm your setup:  
   Try running the following commands:
   ```bash
   $ dbt run
   $ dbt test
   ```
   or alternatively:
   ```bash
   $ dbt build
   ```

</details>

&nbsp;
## :tada: You're ready to move on to the next stage! :tada:
![](/_resources/images/workshop_start.gif)

Whoa... whoa there! You can't just go slinging at the DAG like that. 
[Here's a walkthrough](/guide.md) to get you trained up!

**Live participants:**  
We're asking that you don't go hopping in to the walkthrough just yet! We'll be
forming a party to walkthrough it live :purple_heart:.
## Additional Helpful Links:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

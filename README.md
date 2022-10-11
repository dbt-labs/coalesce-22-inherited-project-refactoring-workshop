# 👑 Inherited Project Refactoring Workshop 👑
Welcome to the Inherited Project Refactoring workshop of Coalesce 2022!

## :mage: About this Project :cat:
You've just started working at a new job and they've been using dbt to transform
their data (YES!). However, once you've made it into their project, you realize
that you can't make heads or tails of their data flows. Let's be honest - it's a
messy project and you desperately want to form a plan for cleaning it up. 

dbt's already got some great material out there regarding refactoring (if you want
to start with hands-on-code refactoring, you can start with the [refactoring course](https://courses.getdbt.com/courses/refactoring-sql-for-modularity)), but the road to get from where you are to where you need to be can be hard navigate
unless you've traveled it numerous times. This refactoring workshop focuses on the 
roadmap for refactoring, and is the perfect start to getting that extra practice in!  

Part of Christine and Lauren's day-to-day is taming those crazy projects - they've 
created this workshop to give you a plan, some tips and tricks, and some leveling up 
advice for wrangling those DAGs!

## :white_check_mark: Prerequisites:  
This workshop assumes that you're familiar with dbt. At a minimum you should know how to:
- Generate documentation
- Run commands and compile code
- Create branches

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
      
     If you don't have some data or a warehouse yet, don't worry - the setup will guide you through setting up a free BigQuery account and loading the 
     data for this project. Here are some resources to reference, just in case:  
     - [Instructions for setting up a free BigQuery account](https://docs.getdbt.com/guides/getting-started/getting-set-up/setting-up-bigquery)  
     - [Instructions for loading CSV files into BigQuery](https://cloud.google.com/bigquery/docs/samples/bigquery-load-table-gcs-csv)  
     - [Starter instructions](https://relational.fit.cvut.cz/dataset/TPCH) for accessing the TPC-H dataset yourself
   
     **Note**:  
     We don't suggest seeding the CSV files. Though they are truncated, 
     they still contain a significant amount of rows.

</details>

## :toolbox: Setup

<details>
  <summary> Live participants </summary>

1. Navigate to the `Coalesce 2022 Workshop - Refactoring dbt Cloud` account.
2. Configure your development credentials:  
   1. Click on your user profile in the top left-hand corner and click `Profile Settings`
   2. Scroll to the "Credentials" section.
   3. Click on `Analytics`
   4. Hit the `Edit` button in the lower right hand corner.
   5. Change these configurations:  
  
     |||
     |-|-|
     |**Dataset**| Set this to `dbt_` your first initial + last name. Example: `dbt_cberger` |
     |**Target Name**| Set this to `dev` |
  
   6. Hit `Save`

3. Run `dbt deps` to install dependencies.

4. Confirm your setup:  
   1. Navigate to the IDE by clicking on the `Develop` tab in the upper right-hand corner
   2. Try running the following commands:
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

1. [Fork this repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
2. Set up your dbt Project    
   - [dbt Cloud Setup](https://docs.getdbt.com/guides/getting-started)
   - [dbt Core Setup](https://docs.getdbt.com/guides/getting-started/learning-more/getting-started-dbt-core)
   
   **Important**  
   If you don't set up the BigQuery account and want to use another warehouse:
     - You'll need a warehouse - the warehouse is an essential connection in dbt.
     - You'll need to load the data to your selected warehouse using another method. 
     - You'll need to make changes to the repository code you forked so the syntax works with your warehouse.

4. Load the data  
   
   Download the files from the [`_resources/tpch_dataset`](/_resources/tpch_dataset/). If you are working locally, the files will be within the 
   repository location on your computer.
  
   - If you set up a BigQuery account during setup, load the data:
     1. In the BigQuery UI's `Explorer` pane, click the three dots next to your project name 
     2. Click `Create dataset`.
     3. For `Dataset ID`, type `raw_tpch`.
     4. Click `Create dataset`
     5. You should now see your dataset listed under your project name. Click the three dots next to the dataset.
     6. Click `Create table`
     7. Choose `Upload` as the **Create table from** option.
     8. Click `Browse` under `Select file` 
     9. Upload each file you downloaded from the [`_resources/tpch_dataset`](/_resources/tpch_dataset/) folder:  
        - For the **table name**, use the file name without the extension. Some file names have `_100mb` appended. Omit this.
        - Make sure to check `Auto detect` under **Schema** 
     
   - If you didn't setup BigQuery, load the data from the [`_resources/tpch_dataset`](/_resources/tpch_dataset/) into your warehouse.  
     You will need to update the `_sources.yml` file with the location of your data.

5. Run `dbt deps` to install dependencies.
   
6. Confirm your setup:  
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
![](/.github/gifs/workshop_start.gif)

Whoa... whoa there! You can't just go slinging at the DAG like that. 
[Here's a walkthrough](https://github.com/dbt-labs/coalesce-22-inherited-project-refactoring-workshop/wiki) to get you trained up!

**Live participants:**  
We're asking that you don't go hopping in to the walkthrough just yet! We'll be training together live! :purple_heart:  

## Additional Helpful Links:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

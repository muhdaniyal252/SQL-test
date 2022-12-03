problem statement
- Group performance data for each platform by date (day granularity)
- The columns will include standard SUM and AVG aggregations, such as clicks and cost.
- Additional calculated columns for each day, including the previous day and 7 days ago
- Grouping by metrics based on date and campaign naming convention (using regex). For
example, for campaigns named "Campaign [RT]" vs. "Campaign [PROS]" we will want RT cost
vs. PROS cost.
- The campaign naming logic should be case-insensitive and account for if it’s in the front of the
name vs back.. Eg. "[rt] Campaign"

Expected output
The deliverable will be SQL queries that produce the desired results. And create the
columns as described below.
The queries should have a clear naming convention and either comments to explain
what's going on or a brief screenshare/loom.com walkthrough.
Bonus: Visualize output in a dashboarding platform (PowerBI / DataStudio / Tableau /
Jupyter)
Bonus: For any visualization platform you use, try to use the platform's best practices.
(DAX in case of power bi etc)



one file converts csv to mysql data
one file is perfomring quires

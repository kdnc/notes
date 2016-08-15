-- Interpreting SQL Server Index Recommendations (Main Topic)

	-- Step 0
	-- * Print some IO and time statistics in Messages tab when running the statement
	SET STATISTICS IO ON
	SET STATISTICS TIME ON

	

	-- Step 1
	-- * SQL Server Index recommendations can be overly aggressive
	-- * Analyze the recommendation first before creating

	-- Step 1.1 
	-- * Check the Execution Plan
	-- * Notice the Missing Index Recommendation
	SELECT * 
		FROM Students
		WHERE LastName = 'Davis'
			AND State = 'CO'

	-- Step 1.2
	-- * Missing Index Recommendation from above statement
	/*
	Missing Index Details from 028 - Interpreting SQL Server Index Recommendations.sql - (local)\SQLEXPRESS.Students (sa (57))
	The Query Processor estimates that implementing the following index could improve the query cost by 94.8208%.
	*/

	/*
	USE [Students]
	GO
	CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
	ON [dbo].[Students] ([LastName],[State])

	GO
	*/

	-- Step 1.3
	-- * In the above statement SQL Server could use an index which I have created earlier for State.
	-- * SQL Server's recommendations are based on looking at one individual SQL statement
	-- * You want to view these recommendations in the larger context of all of your statements for a given table
	
	

	-- Step 2
	-- * Consider a covering index when you only need to add one or two columns as include columns to give a
	-- performance boost to a key query

	-- Step 2.1 
	-- * Include keyword lets you specify one or more column values should be stored in the index with
	-- the index key, but they are not part of the index key.
	-- * So these include columns cannot be used by the SQL Server to one of the searches to the index.
	-- * They will just have the values stored with the index
	CREATE INDEX IX_STUDENTS_EMAIL
		ON Students (Email)
		INCLUDE (FirstName, LastName);

	-- Step 2.2
	-- * SQL Server is able to find all the data for the query in the index itself
	-- * This avoids needing a key lookup operation to find the data row in the table
	-- * This statement does not use star(*) in the query, instead it returns exactly what columns it wants
	-- * Notice that all the columns are covered in the index
	-- * Check the execution plan
	SELECT Email, FirstName, LastName
		FROM Students
		WHERE email = 'PaulDWilliams@gustr.com';

	-- Step 2.3
	-- * If we have one column that we need we don't have the data for, SQL Server would have to perform
	-- the lookup operation on the table 
	-- * Check the execution plan
	-- * Telephone is needed by the query and since it is not part of the index, the index is not covering 
	-- index for this query, and SQL Server has to go to the table to get that value
	SELECT Email, FirstName, LastName, Telephone
		FROM Students
		WHERE email = 'PaulDWilliams@gustr.com';
	
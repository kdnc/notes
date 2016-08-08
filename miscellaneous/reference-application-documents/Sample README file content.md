# Project name
<br/>
## Table of Contents
**[Resource location](#resource-location)**  
**[Overview](#overview)**  
**[Tested environment](#tested-environment)**    
**[Additional development steps followed](#additional-development-steps-followed)**   
**[Deployment details](#deployment-details)**    

## Resource location

Resource - [Lynda] C# Essential Training (Dec 18, 2014) \ 09 Working with Inheritance & Polymorphism \ 188207_09_02_XR15_inherit.mp4

Repository URL - [https://github.com/martijnboland/VSReact](https://github.com/martijnboland/VSReact)

## Overview

- An ASP.NET web application to create, view and follow gigs.
- Following are the important course content
	- 02 Extracting Core Use Cases from Requirements
	- 03 Planning the First Iteration
	- 04 Building a Model Using Code-first Workflow
	- 05 Building a Form with Bootstrap
	- 06 Saving Data
	- 07 Implementing Validation
	- 08 Preventing Common Web Application Vulnerabilities
	- 09 Moving Towards a Beautiful Design
	- 10 Usability Best Practices
	- 11 Extending ASP.NET Identity Users
	- 12 Creating Beautiful and Precise Designs with CSS
	- 13 Implementing a Use Case from Top to Bottom
	- 14 Implementing Secondary Use Cases

## Tested environment

### Development tools

- NodeJS 5.9.0

### IDEs used

- Visual Studio 2015

### Operating system

- Windows 10

## Additional development steps followed

### Entity Framework

- Code first workflow

	1. Open `Nuget Package Manager` -> `Package Manager Console` and issue following commands
	2. Enable migrations
	
			enable-migrations

	3. Scaffold the next migration based on changes you have made to your model since the last migration was created
	
			add-migration CreateGigTable
			add-migration CreateGigTable -force

	4. Apply any pending migrations to the database

			update-database

## Deployment details

1. Open the .sln file with Visual Studio 2015
2. Hit F5

---

1. To run node versions, open a node command prompt and `cd` into the particular design pattern folder location
2. Run following command

    	node main.js

3. To run angular versions, `cd` into the particular design pattern folder location
4. Spawn a server on the current location and look it in the browser 

---
1. `cd` into the project root folder where package.json file is located.
2. Install node modules

		npm install
		npm install nodemon -g

4. Compile typescript code if any .ts files available. This would compile the .ts files to .js files in the `build\` folder

		npm run tsc

6. Start the server 
	
	- In dev mode
		
			npm run dev

	- In production mode
		
			npm run start


5. Run `karma` tests

		npm run test
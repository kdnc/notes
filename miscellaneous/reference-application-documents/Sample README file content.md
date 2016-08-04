# Project name
<br/>
## Table of Contents
**[Resource location](#resource-location)**  
**[Overview](#overview)**  
**[Tested environment](#tested-environment)**    
**[Deployment details](#deployment-details)**    

## Resource location

Resource - [Lynda] C# Essential Training (Dec 18, 2014) \ 09 Working with Inheritance & Polymorphism \ 188207_09_02_XR15_inherit.mp4

Repository URL - [https://github.com/martijnboland/VSReact](https://github.com/martijnboland/VSReact)

## Overview

- React TodoMVC app with ASP.NET Web Api backend, developed with Visual Studio.

## Tested environment

### Development tools

- NodeJS 5.9.0

### IDEs used

- Visual Studio 2015

### Operating system

- Windows 10

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
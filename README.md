# Project White Wolf

## Introduction
Our project aims to find reasonable software solutions that prevent or reduce Healthcare Associated Infections (HAI).
In today’s society it’s hard to find common aspects of life that affect everyone. However, this is not the case when speaking to healthcare. Unfortunately, the high monetary cost of healthcare and an individual’s socio-economic standing usually correlate to the quality of healthcare people receive. As medical advances increase the lifespan of the aging population we can assume that the cost of healthcare will continue to rise causing tax payers to pay the brunt of those increased cost.
In an effort to decrease the cost of healthcare, we analyzed the affect of Healthcare Associated Infections (HAI) and how potential software applications can be utilized to reduce instances of HAI’s in healthcare facilities. 

## Software Solutions: 

![whitewolf](https://cloud.githubusercontent.com/assets/21042389/23233907/579387d8-f91e-11e6-824d-31946e4a311b.png)

Application - Threat Map
The threat map application utilizes data as a surveillance method to reduce HAI events. The threat map takes input as variables from internal databases and transforms
these variables into a threat rating which is applied to an overall HAI risk rating for each patient within the hospital. Example variables include 
the patients illness, age and other demographic information as well as the number of nurse visits, number of outside visitors, the last time the patients room was cleaned,
patients length of stay, and others. An overall threat rating for each patient will give hospital staff the information needed to efficiently allocate resources to the highest priority.      

Application -To Do Check List
Current methods to reduce HAI rely on hospital staff following strict protocols. Unfortunately, due to a lack of resources and the hectic environment of 
a hospital, protocols often get missed. The "To Do Check List" is an application that can run on a wearable device such as the apple watch that informs hospital staff
of the correct protocol that needs to be followed, but more importantly it alerts hospital staff of protocols that were missed while caring for a patient. The application
also allows for the integration into patient monitoring equipment that can instantaneously alert staff of an issue.      

## Getting Started

These instructions will get you a copy of the project up and running on IBM Cloud.

### Prerequisites

* An IBM Bluemix account (free for students).
* Basic knowledge of IBM Mobile app builder (to be completely moved to Kinetise.com after May 2017)
* Basic knowledge of IBM Cloudant Database
* Basic knowledge of IBM Node.JS and its associated modules
* Basic knowledge of HTML and CSS

### Installing :: WHITE WOLF DASH BOARD (nodeJS)

[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://hub.jazz.net/deploy/index.html?repository=https://github.com/genterist/whiteWolf/tree/master/whiteWolf-nodejs-master)

* Download and install Cloud Foundry CLI to be used on the terminal.
* On the Terminal, Connect to Bluemix using the CF CLI and follow the prompts to log in. 
* Once you're in the same space as the app, create the Cloudant NoSQL DB service in Bluemix
```
    $cf api https://api.ng.bluemix.net
    $cf login
    $cf create-service cloudantNoSQLDB Lite <service-name>
```
* Bind this service to your app
```
    $cf bs NodeJSCloudantSampleApp <service-name-as-in-previous-step>
```
* Edit the manifest.yml file and change the <application-host> parameter to something unique.
```
    applications:
    - path: .
    name: NodeJSCloudantSampleApp
    host: <change_to_something_unique>
    framework: node
    memory:256M
    instances: 1
    services:
    - <service-name>
```
   The host you use will determinate your application url(e.g. <host>.mybluemix.net). REMOVE the following lines from manifest.yml as you no longer need this cloudant service. The one you created in step 4 will be the one primarily used.
```   
	declared-services:
  	   cloudant-nodejs:
    	     label: cloudantNoSQLDB
    	     plan: Shared
```    	     
* Start the application by typing
```
    $cf start NodeJSCloudantSampleApp
```  

#### For more documents on Cloudant NoSQL DB

* https://cloudant.com

* https://docs.cloudant.com/document.html#undefined

* https://github.com/cloudant/nodejs-cloudant/blob/master/example/crud.js

* https://www.ng.bluemix.net/docs/#services/Cloudant/index.html#Cloudant


#### Troubleshooting

To troubleshoot your Bluemix app the main useful source of information are the logs, to see them, run:

  ```
  $ cf logs <application-name> --recent
  ```

### Installing :: WHITE WOLF Cloudant NoSQL database

JSON files of our tables are as followed:

(to be added)



## Contributing

Please read [CONTRIBUTING.md]for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use GitHub

## Authors

Tam Nguyen - Christine Zeng - Matt Farver

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
* etc

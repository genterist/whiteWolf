# Project White Wolf

## White Wolf Project Deliverables
* Demo video : https://youtu.be/ooFfdp3kWvY
* APK file : https://github.com/genterist/whiteWolf/blob/master/WHITEWOLF-2.apk
* Github page : https://github.com/genterist/whiteWolf

## 1. Inspiration
According to the Center for Disease Control (CDC), HAIs are infections that patients acquire during the course of receiving treatment for other condition within a healthcare setting. However, HAIs are not limited to patients. Healthcare staff can also get infected. Recently, HAIs have gained increased attention due to high profile cases such as the Ebola outbreak in 2014 which resulted in two nurses contracting the Ebola virus while giving treatment to an Ebola patient in Texas. Other cases of HAIs include antibiotic resistant super-bugs such as MRSA which has become increasingly common in healthcare settings.

[![Top issues in hospital setting](https://s9.postimg.org/xfbup60zz/Screen_Shot_2017_02_26_at_9_55_44_PM.png)](https://postimg.org/image/t674mzxqj/)

"Critical Issues in Healthcare Environments" _ Cohen2009

Our team performed issue research and conclude that:

1. We need to change the culture of how we perceive and react to HAI. Instead of confirming HAI, we need to **focus more on predicting HAI**. With prediction and early prevention, the chance of being investigated and/or being sued is much lesser than the case of a confirmed HAI. With that as an incentive, we believe more people will be more willing to participate in the data colection process. In a long run, it will also increase the speed of patient flow resulting in higher revenue for the institution and lesser work load for nurses.
2. Instead of statistical data, we need to focus more on gathering **contextual** data. We believe it is not harder to design a system that can identify abnormalities in contextual data when compared to a system designed for statistical data. Understand the context of an incident can also be very beneficial to many stakeholders. The policy makers will be able to make adjustments to policies and work flows. Helpful contextual data may also help nursees to defend themselves in court cases.
3. We need to **focus on real-time data collection**, data sharing and data processing. Each and every second, there are million of usable data floating around both inside and outside an institution. What if a police's incident database can help with the positioning of ambulances for future cases? What if a twitter trend can help with forecasting a healthcare outage?

Our full report is available at 

[https://github.com/genterist/whiteWolf/blob/master/proactive-software-solutions.pdf](https://github.com/genterist/whiteWolf/blob/master/proactive-software-solutions.pdf)

## 2. What "White Wolf" does

![whitewolf](https://cloud.githubusercontent.com/assets/21042389/23233907/579387d8-f91e-11e6-824d-31946e4a311b.png)

### Employs existing precision tracking technologies
We realize that not all healthcare institutions will have the budget to digitalize everything and even when they do, there is a physical limitations on where we can put smart chips in. For example, we can detect if a nurse had washed her hand before a certain procedure or not (forgetting to wash hand - despite previous training - is still a very common mistake). However, we cannot detect if a medical tape was accidentally left on a bed linnen (infected) surface or not.
Ultra wideband precision tracking like Pozyx system (pozyx.io) can keep track of nurses' hand positions (2D & 3D) and help detect if a task has been done or even detect contextual mistake

### Automatic To-Do Check List
Based on precision tracking technology, we build the "Automatic To-Do Check List" which can run on a wearable device such as the apple watch, cellphone or existing hospital pads (android or ios). Based on our survey (check the above-mentioned report), we understand that the workflow of a nurse can be really complicated in real life situations (a big reason why mistakes still happen regardless of formal trainings). With this app, nurses just have to remember the rooms s/he is responsible for and once s/he enters the room, a list of pending tasks for the room will pop up. This is particularly helpful when nurse while performing procedures in a room was disrupted by emergencies in other room(s). The software also help nurses with executing the correct order of tasks - once a task is done, it will be removed from the displayed list. The application also allows for the integration into patient monitoring equipment that can instantaneously alert staff of an issue.  

### Threat Map
The threat map application utilizes data as a surveillance method to reduce HAI events. The threat map takes input as variables from internal databases (such as the task database from the "Automatic To-do checklist" module) and transforms these variables into a threat rating which is then used to calculate an overall HAI risk rating for each room. Example variables include the patients illness, age and other demographic information as well as the number of nurse visits, number of outside visitors, the last time the patients room was cleaned, patients length of stay, and others. An overall threat rating for each patient will give hospital staff the information needed to efficiently allocate resources to the highest priority.      

[![Features](https://cloud.githubusercontent.com/assets/21042389/23274877/61293f68-f9d2-11e6-8ef3-4161041094d0.png)](https://www.youtube.com/watch?v=86cTLcC28yk)

## 3. How we built it
* Precision tracking system data feeds will be processed by its api (PoZyx and its python api).
* Data will the be presented in our mobile client (Android and iOS) and web dashboard
* We use IBM cloud stack of Cloudant DB + Express + Node.JS + MobileFirst/Mobile UI builder
* Agile method was used with tool chain of<br/>
[IBM control interface + Github] --> [IBM Build] --> [Sauce labs/tests] --> [Deploy] 
<br/>

![Toolchain](http://i68.tinypic.com/153205c.png)

## 4. Getting Started

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

### Installing :: WHITE WOLF Cloudant NoSQL database

[threatmap]

[names_database]

[tasks]


(to be added)

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

## 5. Challenges we ran into
[![IBM cloud issues](https://s13.postimg.org/70m0irq1j/16807327_10154452750098995_4978137719176985651_n.jpg)](https://postimg.org/image/rkquh95sj/)

* We started coding our project in beginning of February (our team was formed in January and we spent that month on issue research). Unfortunately, IBM cloud was scheduled to undergo several major changes including but not limited to the upgrading of its entire Cloud Foundry's architecture (https://www.ibm.com/blogs/bluemix/2016/11/bluemix-cloud-foundry-upgrading-dea-diego-architecture/). Our team was having issues (sometimes even cannot access the cloud control interfaces) making changes to our projects.

* We also have to deal with the learning curve since this is the first time we use IBM's cloud service and implement an entire project on the cloud. 

## 6. Accomplishments that we're proud of
* We are most proud of the results of our issue research. We are not in the healthcare industry but through literature reviews, performing our own user surveys, we were able to identify the issue, understand the root causes of it and form our own conclusions on what need to be done differently.

* We are also proud of how fast our team went from almost zero knowledge with IBM cloud to a good enough demo considering we are all master candidates with heavy academic workload and schedules.

## 7. What we learned
* We got hands on experience on automatic execution of tool chains (build, test and deployment were automated and executed right away after each time new codes were committed)
* We learned about new features of IBM cloud
* We learned to be more flexible when working with each other (considering the time limit and the issues we faced)
* We learned about Hospital Acquired Infection - a hot topic in health care industry

## 8. What's next for White Wolf

[![introduction](https://cloud.githubusercontent.com/assets/21042389/23274878/6129d144-f9d2-11e6-8219-631b02ff118b.png)](https://www.youtube.com/watch?v=988ecqkKdJI)
## Contributing

Please read [CONTRIBUTING.md]for details on our code of conduct, and the process for submitting pull requests to us.

## 9. Authors

Tam Nguyen - Christine Tzeng - Matt Farver

## 10. License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


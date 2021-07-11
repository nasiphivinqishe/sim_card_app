## Sim Cards Management App

This backend solution is Node.js implemented, it manages sim cards, having routes as defined from the assessment.

### Installation

This Solution currently runs on Node v-15.0.0 avaliable at [Node official Website](https://nodejs.org/en/).
Please first install node_modules/dependencies by running:

```
npm install
```

### Database Imports

An extract of exported database is also provided on the 'Database Export', to run this App please import it into a MySQL Server. The MySQL version I used is: Server version: **10.4.8-MariaDB\***. The database is designed with relationship between tables, and also constraints to enforce those relationship and other rules put on the Assessment document.

### To Run this App

After the node_modules have done installation, procceed to create a `.env` file in root directory of this app, this file keeps the Application's enviromental variables(configs). A `.env-example` file is provided within this package with required variable names, please fill it with all the variables before
attepting to run the app.

Then use command:

```
node index.js
```

to run this App. Currently the app is set to run at port **8000** you can change it to any other port.

### Testing Routes

An exports of collections of Post Man endpoints has be also included in the folder named **'Post Man Collections Export'**, to test the App when its running you can use them. _You_ can also create other routes as to test this Solution more, appropiate responses/errors will be through accordingly
when marking requests. It will be useful to view the relationship of table before pursing creating new requests to test as to see how table are connected and as well as constraints. The export is of **V2** Post Man Export.

Post Man can be downloaded from its [Official Website link](https://www.postman.com/)

### Contact Developer

Email: nasiphivinqishe@gmail.com
Cell Number: 0732891120

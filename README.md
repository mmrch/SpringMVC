ShopBridge
================
Description
--------------
It is a e-commerce application. As the part of this assignment, admin page is created to handle different items that they would have for sale.

Technology
----------


**Tools:**

* Eclipse
* JDK
* MYSQL workbench

**Framework:**

* Spring MVC

**Dependancies:**

* json
* spring-webmvc
* spring-orm
* hibernate-core
* mysql-connector-java
* jstl



Project setup
----------


**Server setup:**

* Download tomcat 9 server from https://tomcat.apache.org/download-90.cgi.
* Extract the downloaded zip file.
* Open the Eclipse IDE and setup the tomcate server in it.

**Import this project in eclipse**

* Download this project from github as zip file.
* Extract the downloaded zip file.
* Open the Eclipse and import this extracted project.
* update the project to download the dependancies from the repositry.

**Database**

* Start the MYSQL on the local server (I used XAMPP)

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Database/XAMPP%20server.png?raw=true)

* Open the MYSQL workbench and create the new schema named "shopbridge".

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Database/createSchema.png?raw=true)

* Open the eclipse and update the shopbridge-servlet.xml located inside WEB_INF folder with your MYSQL port number , username and password.

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Database/configerServlet.png?raw=true)

* Run the project as "Run on server"
* Hibernate will create the table for us as per our modal class (Here its Product.java).

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Database/tableCreated.png?raw=true)

Perform CRUD operation
----------


**Run the project as "Run on server" it will be opened in you default browser**


**Add Product**

* Click on "Add New Product" button , it will open a pop-up window

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Website/homepage.png?raw=true)

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Website/addPopup.png?raw=true)


* Check for form validation as below

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Website/validate.png?raw=true)

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Website/validateNumber.png?raw=true)

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Website/validatenull.png?raw=true)

* Finally product is added in UI and reflacting in database as below

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Website/newProductAdded.png?raw=true)

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Database/addedToDatabase.png?raw=true)

**Delete Product**


* Now delete the product by clicking the delete icon on product and product will be deleted as below.

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Website/deleteProduct.png?raw=true)

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Website/AfterDelete.png?raw=true)

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Database/deletedFrDatabase.png?raw=true)

**Edit Product**

* Edit the product by click the edit icon , a pop-up will appear with all the values prefilled .
* Change the required item for this product and click on "Update" it will be updated.

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Website/modifyPop-up.png?raw=true)

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Website/Modifyed.png?raw=true)

![alt text](https://github.com/mmrch/springMVC/blob/master/Gallary/Database/databaseUpdated.png?raw=true)


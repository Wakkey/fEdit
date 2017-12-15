@echo off
cd Script_lib
javac -cp . sql_set.java
java -cp .;mysql-connector-java-5.1.42-bin.jar sql_set

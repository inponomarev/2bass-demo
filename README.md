# 2bass demo

Demo example for [2bass](https://github.com/CourseOrchestra/2bass).

## Usage


1. Modify bass.properties and set:

* `score.path` — actual path to `score` folder
* `jdbc.url` — actual JDBC URL to connect to your database
* `jdbc.username`  — database username 
* `jdbc.password`  — database password

2. Change directory to `bin` subfolder of 2bass installation directory
3. Run 

```
 bass apply --propertiesFile=<path-to-bass.properties-file>
```

If everything goes well, the output should look like

![Successful update](3_update_success.png)
 
## EXEC NATIVE sections
 
Note EXEC NATIVE sections in this example. This is where any database-specific code can be put. The syntax is:

```
 (EXEC|EXECUTE)  NATIVE (ORACLE|POSTGRESQL|MSSQL|H2) (BEFORE|AFTER) --{{
   ...NATIVE CODE GOES HERE...
 --}};
```

BEFORE/AFTER scripts are executed before/after the automated update.

Everything between --{{ and --}} is passed to RDBMS without modification. In fact, CelestaSQL parser treats --{{..--}} block as a special lexem.

Note the semicolon in the end: this is mandatory statement separator, like for any other CelestaSQL statement.


# connect to vertica database throuhg jdbc--------------------------------------
verticaJDBC <- function(user,password,javapath,classpath) {

  # set environment path to java------------------------------------------------
  Sys.setenv(JAVA_HOME=javapath)

  # set memory limit------------------------------------------------------------
  options(java.parameters='-Xmx8048m')

  # load required package-------------------------------------------------------
  if (!('RJDBC' %in% installed.packages())) {

    install.packages('RJDBC')

  }

  library(RJDBC)

  # set driver parameters-------------------------------------------------------
  driver = 'com.vertica.jdbc.Driver'
  vDriver <- JDBC(driverClass=driver,classPath=classpath)

  # connection string-----------------------------------------------------------
  host = 'shr4-vrt-pro-006.houston.hp.com'
  database = 'shr4_vrt_pro_006'
  params = paste('jdbc:vertica:/',host,database,sep='/')

  # establish connection--------------------------------------------------------
  cn <- dbConnect(vDriver,params,user,password)

  dbGetInfo(vDriver)

  return(cn)

}
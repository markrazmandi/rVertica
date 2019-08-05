# connect to vertica database through odbc--------------------------------------
verticaODBC <- function(user,password) {

  # load required package-------------------------------------------------------
  if (!('RODBC' %in% installed.packages())) {

    install.packages('RODBC')

  }

  library(RODBC)

  # connection string-----------------------------------------------------------
  par = paste0(
    'Driver={Vertica};',
    'Database=shr4_vrt_pro_006;',
    'Servername=shr4-vrt-pro-006.houston.hp.com;',
    'UID=',user,';',
    'PWD=',password,';',
    'PreferredAddressFamily=none;'
  )

  # establish connection--------------------------------------------------------
  cn <- odbcDriverConnect(par)

  odbcGetInfo(cn)

  return(cn)

}
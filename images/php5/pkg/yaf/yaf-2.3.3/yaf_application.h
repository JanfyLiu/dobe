/*
  +----------------------------------------------------------------------+
  | Yet Another Framework                                                |
  +----------------------------------------------------------------------+
  | This source file is subject to version 3.01 of the PHP license,      |
  | that is bundled with this package in the file LICENSE, and is        |
  | available through the world-wide-web at the following url:           |
  | http://www.php.net/license/3_01.txt                                  |
  | If you did not receive a copy of the PHP license and are unable to   |
  | obtain it through the world-wide-web, please send a note to          |
  | license@php.net so we can mail you a copy immediately.               |
  +----------------------------------------------------------------------+
  | Author: Xinchen Hui  <laruence@php.net>                              |
  +----------------------------------------------------------------------+
*/

/* $Id: yaf_application.h 329002 2013-01-07 12:55:53Z laruence $ */

#ifndef PHP_YAF_APPLICATION_H
#define PHP_YAF_APPLICATION_H

#define YAF_APPLICATION_PROPERTY_NAME_CONFIG		"config"
#define YAF_APPLICATION_PROPERTY_NAME_DISPATCHER	"dispatcher"
#define YAF_APPLICATION_PROPERTY_NAME_RUN			"_running"
#define YAF_APPLICATION_PROPERTY_NAME_APP			"_app"
#define YAF_APPLICATION_PROPERTY_NAME_ENV			"_environ"
#define YAF_APPLICATION_PROPERTY_NAME_MODULES		"_modules"
#define YAF_APPLICATION_PROPERTY_NAME_ERRNO			"_err_no"
#define YAF_APPLICATION_PROPERTY_NAME_ERRMSG		"_err_msg"

extern zend_class_entry *yaf_application_ce;

int yaf_application_is_module_name(char *name, int len TSRMLS_DC);

YAF_STARTUP_FUNCTION(application);
#endif

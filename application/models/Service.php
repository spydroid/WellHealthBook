<?php
/******************************************************************************
 *  Service.php
 *
 *  @copyright: (c) 2014 WellHealthBook (http://www.wellhealthbook.com)
 *  @author: SpyDroid (spydroid@me.com) 2014
 *
 *  @license: GNU GPL v3, you can find a copy of that license under LICENSE
 *      file or by visiting: http://www.fsf.org/licensing/licenses/gpl.html
 *
 *****************************************************************************/


/*****************************************************************************
*       Service.php
*
*       Author:  ClearHealth Inc. (www.clear-health.com)        2009
*       
*       ClearHealth(TM), HealthCloud(TM), WebVista(TM) and their 
*       respective logos, icons, and terms are registered trademarks 
*       of ClearHealth Inc.
*
*       Though this software is open source you MAY NOT use our 
*       trademarks, graphics, logos and icons without explicit permission. 
*       Derivitive works MUST NOT be primarily identified using our 
*       trademarks, though statements such as "Based on ClearHealth(TM) 
*       Technology" or "incoporating ClearHealth(TM) source code" 
*       are permissible.
*
*       This file is licensed under the GPL V3, you can find
*       a copy of that license by visiting:
*       http://www.fsf.org/licensing/licenses/gpl.html
*       
*****************************************************************************/


class Service {

	const SERVICE_NOMINAL = 'serviceNominal';

	public static function getServices() {
		$ok = true;
		$services = array();

		$service = array();
		$id = 'nsdr';
		$service['id'] = $id;
		$service['name'] = 'NSDR';
		$nsdrStatus = NSDR2::systemStatus();
		if ($nsdrStatus === false) {
			$ok = false;
			$nsdrStatus = 'stopped';
		}
		if ($nsdrStatus != 'started' && $nsdrStatus != 'reloaded') {
			$ok = false;
		}
		$service['status'] = ucwords($nsdrStatus);
		$services[$id] = $service;

		$service = array();
		$id = 'hl7d';
		$service['id'] = $id;
		$service['name'] = 'Processing Daemon';
		$hl7Status = false; // temporarily set to false
		if ($hl7Status === false) {
			$hl7Status = 'stopped';
		}
		$hl7Status = 'Stopped';
		if (file_exists('/tmp/CHProcessingDaemon.lock')) {
			$hl7Status = 'Started';
		}
		$service['status'] = ucwords($hl7Status);
		$services[$id] = $service;

		$service = array();
		$id = 'menu';
		$service['id'] = $id;
		$service['name'] = 'Menu';
		$configItem = new ConfigItem();
		$configItem->configId = 'enableCache';
		$configItem->populate();
		$menuStatus = __('Disable');
		if ($configItem->value) {
			$menuStatus = __('Enable');
		}
		else {
			$ok = false;
		}
		$service['status'] = $menuStatus;
		$services[$id] = $service;

		$service = array();
		$id = 'permissions';
		$service['id'] = $id;
		$service['name'] = 'Permissions';
		$status = PermissionTemplate::serviceStatus();
		if ($status === false) {
			$ok = false;
			$status= 'stopped';
		}
		if ($status != 'started' && $status != 'reloaded') {
			$ok = false;
		}
		$service['status'] = ucwords($status);
		$services[$id] = $service;

        $cache = Zend_Registry::get('cache');
        $serviceNominal = $cache->get(self::SERVICE_NOMINAL);
		if ($ok) {
            $cache = Zend_Registry::get('cache');
            $cache->set(self::SERVICE_NOMINAL, true);
		}
		else {
			if ($serviceNominal !== false) {
                $cache->delete(self::SERVICE_NOMINAL, 0);
			}
		}
		return $services;
	}

}

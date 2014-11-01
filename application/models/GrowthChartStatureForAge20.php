<?php
/*****************************************************************************
*       GrowthChartStatureForAge20.php
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


class GrowthChartStatureForAge20 extends GrowthChartBase {

	protected $growthChartStatureForAge20Id;
	protected $age;

	const BASE_UNIT = 'Months';
	const PERCENTILE_NAME = 'Stature';
	const PERCENTILE_UNIT = 'cm';

	protected $_table = 'growthChartStatureForAge20';
	protected $_primaryKeys = array('growthChartStatureForAge20Id');

	public function listVitals(Person $person) {
		$dateOfBirth = strtotime($person->dateOfBirth);
		$dateBegin = date('Y-m-d',strtotime('+24 months',$dateOfBirth));
		$dateEnd = date('Y-m-d 23:59:59',strtotime('+240 months',$dateOfBirth));
		$vitals = array();

		$filters = array();
		$filters['personId'] = (int)$person->personId;
		$filters['dateBegin'] = $dateBegin;
		$filters['dateEnd'] = $dateEnd;
		$filters['vitals'] = array('height');
		$data = GrowthChartBase::getAllVitals($filters,$dateOfBirth);
		foreach ($data as $age=>$row) {
			$vital = array();
			$vital['x'] = $age;
			$vital['y'] = $row['height'];
			$vitals[] = $vital;
		}
		return $vitals;
	}

}

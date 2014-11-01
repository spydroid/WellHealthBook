<?php
/******************************************************************************
 *  MenuController.php
 *
 *  @copyright: (c) 2014 WellHealthBook (http://www.wellhealthbook.com)
 *  @author: SpyDroid (spydroid@me.com) 2014
 *
 *  @license: GNU GPL v3, you can find a copy of that license under LICENSE
 *      file or by visiting: http://www.fsf.org/licensing/licenses/gpl.html
 *
 *****************************************************************************/


/*****************************************************************************
*       MenuController.php
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


/**
 * Menu controller
 */
class MenuController extends WebVista_Controller_Action
{

    /**
     * Default action to dispatch
     */
    public function indexAction()
    {
        return $this->menuXmlAction();
    }

    public function menuXmlAction ()
    {
        //echo "<!-- start ts " . calcTS() . "-->";
        header("Cache-Control: public");
        header("Pragma: public");

        $cache = Zend_Registry::get('cache');
        $cacheKey = "menu-" . Menu::getCurrentlySelectedActivityGroup() . "-" . Menu::getCurrentUserRole();
        $cacheKey = str_replace('-', '_', $cacheKey);
        $cacheKey = str_replace('/', '_', $cacheKey);
        if ($cache->test($cacheKey."_hash")) {
            $hash = $cache->get($cacheKey."_hash");
            $lastModified = $cache->get($cacheKey."_lastModified");
            $headers = getallheaders();
            if (isset($headers['If-None-Match']) && preg_match('/'.$hash.'/', $headers['If-None-Match'])) {
                header("Last-Modified: " . $lastModified);
                header('HTTP/1.1 304 Not Modified');
                exit;
            }
        }

        $menuXml = "";
        $menuXml = Menu::generateCurrentMenu();
        $hash = md5($menuXml);
        $lastModified = gmdate("D, d M Y H:i:s")." GMT";
        $objConfig = new ConfigItem();
        $objConfig->configId = 'enableCache';
        $objConfig->populate();
        if ($objConfig->value) {
            $cache->set($cacheKey."_hash", $hash, true, array('tagMenu'));
            $cache->set($cacheKey."_lastModified", $lastModified, true, array('tagMenu'));
            $cache->set($cacheKey, $menuXml, true, array('tagMenu'));
        }
        header("ETag: ". $hash);
        header("Last-Modified: ". $lastModified);
        header("Content-length: "  . mb_strlen($menuXml));

        $this->view->menuXml =  $menuXml;
        header('Content-Type: application/xml;');
        $this->render('menuXml');
        //echo "<!-- second ts " . calcTS() . "-->";
    }

    public function syncWithXmlAction()
    {
    }

}


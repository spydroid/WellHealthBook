<?php
/*****************************************************************************
 *  Cache.php
 *
 *  @copyright: Copyright (c) 2014 WellHealthBook (http://www.wellhealthbook.com)
 *  @author: SpyDroid (spydroid@me.com) 2014
 *
 *  @license: GNU GPL v3, you can find a copy of that license under LICENSE
 *            file or by visiting: http://www.fsf.org/licensing/licenses/gpl.html
 *
 *****************************************************************************/


class SpyDroid_Cache
{

    protected $cache = null;

    public function __construct($cache = null)
    {
        $this->setCache($cache);
    }

    public function getCache()
    {
        return $this->cache;
    }

    public function setCache($cache)
    {
        $this->cache = $cache;
    }

    public function get($id, $frontend = false)
    {
        return $this->load($id, $frontend);
    }

    public function set($id, $value, $frontend = false, $extra = array())
    {
        return $this->save($id, $value, $frontend, $extra);
    }

    public function load($id, $frontend = false)
    {
        $data = false;
        $cache = $this->getCache();
        if ($cache !== null) {
            if (!$frontend) $cache = $cache->getBackend();
            $data = $this->cache->load($id);
            if ($data !== false) $data = unserialize($data);
        }
        return $data;
    }

    public function save($id, $value, $frontend = false, $extra = array())
    {
        $cache = $this->getCache();
        if ($cache !== null) {
            if (!$frontend) $cache = $cache->getBackend();
            $this->cache->save(serialize($value), $id, $extra);
        }
        return $this;
    }

    public function flush($frontend = false)
    {
        return $this->clean();
    }

    public function clean($frontend = false)
    {
        $cache = $this->getCache();
        if ($cache !== null) {
            if (!$frontend) $cache = $cache->getBackend();
            $this->cache->clean();
        }
        return $this;
    }

    public function delete($id, $frontend = false)
    {
        return $this->remove($id, $frontend);
    }

    public function remove($id, $frontend = false)
    {
        $cache = $this->getCache();
        if ($cache !== null) {
            if (!$frontend) $cache = $cache->getBackend();
            $this->cache->remove($id);
        }
        return $this;
    }

    public function test($id, $frontend = false)
    {
        $cache = $this->getCache();
        if ($cache !== null) {
            if (!$frontend) $cache = $cache->getBackend();
            return $this->cache->test($id);
        }
        return false;
    }

}

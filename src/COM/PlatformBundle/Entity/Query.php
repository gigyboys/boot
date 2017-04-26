<?php

namespace COM\PlatformBundle\Entity;

class Query
{
	private $query;
	
	//query
	public function setQuery($query)
    {
        $this->query = $query;

        return $this;
    }

    public function getQuery()
    {
        return $this->query;
    }
}

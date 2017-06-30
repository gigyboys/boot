<?php

namespace COM\PlatformBundle\Form\Type;

class Accessibility
{
	private $schoolsByPage;
	private $categoriesIndex;
	
	//schoolsByPage
	public function setSchoolsByPage($schoolsByPage)
    {
        $this->schoolsByPage = $schoolsByPage;

        return $this;
    }

    public function getSchoolsByPage()
    {
        return $this->schoolsByPage;
    }
	
	//categoriesIndex
	public function setCategoriesIndex($categoriesIndex)
    {
        $this->categoriesIndex = $categoriesIndex;

        return $this;
    }

    public function getCategoriesIndex()
    {
        return $this->categoriesIndex;
    }
}

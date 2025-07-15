<?php

// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: © 2021 CrowdSec <info@crowdsec.net>

namespace OPNsense\CrowdSec;

/**
 * Class ParsersController
 * @package OPNsense\CrowdSec
 */
class ParsersController extends \OPNsense\Base\IndexController
{
    public function indexAction()
    {
        $this->view->pick('OPNsense/CrowdSec/parsers');
    }
}

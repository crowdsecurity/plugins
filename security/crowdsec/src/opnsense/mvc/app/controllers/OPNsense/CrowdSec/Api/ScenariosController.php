<?php

// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: © 2021 CrowdSec <info@crowdsec.net>

namespace OPNsense\CrowdSec\Api;

use OPNsense\Base\ApiControllerBase;
use OPNsense\CrowdSec\CrowdSec;
use OPNsense\Core\Backend;

/**
 * @package OPNsense\CrowdSec
 */
class ScenariosController extends ApiControllerBase
{
    /**
     * Retrieve the installed scenarios
     *
     * @return dictionary of items, by type
     * @throws \OPNsense\Base\ModelException
     * @throws \ReflectionException
     */
    public function searchAction(): array
    {
        $rows = json_decode(trim((new Backend())->configdRun("crowdsec scenarios-list")), true);
        if ($rows === null) {
            return ["message" => "unable to retrieve data"];
        }

        $total = sizeof($rows);
        return [
            "total" => $total,
            "rowCount" => $total,
            "current" => 1,
            "rows" => $rows["scenarios"]
        ];
    }
}

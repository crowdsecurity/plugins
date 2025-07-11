{# SPDX-License-Identifier: MIT #}
{# SPDX-FileCopyrightText: © 2021 CrowdSec <info@crowdsec.net> #}

<script src="/ui/js/moment-with-locales.min.js"></script>
<script src="/ui/js/CrowdSec/crowdsec-misc.js"></script>
<script>
    "use strict";

    $(function() {
        $("#cscli_machines").UIBootgrid({
            search: '/api/crowdsec/machines/search/',
            options: {
                selection: false,
                multiSelect: false,
                formatters: {
                    "name": function(column, row) {
                        return row.machineId;
                    },
                    "ip_address": function(column, row) {
                        return row.ipAddress;
                    },
                    "last_update": function(column, row) {
                        return CrowdSec.formatters.datetime(row.updated_at);
                    },
                    "validated": function(column, row) {
                        return CrowdSec.formatters.yesno(row.isValidated);
                    }
                },
            }
        });

        updateServiceControlUI('crowdsec');
    });
</script>

<table id="cscli_machines" class="table table-condensed table-hover table-striped">
    <thead>
        <tr>
            <th data-column-id="name" data-type="string" data-identifier="true" data-formatter="name">Name</th>
            <th data-column-id="ip_address" data-type="string" data-formatter="ip_address">IP Address</th>
            <th data-column-id="last_update" data-type="string" data-formatter="last_update">Last Update</th>
            <th data-column-id="validated" data-type="string" data-formatter="validated">Validated?</th>
            <th data-column-id="version" data-type="string">Version</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    </tfoot>
</table>

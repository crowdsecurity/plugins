{# SPDX-License-Identifier: MIT #}
{# SPDX-FileCopyrightText: © 2021 CrowdSec <info@crowdsec.net> #}

<script>
    "use strict";

    $(function() {
        $("#cscli_alerts").UIBootgrid({
            search: '/api/crowdsec/alerts/search/',
            options: {
                selection: false,
                multiSelect: false,
            }
        });

        updateServiceControlUI('crowdsec');
    });
</script>

<table id="cscli_alerts" class="table table-condensed table-hover table-striped">
    <thead>
        <tr>
            <th data-column-id="id" data-type="numeric" data-order="asc">ID</th>
            <th data-column-id="value">Value</th>
            <th data-column-id="reason">Reason</th>
            <th data-column-id="country">Country</th>
            <th data-column-id="as">AS</th>
            <th data-column-id="decisions">Decisions</th>
            <th data-column-id="created_at">Created At</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    </tfoot>
</table>

{# SPDX-License-Identifier: MIT #}
{# SPDX-FileCopyrightText: © 2021 CrowdSec <info@crowdsec.net> #}

<script src="/ui/js/moment-with-locales.min.js"></script>
<script src="/ui/js/CrowdSec/crowdsec-misc.js"></script>
<script>
    "use strict";

    $(function() {
        $("#cscli_decisions").UIBootgrid({
            search: '/api/crowdsec/decisions/search/',
            options: {
                selection: false,
                multiSelect: false,
                formatters: {
                    "source": function(column, row) {
                        return row.source;
                    },
                    "scope_value": function(column, row) {
                        return row.scope + (row.value ? ':' + row.value : '');
                    },
                },
            }
        });

        updateServiceControlUI('crowdsec');
    });
</script>

<table id="cscli_decisions" class="table table-condensed table-hover table-striped">
    <thead>
        <tr>
            <th data-column-id="id" data-type="numeric" data-visible="false" data-identifier="true" data-order="asc">ID</th>
            <th data-column-id="source" data-formatter="source" data-visible="false">Source</th>
            <th data-column-id="scope_value" data-formatter="scope_value">Scope:Value</th>
            <th data-column-id="reason">Reason</th>
            <th data-column-id="action" data-visible="false">Action</th>
            <th data-column-id="country">Country</th>
            <th data-column-id="as">AS</th>
            <th data-column-id="events_count" data-type="numeric">Events</th>
            <th data-column-id="expiration">Expiration</th>
            <th data-column-id="alert_id" data-type="numeric" data-visible="false">Alert&nbsp;ID</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    </tfoot>
</table>

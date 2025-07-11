{# SPDX-License-Identifier: MIT #}
{# SPDX-FileCopyrightText: © 2021 CrowdSec <info@crowdsec.net> #}

<script>
    "use strict";

    $(function() {
        $("#cscli_postoverflows").UIBootgrid({
            search: '/api/crowdsec/postoverflows/search/',
            options: {
                selection: false,
                multiSelect: false,
            }
        });

        updateServiceControlUI('crowdsec');
    });
</script>

<table id="cscli_postoverflows" class="table table-condensed table-hover table-striped">
    <thead>
        <tr>
            <th data-column-id="name">Name</th>
            <th data-column-id="status">Status</th>
            <th data-column-id="local_version">Version</th>
            <th data-column-id="local_path">Path</th>
            <th data-column-id="description">Description</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    </tfoot>
</table>
